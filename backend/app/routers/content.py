# routers/content.py
from fastapi import APIRouter, HTTPException, Depends
from app.database import get_db

router = APIRouter()

@router.get("/contents")
async def get_contents(db=Depends(get_db)):
    query = "SHOW TABLES"
    try:
        async with db.cursor() as cursor:
            await cursor.execute(query)
            result = await cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail="Error retrieving tables: " + str(e))

@router.post("/contents")
async def create_content(content_type: str, title: str, release_date: str, maturity_rating: str, duration: str, video_url: str, trailer_url: str, flyer_url: str, db=Depends(get_db)):
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