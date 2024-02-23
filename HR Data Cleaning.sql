create database Project;

use project;

select * from hr;

alter table hr
change column ï»¿id emd_id varchar(20)null;

describe hr;

select * from hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
 when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
 when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
 else null
end;

alter table hr
modify column birthdate date;

update hr
set hire_date = case
 when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
 when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'),'%Y-%m-%d')
 else null
end;

alter table hr
modify column hire_date date;

select hire_date from hr;

update hr
set termdate = date((str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')))
where termdate is not null and termdate !='';

update hr 
set termdate = '0000-00-00'
where termdate = '';

alter table hr
modify column termdate date;

alter table hr 
add column age int;

update hr
set age = timestampdiff(Year,birthdate,curdate());

select birthdate, age from hr;

select 
 min(age) as youngest,
 max(age) as oldest 
from hr;

select count(*) from hr where age < 18;


