# Netflix Clone Backend Project

Welcome to the backend repository for a Netflix-like application. This project focuses on creating a functional backend for a streaming service, showcasing **backend development skills** such as database design, data handling, and API development.

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Technologies Used](#technologies-used)
3. [Running the Project](#running-the-project)
4. [Database and API Design](#database-and-api-design)
5. [Visual Aids](#visual-aids)

---

## Project Overview

This project involves:
- Designing a **relational database** to handle users, subscriptions, profiles, and watch history.
- Implementing a **FastAPI-based backend** with endpoints for content querying, user management, and tracking watch history.
- Using **Docker** for containerized deployment, enabling efficient setup and scaling.

The project showcases:
- **Database Design**: A MySQL schema with normalized tables and proper relationships.
- **API Development**: RESTful endpoints for CRUD operations.
- **Data Handling**: Comprehensive backend logic for content, users, and profiles.

---

## Technologies Used

- **FastAPI**: High-performance framework for building RESTful APIs in Python.
- **MySQL**: Relational database management for user and content data.
- **Docker**: Containerization tool for consistent development environments.


---

## Running the Project

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   gh repo clone Lcedeno14/Mini-Netflix-Database-Design
   cd backend
   ```

2. Start the services using Docker Compose:
   ```bash
   docker-compose up --build
   ```

   This sets up:
   - mysql_container: MySQL database
   - backend_container: FastAPI backend

4. Access the API documentation:
   - Once the backend is running, you can access the Swagger UI documentation at: [http://localhost:8001/docs](http://localhost:8001/docs).

## Database and API Design

The MySQL database models key streaming-service entities:

- Users: Stores account and subscription details.
- Profiles: Multiple profiles per account with individual settings.
- Content: Metadata for movies and TV shows.
- Watch History: Tracks user viewing progress.
- Genres: Categorizes content.
  
Key API endpoints:

- ```/contents```: Retrieve content based on filters like maturity rating or type (e.g., "Movie" or "TV Show").
- ```/profiles```: Manage profiles (create, edit, delete).
- ```/watch-history```: Retrieve and manage viewing history.
Explore the full API in the Swagger UI.


## Visual Aids
Here are screenshots illustrating the database schema and a query interface:

### ER Diagram: 
<img src="https://github.com/user-attachments/assets/a8ac42e3-dff8-4adb-a2b3-f8a2848f723f" width="900">



### Query UI: 

<img src="https://github.com/user-attachments/assets/56dae5f5-54e1-4ced-9b22-28b15d60bbf8" width="850">

These visuals provide an overview of the database structure and demonstrate how the backend enables dynamic data interaction.

