# Hobby Store Database - connected with Spring Data JPA
I had a group project with others to design and create a hobby store SQL database. 

This project is my solo project, to connect to that database, using Spring Data JPA. 

# Installation
1. Create and start a database instance anywhere (recommended locally), and run the SQL scripts. This will create the tables with some dummy data. 
2. Add the URL of the newly created database to the persistence.xml and application.properties files. 
3. Set the "hibernate.hbm2ddl.auto" value to "none" or "update" in the persistence.xml file.
3. All set - you can now run the program, which will execute some demonstration code. 

# Overview

* The demo will add a Customer, a Cart, a Cart Item, and a Product to the database. It then verifies this, by retrieving all of it. It then deletes the customer, cascading the delete to everything else that was added. 
* Feel free to add more database services, to play around


