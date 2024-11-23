#connects to the database here
import aiomysql
from fastapi import HTTPException

async def get_connection():
    try:
        connection = await aiomysql.connect(
            host="db",
            port=3306,
            user="user",
            password="password",
            db="netflix",
            autocommit=True
        )
        return connection
    except Exception as e: 
        raise HTTPException(status_code=500, detail="Database connection failed: " + str(e))

async def get_db():
    connection= await get_connection()
    try:
        yield connection
    finally:
        connection.close()