# Netflix Clone Backend Project

Welcome to the backend repository for a Netflix-like application. This project aims to create a functional backend for a streaming service, featuring database design, data management, and an API layer for data interaction.

## Project Overview

This project involves designing a relational database that mimics the functionality of Netflix, with a focus on content management, user subscriptions, profiles, and watch history. We have implemented a FastAPI-based backend to interact with the database, providing a comprehensive API to support features like querying available content, managing user profiles, and maintaining a watch history.

The project showcases core backend development skills, including:
- **Database Design**: Created a MySQL database schema to store and manage data related to users, subscriptions, content, and other related entities. The database schema includes tables for managing user profiles, watch history, subscriptions, and content genres, ensuring relationships are represented using foreign keys.
- **API Development**: Set up a RESTful API using FastAPI to interact with the MySQL database. The API provides endpoints for operations such as retrieving content, managing user profiles, and exploring watch history.
- **Data Handling**: Developed endpoints to enable CRUD operations for various components of the Netflix-like service. We also plan to import fake data to demonstrate the full potential of our system.

## Technologies Used

- **FastAPI**: A modern, fast (high-performance), web framework for building APIs with Python. It has been used here to provide a RESTful API layer that interacts with the backend database.
- **MySQL**: A relational database management system used for storing all the data, including users, subscriptions, content, and profiles.
- **Docker**: Used to containerize the application, making it easy to set up and deploy in any environment. Both MySQL and FastAPI services are configured with Docker Compose for streamlined development.

## Running the Project

To run the project locally, you need Docker and Docker Compose installed. Follow these steps:

1. Clone the repository:
   ```bash
   git clone <[repository-url](https://github.com/Lcedeno14/Mini-Netflix-Database-Design.git)>
   cd netflix-clone-backend
   ```

2. Start the services using Docker Compose:
   ```bash
   docker-compose up --build
   ```

   This will set up both the MySQL database (`mysql_container`) and the FastAPI backend (`backend_container`).

3. Access the API documentation:
   - Once the backend is running, you can access the Swagger UI documentation at: [http://localhost:8001/docs](http://localhost:8001/docs).
   - The Swagger UI allows you to explore and test the available API endpoints easily.

## API Endpoints

Some of the key API endpoints available include:

- **/contents**: Retrieve a list of content filtered by parameters like maturity rating or type (e.g., "Movie" or "TV Show").
- **/profiles**: Manage user profiles, including adding new profiles, editing existing ones, and deleting profiles.
- **/watch-history**: Retrieve and manage watch history for a given user profile.

The full list of available endpoints and their usage can be explored through the [Swagger UI](http://localhost:8001/docs).

## Database Design

The MySQL database was designed to model key entities relevant to a streaming service, such as:

- **Users**: Storing user information and subscription details.
- **Content**: Information about the available movies and TV shows, including metadata such as titles, maturity ratings, and release dates.
- **Profiles**: Support for multiple user profiles per account, each with its unique settings and watch history.
- **Watch History and Genres**: Tracking viewing progress and content categorization.

The schema includes appropriate primary and foreign keys to maintain relationships between entities, such as users and their profiles or content and genres.

## Future Plans

We plan to:
- **Import Fake Data**: Populate the database with realistic fake data to demonstrate the API in action.
- **Add More Features**: Expand the backend to support more features, such as search functionality, advanced filtering, and personalized recommendations.

## Key Takeaways for Employers

This project demonstrates my ability to design and implement a complete backend solution, focusing on practical skills required for a software development role, such as:
- **Database Schema Design**: Creating normalized tables, establishing relationships, and ensuring data integrity.
- **API Development**: Building efficient and maintainable RESTful APIs using FastAPI.
- **Containerization with Docker**: Making deployment easier with Docker and Docker Compose.

Feel free to explore the codebase, try running the backend locally, and check out the API documentation to see the implementation in action. I welcome any questions or feedback regarding this project.

