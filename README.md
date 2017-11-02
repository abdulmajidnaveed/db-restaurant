# Restaurant Quality Control
This repository showcases some of the work done in back-end development for a restaurant quality control management project. MySQL was used as the relational database.

## Files

* Table creation
Tables were designed for the entities. The file script0-create-tables.txt contains the create table statements. The tables setup were for customer, registereduser, inspector, cuisines, operatorowner, restaurant, healthpermit, item, inspection, complaint.

* 
SQL queries were constructed for each application-level operation.

These files are named following the format sql_figxx.txt, and each corresponds to a particular user operation.

For example:

A user may want to search for a restaurant based on the conjunction of health inspection score, zipcode, restaurant name, and cuisine. The user is then displayed a list of restaurants. Each of these restaurants has a score less than / greater than the user specified score, and a name, zipcode and cuisine that matches the user entered values respectively. The user is displayed a list of restaurant names, addresses, cuisines, last inspection score, and date of last inspection.

The SQL to produce this information from the data is listed in sql_fig2b.txt

More information on the application can be found in the design-info.pdf file.







