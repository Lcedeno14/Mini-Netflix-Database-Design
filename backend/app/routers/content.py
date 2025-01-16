from fastapi import APIRouter, HTTPException, Depends, Path, Request
from fastapi.security import OAuth2PasswordRequestForm
from passlib.context import CryptContext
from jose import jwt, JWTError
from app.database import get_db
from datetime import date
from pydantic import BaseModel

# Needed for JWT -- necessary for users to access authorized pages (profile, personal content etc.)
SECRET_KEY = ""
ALGORITHM = "HS256" # chatgpt recommended using this 

# hash passwords
hash_pwd = CryptContext(schemes=['bcrypt'], deprecated='auto')

router = APIRouter()


#adding the functions here for ease of use... MOVE AFTER FINAL CHECK FOR FUNCTIONALITY
async def create_user(db, email: str, password: str):
    hashed_password = hash_pwd.hash(password)
    async with db.cursor() as cursor:
        await cursor.execute("SELECT * FROM temp_users WHERE email = %s", (email,))
        existing_user = cursor.fetchone()
        if existing_user:
            raise HTTPException(status_code=400, detail="User with this email already exists") #confirm the status codes 
        await cursor.execute(
            'INSERT INTO temp_users (email, hashed_password) VALUES (%s, %s)',
            (email, hashed_password)
        ) 

async def authenticate_user(db, email:str, password:str):
    async with db.cursor() as cursor:
        await cursor.execute('SELECT * FROM temp_users WHERE email = %s', (email,))
        user = await cursor.fetchone()

        if not user or not hash_pwd.verify(password, user['hashed_password']):
            return None
        return user
    

@router.post('/signup')
async def signup(request: Request, db=Depends(get_db)):
    body = await Request.json()
    if not body.get('email') or not body.get('password'):
        raise HTTPException(status_code=400, detail="Email and password are required.") #confirm the status codes
    await create_user(db, body['email'], body['password'])
    # REQUIRES generating and returning JWT token for access to authorized apps
    return

@router.post('/signin')
async def signin(request: Request, db=Depends(get_db)):
    body = await Request.json()
    if not body.get('email') or not body.get('password'):
        raise HTTPException(status_code=400, detail="Email and password are required.") #confirm the status codes
    user = await authenticate_user(db, body['email'], body['password'])

    if not user:
        raise HTTPException(status_code=401, detail="Invalid credentials!") #confirm the status codes
    
    # REQUIRES generating and returning JWT token for access to authorized apps
    return

class ContentData(BaseModel):
    content_type: str
    title: str
    summary: str
    release_date: date
    maturity_rating: str
    duration: int
    video_url: str
    trailer_url: str
    flyer_url: str
    manager_id: int

# Utility function to validate table names
VALID_TABLES = {
    "Cast",
    "Content",
    "Content_Genre",
    "Device",
    "Episodes",
    "Genre",
    "Manager",
    "Payment_History",
    "Profile_Watchlist",
    "Profiles",
    "Subscription_Type",
    "Users",
    "Watch_History",
}

def validate_table_name(table_name: str):
    if table_name not in VALID_TABLES:
        raise HTTPException(
            status_code=400, detail=f"Invalid table name: {table_name}. Valid tables: {', '.join(VALID_TABLES)}"
        )

# GET: Retrieve table names
@router.get("/tables")
async def get_tables(db=Depends(get_db)):
    query = "SHOW TABLES"
    try:
        async with db.cursor() as cursor:
            await cursor.execute(query)
            result = await cursor.fetchall()
        return {"tables": [row[0] for row in result]}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving tables: " + str(e))

