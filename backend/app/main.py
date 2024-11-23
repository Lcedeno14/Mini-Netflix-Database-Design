from fastapi import FastAPI
from app.routers import content 
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Allow only these origins to access the backend
# origins = [
#     "http://localhost:8001",  # backend
#     "https://localhost:3307",    # db
#     # need one for front-end, maybe?
# ]

app.add_middleware (
    CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=['*'],
    allow_headers=['*'],
)

app.include_router(content.router)
