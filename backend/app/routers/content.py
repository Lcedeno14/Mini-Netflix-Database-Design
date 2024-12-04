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
@router.post("/add_contents")
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
    
@router.get('/query_two/{content_name}')
async def get_last_watched_content(
    content_name: str, db=Depends(get_db),
):
    query = """
                SELECT 
                u.FName, 
                u.LName, 
                p.Name AS Profile_Name 
                FROM Watch_History w
                JOIN Profiles p ON w.Profile_ID = p.Profile_ID
                JOIN Users u ON p.User_ID = u.User_ID
                JOIN Content c ON w.Content_ID = c.Content_ID
                WHERE c.Title = %s 
                    AND w.Last_Watched_Timestamp > 1800
                GROUP BY u.User_ID, p.Profile_ID
            """    
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, content_name)
            result = await cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))
    
@router.get('/query_three/{content_name}')
async def get_last_watched_content(
    content_name: str, db=Depends(get_db),
):
    query = """
                SELECT 
                u.FName, 
                u.LName, 
                p.Name AS Profile_Name 
                FROM Watch_History w
                JOIN Profiles p ON w.Profile_ID = p.Profile_ID
                JOIN Users u ON p.User_ID = u.User_ID
                JOIN Content c ON w.Content_ID = c.Content_ID
                WHERE c.Title = %s 
                    AND w.Last_Watched_Timestamp > 1800
                GROUP BY u.User_ID, p.Profile_ID
            """    
    try: 
        async with db.cursor() as cursor:
            await cursor.execute(query, content_name)
            result = await cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving data: " + str(e))