# GET: Retrieve contents of a specific table
@router.get("/show_contents/{table_name}")
async def get_table_contents(
    table_name: str = Path(..., description="The name of the table to retrieve data from."),
    db=Depends(get_db),
):
    validate_table_name(table_name)
    query = f"SELECT * FROM {table_name}"
    try:
        async with db.cursor() as cursor:
            await cursor.execute(query)
            result = await cursor.fetchall()
        return {"data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))

# POST: Add content to the Content table
@router.post("/add_contents")
async def create_content(
    content: ContentData,
    db=Depends(get_db),
):
    values = (
        content.content_type,
        content.title,
        content.summary,
        content.release_date,
        content.maturity_rating,
        content.duration,
        content.video_url,
        content.trailer_url,
        content.flyer_url,
        content.manager_id,
    )
    print(values)
    query = """
        INSERT INTO Content (Content_Type, Title, Summary, Release_Date, Maturity_Rating, Duration, Video_URL, Trailer_URL, Flyer_URL, Manager_ID)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    
    try:
        async with db.cursor() as cursor:
            await cursor.execute(query, values)
            await db.commit()
        return {"message": "Content created successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error creating content: " + str(e))
    
@router.get('/query_one/{user_email}')
async def get_profiles(
    user_email: str, db=Depends(get_db),
): 
    query = """SELECT u.Email, COUNT(p.Profile_ID) AS Profile_Count
               FROM Users u
               LEFT JOIN Profiles p ON u.User_ID = p.User_ID
               WHERE u.Email = %s
               GROUP BY u.Email;
            """
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, user_email)
            result = await cursor.fetchall()
        return {"email": result[0][0], "profile_count": result[0][1]} if result else {"message": "No profiles found"}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))
    
@router.get('/query_two/{genre}')
async def get_movies_by_genre(
    genre: str, db=Depends(get_db),
):
    query = """
       SELECT DISTINCT u.FName AS User_First_Name, 
                        u.LName AS User_Last_Name, 
                        c.Content_ID,  -- Include Content_ID for debugging
                        c.Title AS Movie_Title
        FROM Users u
        JOIN Profiles p ON u.User_ID = p.User_ID
        JOIN Watch_History wh ON p.Profile_ID = wh.Profile_ID
        JOIN Content c ON wh.Content_ID = c.Content_ID
        WHERE c.Content_ID IN (
            SELECT cg.Content_ID
            FROM Content_Genre cg
            JOIN Genre g ON cg.Genre_ID = g.Genre_ID
            WHERE g.Genre_Name = %s
        ) AND c.Content_Type = 'Movie';
    """    
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, (genre,))
            rows = await cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]  # Get column names
        # Combine column names with rows for structured response
        return {"columns": columns, "data": rows}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error retrieving data: {e}")

    
@router.get('/query_three/{age}')
async def get_last_watched_content(
    age: int, db=Depends(get_db),
):
    query = """
            SELECT 
                p.Profile_ID,
                p.Name AS Profile_Name,
                p.Age,
                c.Content_ID,
                c.Title AS Movie_Title
            FROM 
                Profiles p
            JOIN 
                Watch_History wh ON p.Profile_ID = wh.Profile_ID
            JOIN 
                Content c ON wh.Content_ID = c.Content_ID
            WHERE 
                p.Age < %s AND c.Content_Type = 'Movie'
            GROUP BY 
                p.Profile_ID, p.Name, p.Age, c.Content_ID, c.Title
            ORDER BY 
                p.Profile_ID, c.Content_ID;

            """    
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, age)
            rows = await cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]  # Get column names
        # Combine column names with rows for structured response
        return {"columns": columns, "data": rows}
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: {e}")

@router.get('/query_five/{actor_name}')
async def get_last_watched_content(
    actor_name: str, db=Depends(get_db),
):
    query = """
                SELECT 
                    Content.Title AS Movie_Title,
                    Content.Release_Date AS Release_Date,
                    Cast.Position AS Actor_Role
                FROM 
                Content JOIN Cast ON Content.Content_ID = Cast.Content_ID
                WHERE 
                    Content.Content_type = 'Movie'
                    AND Content.Release_Date BETWEEN '2000-01-01' AND '2010-12-31'
                    AND Cast.Name = %s
                ORDER BY Content.Release_Date;
            """    
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, actor_name)
            result = await cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))


@router.get('/get_db_info')
async def get_last_watched_content(
    db=Depends(get_db),
):
    query = """
                SELECT 
                TABLE_NAME,
                COLUMN_NAME,
                COLUMN_TYPE
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_NAME IN ('Users', 'Profiles', 'Content', 'Cast', 'Device', 'Episodes',
                                    'Genre', 'Manager', 'Payment_History', 'Profile_Watchlist', 'Subscription_Type',
                                    'Watch_History')
            """
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query)
            result = await cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))

