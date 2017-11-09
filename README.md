# Restaurant Quality Control
This repository showcases some of the work done in back-end development for a restaurant quality management project. MySQL was used as the relational database.

## Files

* Table creation
> Tables were designed for the entities. The file script0-create-tables.sql contains the create table statements.
>
> The user entities are *customer*, *operator owner* and *inspector*. Correspondingly, tables 
>
> `registereduser, customer, inspector, operatorowner`
> 
> were created. Other entities in the problem include
> 
> `restaurant, cuisines, healthpermit, inspection, complaint,` and `item`.
> 

![preview](diagrams/schema_diagram.png)

* SQL queries
>SQL queries were constructed for each application-level operation. Each application task is described in a text file, and the corresponding sql statements are written in an sql file, e.g. fig2b.txt and sql_fig2b.sql.

For example:

A user may want to search for a restaurant based on the conjunction of health inspection score, zipcode, restaurant name, and cuisine. The user is then displayed a list of restaurants. Each of these restaurants has a score less than / greater than the user specified score, and a name, zipcode and cuisine that matches the user entered values respectively. The user is displayed a list of restaurant names, addresses, cuisines, last inspection score, and date of last inspection.

The SQL to produce this information from the data is listed in fig2b.txt

More information on the application can be found in the design-info.pdf file.

## Languages

![alt text](https://labs.mysql.com/common/logos/mysql-logo.svg?v2 "mysql logo ")





