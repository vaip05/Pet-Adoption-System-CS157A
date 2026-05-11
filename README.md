# CS157A Pet Adoption System

Java web application that implements a three-tier architecture using:
- Presentation layer: JSP, HTML, CSS
- Application layer: Java Servlets, DAO classes, JDBC
- Data layer: MySQL

## Project Structure
- `sql/create_schema.sql` - database creation and table definitions
- `sql/initialize_data.sql` - sample data (15 rows per table)
- `src/main/java/.../model` - Java model classes
- `src/main/java/.../dao` - JDBC data access classes
- `src/main/java/.../servlet` - controllers / application logic
- `src/main/webapp/WEB-INF/views` - JSP pages

## Features Implemented
### Pets
- Display all pets
- Display only available pets
- Add new pet
- Update pet information
- Delete pet record

### Adoption Applications
- Display all applications
- Submit new application
- Update application status
- Delete application

### Reference Views
- Display shelter list
- Display adopter list

## How to Run

### 1. Create and initialize the MySQL database
Run these scripts in MySQL in order:

1. `sql/create_schema.sql`
2. `sql/initialize_data.sql`

### 2. Update database credentials
Edit:

`src/main/resources/db.properties`

Set your MySQL username and password:

```properties
db.url=jdbc:mysql://localhost:3306/pet_adoption
db.username=root
db.password=your_password
### 3. Build the project
Using Maven:
```bash
mvn clean package
```

### 3.Build the project
Using Maven;
`mvn clean package`

### 4. Apache Tomcat Setup

This project requires Apache Tomcat 10 or later to run.

### Download Tomcat
Download Apache Tomcat from:  
https://tomcat.apache.org/

Extract the folder to a location on your computer.


### Deploy the Application
After building the project using Maven:

```bash
mvn clean package
```

Copy the generated WAR file:

```text
target/pet-adoption-system.war
```

into the Tomcat `webapps` directory:

```text
apache-tomcat-10.x.x/webapps/
```

---

### Start Tomcat

Navigate to the Tomcat `bin` folder and run:

**Mac/Linux:**
```bash
./startup.sh
```

**Windows:**
```cmd
startup.bat
```

### 4. Access the Application

Open your browser and go to:

```text
http://localhost:8080/pet-adoption-system/
```


## Mapping to Project Requirements
- Uses Java and JDBC directly
- Executes SQL statements manually in DAO classes
- Supports SELECT, INSERT, UPDATE, DELETE
- Uses 4 relational tables
- Includes 15 rows in each table
- Uses foreign keys and constraints
- Follows three-tier architecture

## Future Improvements
- Add login roles for shelter staff vs adopter users
- Auto-mark pet status as pending after application submission
