from fastapi import APIRouter, HTTPException, Depends, Path
from app.database import get_db

router = APIRouter()

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
@router.post("/contents")
async def create_content(
    content_type: str,
    title: str,
    release_date: str,
    maturity_rating: str,
    duration: str,
    video_url: str,
    trailer_url: str,
    flyer_url: str,
    db=Depends(get_db),
):
    query = """
        INSERT INTO Content (Content_Type, Title, Release_Date, Maturity_Rating, Duration, Video_URL, Trailer_URL, Flyer_URL)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (content_type, title, release_date, maturity_rating, duration, video_url, trailer_url, flyer_url)
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
                p.Profile_ID, c.Title;

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
