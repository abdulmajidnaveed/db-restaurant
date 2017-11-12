# Guest User

Guest user has two general options: searching for restaurants and filing a complaint.

## Filing a complaint:

<iframe src='easy-fig3.txt' width='90%' height="250px"
style="border:1px solid lightgrey;"
scrolling='auto'></iframe>

SQL statements:


```
insert into customer ( phone, firstname, lastname )
 values ( customer_phoneNumber, customer_firstName, customer_lastName );

insert into complaint ( rid, phone, cdate, description )
 values ( user_selected_rest_rid, customer_phoneNumber, customer_dateOfMeal, customer_complaint );
```


<html><body><p>.sql</p>
<iframe src='page-fig3.html' width='90%' height="250px"
style="border:1px solid lightgrey;"
scrolling='auto'></iframe>
</body></html>


<!-- ![alt text](https://labs.mysql.com/common/logos/mysql-logo.svg?v2 "mysql logo ") -->
