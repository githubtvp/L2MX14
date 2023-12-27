drop table employee;

create table employee(empno number(4) primary key,
                    fname varchar(50) not null,
                    lname varchar(50) not null,
                    job varchar(15),
                    mgr number(4) constraint fk_1 references employee(empno),
                    dob date CONSTRAINT chk_date CHECK(dob < '01-Jan-1976'),
                    hiredate date,
                    salary number(10,2) constraint sal_Chk check(salary between 20000 and 100000),
                    comm number(10,2)
                    );  
                    
                    
insert into employee values (7839, 'Robert', 'James', 'President', NULL, '11-09-1972', 
      '11-01-2003', 65000, null );  
   
insert into employee values (8698, 'Victor', 'Hugo', 'Salesman', 7698, '07-02-1969', 
      '25-02-2008', 21250, 13400);          
                    
insert into employee values (7782, 'Ramana', 'Samy', 'Manager', 7839, '06-09-1973', 
      '16-09-2008', 42450, 23230 );

insert into employee values (7566, 'Palani', 'Velappan', 'Manager', 7839, '04-02-1972', 
      '14-02-2006', 42975, 19455 );

insert into employee values (8654, 'Arun', 'Swamy', 'Salesman', 7698, '07-06-1969', 
      '21-08-2006', 21250, 13400 );
insert into employee values (8782, 'Raman', 'Palani', 'Manager', 7839, '09-06-1965', 
      '06-08-2008', 42450, 23230 );

commit;
insert into employee values (&empno, '&fname', '&lname', '&job', &mgr, '&dob', 
      '&hiredate', &salary, &comm );
      
--1. select * from employee;
--2. select * from employee where salary > 3000 and dob between '01-01-1965' and '31-12-1975';
--3. select fname, lname from employee where dob < '12-Sep-1993'; 
--4. select fname, lname, salary from employee where job in ('Analyst Manager', 'Manager');
--5. select lname from employee where lname like'%an%';
--6. select fname from employee where fname like 'K%' or fname like 'S%';
-- 7. select * from employee where dob = 
-- (select min(dob) from employee); 
--8. select empno, fname, lname, job, salary from employee 
--where salary >= 30000 and job in ('Analyst Manager', 'Manager');

--9. select empno, fname, lname, job, salary, comm, (salary + comm) from employee
--where (salary + comm ) > 40000 and job in ('Salesman', 'Manager');
--10. select fname, lname, job, salary from employee
--where job in('Salesman', 'Programmer');
--11. select empno, lname, salary from employee where lname in('Kumar', 'Manian','Muthu', 'Ram');
--12. select empno, ROUND ( (SYSDATE - TO_DATE(dob))/365) as Age,
--lname, salary from employee where ROUND ( (SYSDATE - TO_DATE(dob))/365) between 30 and 60;
select fname, lname, job, mgr from employee
     where mgr not in 
    (select mgr from employee where lname in ('Raman', 'Saravanan', 'Nadarajan'));
--7839, 7566, 
--select mgr from employee where lname in ('Raman', 'Saravanan', 'Nadarajan');

--14. select fname, lname, job from employee
--  where job not in ('Analyst Manager', 'Manager');
select * from employee
where comm is not null and dob =
(select max(dob) from employee);

select max(dob) from employee;






