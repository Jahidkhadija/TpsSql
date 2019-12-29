--Tous les détails sur tous les employés

select * 
from employees

--Le nom, prénom et salair de chaque employé

select first_name , last_name, salary
from employees

-- Le nom, prénom et salair de chaque employé ayant un salair > 20000

select first_name,last_name,salary 
from employees
where salary > 20000

--Le nom, prénom et salair de chaque employé ayant un salair entre 6000 et 20000

select first_name,last_name,salary
from employees
where salary BETWEEN  6000 AND 20000

--Le nom, prénom et salair des employés du département 200, 201, 203 et 121 ayant un entre 6000 et 20000

select first_name,last_name,salary
from employees
where department_id in (200, 201, 203, 121) AND salary BETWEEN  6000 AND 20000

--Le nom, prénom et salair des employés des départements dont le nom commence par un E

select last_name, first_name, salary
from employees 
where last_name like 'E%'

--Le nom, prénom et salair des employés dont le JOB n’est pas 'IT_PROG', ou 'AD_VP'

select first_name,last_name,salary
from employees
where job_id not in('IT_PROG','AD_VP')

--Les ID des departements (sans redondance )

select distinct department_id
from employees

--Les salaires dans chaque département

select distinct department_id ,salary 
from employees
order by department_id

--Les salaires, le salaire augmenté de 15% dans chaque département

select salary , ((salary *0.15)+salary)as new_salary,department_id
from employees
order by department_id

--Les salaires, le salaire augmenté de 15% et la différence dans chaque  département

select department_id, salary , ((salary *0.15)+salary)as new_salary, (((salary *0.15)+salary)-salary) as difference
from employees
order by department_id

--Les salaires dans un ordre décroissant dans chaque département dans un ordre croissant

select department_id ,salary 
from employees
order by  department_id asc ,salary desc

--Les 6 premiers caractere des JOBS

select substr(job_id, 1, 6), job_id 
from employees

--Le nom, prénom et nombre de caractère du nom de chaque employé

select first_name,last_name,LENGTH(last_name)as taille_name
from employees

--Le prénom nom(dans un seul champs) et salaire de chaque employé

select CONCAT(first_name , last_name)as name ,salary
from employees

--Le prénom nom et salaire de chaque employé (sous forme: Nom: … Prenom:… Salaire:...

select CONCAT('Nom :',last_name)as last_name , CONCAT('Prenom :',first_name)as first_name, CONCAT('Salaire :',salary)as salary
from employees

--Le nom en majuscule , prénom en minuscule de chaque employé
select CONCAT( UPPER(last_name) ,LOWER(first_name) ) as Name 
from employees

--Le nom et prénom des employés només ‘david’

select first_name,last_name
from employees
where lower(first_name)='david'

--Le nom , prénom et salaire (sous forme 20,000 au lieu de 20000 ) des employés :

select first_name,last_name,TO_CHAR(salary,'99,999$') as salary 
from employees

--Le nom , prénom et date de recrutement (JJ/MM/AAAA) des employes

select last_name,first_name,TO_CHAR(hired_date,'DD/MM/YYYY') as hired_date from employees

--Le nom , prénom et date de recrutement des employés recrutés en janvier

select last_name,first_name,hire_date 
from employees
where TO_CHAR(hire_date,'MON') = 'JAN'

--Le nom , prénom et nombre mois d'ancienneté de chaque employé en ordre décroissant

select last_name,first_name,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) as nb_mois_anciennete 
from employees 
order by hire_date desc

--Le nom , prénom et nombre d'années d'ancienneté de chaque employé en ordre
décroissant

select last_name,first_name,  TO_NUMBER(TO_CHAR(sysdate,'YYYY')) -TO_NUMBER(TO_CHAR(hire_date,'YYYY')) as nombre_annees_anciennetes
from employees
order by hire_date desc

-- Le nom, prenom et nom du departement de chaque employé 

select last_name,first_name,name 
from employees E ,departments D 
where D.id= E.department_id 

--Les noms des départements dans un ordre croissant avec les éventuels employés dans chaque département.

select last_name,first_name,name 
from employees E ,departments D 
where D.id= E.department_id 
order by name ASC