-- write an sql query to fetch first_name from the worker table using alias name <WORKER_NAME>
select first_name as worker_name from worker;
-- write an sql query to fetch "FIRST_NAME" from the worker table in upper case
select upper(first_name) from worker;
-- write an SQL query to fetch unique values of department from the worker table
select distinct department from worker;
-- write an SQL query to print the first three characters of FIRST_NAME from the worker table
select substring(first_name,1,3) from worker; 
-- write an SQL query to find the position of the alphabet ('a') in the FIRST_NAME column'Amitabh' from the worker table
select instr(first_name, binary 'a') as Names_that_begin_with_a from worker where first_name= 'Amitabh';
-- write an SQL query to print the FIRST_NAME from the worker table after removing white spaces from the right side
select rtrim(first_name) as First_name from worker;
 -- write an SQL query to print the  DEPARTMENT from the worker table after removing white spaces from the left side
select ltrim(department) as department from worker;
-- write an sql query to fetch the unique values of DEPARMENT from worker table and prints its length'
select distinct length(department) as departmental_lenght from worker;
-- write an sql query to print FIRST_NANE from worker table after replacing 'a' with 'A'
select replace(first_name, 'a', 'A') from worker;
-- write an sql query to print FIRST_NAME and LAST_NAME from  the worker table into a single column COMPLETE_NAME A space char should separate them
select concat(first_name, ' ' ,last_name) as complete_name from worker;
-- write an SQL query to print all worker details from the worker table order by the FIRST_NAME ascending
select * from worker order by first_name  asc;
-- write an SQL query to print all worker details from the worker table order by the FIRST_NAME ascending and DEPARTMENT descending
select * from worker order by first_name asc, department desc;
-- write an SQL query to print details for workers with the FIRST_NAME 'Vipul' and 'Satish' from the worker table
select * from worker where FIRST_NAME in ('Vipul', 'Satish');
-- write an SQL query to print details for workers with DEPARTMENT name as 'Admin'
select * from worker where DEPARTMENT = 'Admin';
-- write an SQL query to print details for workers with the FIRST_NAME contains 'a'
select * from worker where FIRST_NAME like '%a%';
-- write an SQL query to print details for workers with the FIRST_NAME ends 'a'
select * from worker where FIRST_NAME like '%a';
-- write an SQL query to print details for workers with the FIRST_NAME ends with 'h' and six alphabets
select * from worker where FIRST_NAME like '_____h';
-- write an SQL query to print details of the workers whose SALARY lies between 100000 and 500000;
select * from worker where SALARY between 100000 and 500000;
-- write an SQL query to print details of the workers who joined in Feb 2021
select * from worker where year(joining_date)=2021 and month(joining_date)=2;
-- write an sql query to fetch the count of employee working in the DEPARTMENT 'Admin'
select count(*) from worker where DEPARTMENT = 'Admin';
-- write an sql query to fetch the worker names with salaries >= 50000 and <= 100000
select concat(first_name,'  ', last_name) as worker_name, salary from worker where worker_id in (select worker_id from worker where SALARY between 50000 and 100000);
-- write an sql query to fetch the number of workers for each department in descending order
select DEPARTMENT, count(WORKER_ID) No_Of_Worker from worker group by DEPARTMENT order by No_Of_Worker desc;
-- write an SQL query to print details of the workers who are also managers
select distinct w.FIRST_NAME, T.WORKER_TITLE from worker W inner join title T on W.WORKER_ID = T. WORKER_REF_ID and T.WORKER_TITLE in ('Manager');
-- write an SQL query to fetch duplicate records having matching data in the title table having  some fields of a table
select WORKER_TITLE, AFFECTED_FROM, count(*) from title group by WORKER_TITLE, AFFECTED_FROM having count(*) > 1;
-- write an SQL query to show only odds rows from a table 
select * from worker where mod (worker_id,2) <> 0;
-- write an SQL query to show only even rows from a table
select * from worker where mod (worker_id,2) = 0;
-- write an SQL query to clone new table from another table
 select * into worker_new from worker;
--  Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by SALARY desc limit 10;
--  Write an SQL query to determine the nth (say n=5) highest salary from a table.
select salary from worker order by salary desc;
-- SQL server query to find the nth highst salar: select top 1 salary from (select distinct top n salary from worker order by salary desc) order by salary asc;
-- Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
select salary from worker W1 where 4 = (select count(distinct (W2.salary)) from worker W2 where W2.salary >= W1.salary);
--  Write an SQL query to fetch the list of employees with the same salary.
select distinct W.worker_id, W.FIRST_NAME, W.salary from worker W, worker W1 where W.salary = W1.SALARY and  W.worker_id != W1.worker_id;
-- Write an SQL query to show the second-highest salary from a table.
select max(SALARY) as highest_salary from worker where SALARY not in (select max(SALARY) from worker);
--  Write an SQL query to show one row twice in the results from a table.
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' union all select FIRST_NAME, DEPARTMENT from worker W1 where W1.DEPARTMENT='HR';
-- Write an SQL query to fetch the first 50% of records from a table.
select * from worker where WORKER_ID<=(select count(WORKER_ID)/2 from worker);
-- Write an SQL query to fetch the departments that have less than five people in them.
select DEPARTMENT, count(WORKER_ID) as 'No of workers' from worker where department < 5 group by department;
-- Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT, count(DEPARTMENT) as 'No of people' from worker group by DEPARTMENT;
--  Write an SQL query to show the last record from a table.
select * from worker order by WORKER_ID desc limit 1; select * from worker where WORKER_ID = (select max(WORKER_ID) from worker);
--  Write an SQL query to fetch the first row of a table.
select * from worker order by WORKER_ID limit 1; select * from worker where worker_id = (select min(worker_id) from worker);
--  Write an SQL query to fetch the last five records from a table.
select * from worker order by JOINING_DATE desc limit 5;
-- Write an SQL query to print the names of employees having the highest salary in each department.

--  Write an SQL query to fetch three max salaries from a table.
select distinct salary from worker a where 3 >= (select count(distinct salary) from worker b where a.salary <= b.salary) order by a.salary desc;
--  Write an SQL query to fetch three min salaries from a table.
select distinct salary from worker a where 3 >= (select count(distinct salary) from worker b where a.salary >= b.salary) order by a.salary desc;
--  Write an SQL query to fetch nth max salaries from a table.
select distinct SALARY from worker a where n>= (select count(distinct salary) from worker b where a.SALARY <= b.salary) order by a.salary desc;
-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
select DEPARTMENT, sum(SALARY) from worker group by DEPARTMENT; 
--  Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker where salary= (select max(SALARY) from worker);













