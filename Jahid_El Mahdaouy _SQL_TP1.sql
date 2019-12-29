--Tous les d�tails sur tous les employ�s

select * 
from employees

--Le nom, pr�nom et salair de chaque employ�

select first_name , last_name, salary
from employees

-- Le nom, pr�nom et salair de chaque employ� ayant un salair > 20000

select first_name,last_name,salary 
from employees
where salary > 20000

--Le nom, pr�nom et salair de chaque employ� ayant un salair entre 6000 et 20000

select first_name,last_name,salary
from employees
where salary BETWEEN  6000 AND 20000

--Le nom, pr�nom et salair des employ�s du d�partement 200, 201, 203 et 121 ayant un entre 6000 et 20000

select first_name,last_name,salary
from employees
where department_id in (200, 201, 203, 121) AND salary BETWEEN  6000 AND 20000

--Le nom, pr�nom et salair des employ�s des d�partements dont le nom commence par un E

select last_name, first_name, salary
from employees 
where last_name like 'E%'

--Le nom, pr�nom et salair des employ�s dont le JOB n�est pas 'IT_PROG', ou 'AD_VP'

select first_name,last_name,salary
from employees
where job_id not in('IT_PROG','AD_VP')

--Les ID des departements (sans redondance )

select distinct department_id
from employees

--Les salaires dans chaque d�partement

select distinct department_id ,salary 
from employees
order by department_id

--Les salaires, le salaire augment� de 15% dans chaque d�partement

select salary , ((salary *0.15)+salary)as new_salary,department_id
from employees
order by department_id

--Les salaires, le salaire augment� de 15% et la diff�rence dans chaque  d�partement

select department_id, salary , ((salary *0.15)+salary)as new_salary, (((salary *0.15)+salary)-salary) as difference
from employees
order by department_id

--Les salaires dans un ordre d�croissant dans chaque d�partement dans un ordre croissant

select department_id ,salary 
from employees
order by  department_id asc ,salary desc

--Les 6 premiers caractere des JOBS

select substr(job_id, 1, 6), job_id 
from employees

--Le nom, pr�nom et nombre de caract�re du nom de chaque employ�

select first_name,last_name,LENGTH(last_name)as taille_name
from employees

--Le pr�nom nom(dans un seul champs) et salaire de chaque employ�

select CONCAT(first_name , last_name)as name ,salary
from employees

--Le pr�nom nom et salaire de chaque employ� (sous forme: Nom: � Prenom:� Salaire:...

select CONCAT('Nom :',last_name)as last_name , CONCAT('Prenom :',first_name)as first_name, CONCAT('Salaire :',salary)as salary
from employees

--Le nom en majuscule , pr�nom en minuscule de chaque employ�
select CONCAT( UPPER(last_name) ,LOWER(first_name) ) as Name 
from employees

--Le nom et pr�nom des employ�s nom�s �david�

select first_name,last_name
from employees
where lower(first_name)='david'

--Le nom , pr�nom et salaire (sous forme 20,000 au lieu de 20000 ) des employ�s :

select first_name,last_name,TO_CHAR(salary,'99,999$') as salary 
from employees

--Le nom , pr�nom et date de recrutement (JJ/MM/AAAA) des employes

select last_name,first_name,TO_CHAR(hired_date,'DD/MM/YYYY') as hired_date from employees

--Le nom , pr�nom et date de recrutement des employ�s recrut�s en janvier

select last_name,first_name,hire_date 
from employees
where TO_CHAR(hire_date,'MON') = 'JAN'

--Le nom , pr�nom et nombre mois d'anciennet� de chaque employ� en ordre d�croissant

select last_name,first_name,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) as nb_mois_anciennete 
from employees 
order by hire_date desc

--Le nom , pr�nom et nombre d'ann�es d'anciennet� de chaque employ� en ordre
d�croissant

select last_name,first_name,  TO_NUMBER(TO_CHAR(sysdate,'YYYY')) -TO_NUMBER(TO_CHAR(hire_date,'YYYY')) as nombre_annees_anciennetes
from employees
order by hire_date desc

-- Le nom, prenom et nom du departement de chaque employ� 

select last_name,first_name,name 
from employees E ,departments D 
where D.id= E.department_id 

--Les noms des d�partements dans un ordre croissant avec les �ventuels employ�s dans chaque d�partement.

select last_name,first_name,name 
from employees E ,departments D 
where D.id= E.department_id 
order by name ASC