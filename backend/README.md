# Mini-Netflix-Database-Design

Instructions
1. Install Docker and Docker Compose.

These are typically installed by default if you install [Docker Desktop](https://www.docker.com/products/docker-desktop/). 
<br>
Look up how to install it for your OS.

2. Starting the Backend Server
   
a. Navigate to the backend directory:
 
```cd backend```

b. Run the Docker container:

```docker-compose up -d```

c. Stop the project by CTRL+C or 

```docker-compose down```


## Customizing the Database Schema
The schema for the MySQL database is located in the ```init-scripts``` directory inside the ```schema.sql``` file. 

Follow these steps to edit the schema:

1. Open the ```schema.sql``` file in your preferred text editor

Modify the file as needed to update the database schema. For example, to add a new table:

```
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```
2. Save the changes and restart the Docker container for the changes to take effect:

```docker-compose down -v```
```docker-compose up -d```
