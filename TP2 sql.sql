--Creation de la table DEPT 
create table DEPT (
	DEPTNO int not null PRIMARY KEY, 
	DNAME VARCHAR(30) not null, 
	LOC VARCHAR(30) not null,
	CONSTRAINT D_DOM CHECK (DNAME IN
      ('ACCOUNTING','RESEARCH','SALES','OPERATIONS')
)
--Remplissage de la table DEPT
insert into DEPT values (10,'ACCOUNTING','NEW-YORK');
insert into DEPT values (20,'RESEARCH','DALLAS');
insert into DEPT values (30,'SALES','CHICAGO');
insert into DEPT values (40,'OPERATIONS','BOSTON');
--Recopier la table EMP en passant la commande suivante :
CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;
-- Insérer le tuple (7369, ‘Bidon’, NULL, NULL, NULL, NULL, NULL, NULL) dans la table EMP.
insert into EMP values (7369, ‘Bidon’, NULL, NULL, NULL, NULL, NULL, NULL);
--Ça fonctionne. Est-ce normal ?
oui sa fonctionne bien 
--Annuler l’insertion précédente.
delete 
from EMP 
where EMPNO=7396
-- Ajouter les contraintes d’intégrité nécessaires à la table EMP (clé primaire et clés
étrangères) à l’aide de la commande ALTER TABLE EMP ADD CONSTRAINT…
*****foreign key :*******
alter table EMP
add constraint fr_1 Foreign key (DEPTNO) refferences DEPT(DEPTNO);
*****primary key *****
alter table EMP 
add constraint pr1 primary key (EMPNO )
-- Dans EMP, ajouter les nouveaux employés 
insert into EMP VALUES(7369, 'WILSON', 'MANAGER', 7839, '17/11/91', 3500.00, 600.00, 10); 
insert into EMP VALUES(7657, 'WILSON','MANAGER', 7839, '17/11/91', 3500.00, 600.00, 50); 
insert into EMP VALUES(7657, 'WILSON', 'MANAGER', 7000,'17/11/91', 3500.00, 600.00, 10);
insert into EMP VALUES(7657, 'WILSON', 'MANAGER', 7839, '17/11/91', 3500.00,600.00, 10);
-- Remarques ?
c'est le meme employees qui se repete la seul attribt differents est EMPNO
--Valider l’insertion précédente.
commit
-- Changer la localisation (LOC) du département SALES de CHICAGO à PITTSBURGH.
update DEPT set DNAME ='PITTSBURGH' WHERE DNAME='SALES'
-- Dans EMP, augmenter de 10 % le salaire (SAL) des vendeurs dont la commission (COMM) est supérieure à 50 % du salaire.
update EMP set SAL= SAL+(SAL*0.1) where COMM > (SAL*0.5)
--Dans EMP, attribuer aux employés en poste avant le 01/01/82 (HIREDATE) et ayant une commission non spécifiée (NULL) une commission égale à la moyenne des commissions
update EMP set COMM = (select AVG(COMM) from EMP) where HIREDATE < '01/01/82' and COMM is null
--Annuler les trois mises à jour précédentes
Rollback
--Dans DEPT, supprimer le département n° 20 (DEPTNO). Remarque ?
delete from DEPT where DEPTNO=20 
impossible a cause des contraints d'intégrités 
--Nom (ENAME), salaire, commission, salaire+commission de tous les vendeurs (SALESMAN).
select ENAME ,COMM, SAL,SUM(SAL,COMM)as sal_com 
from EMP
where JOB='SALESMAN'
-- Nom des vendeurs par ordre décroissant du ratio commission/salaire.
select ENAME
from EMP
order by (COMM/SAL) desc
-- Nom des vendeurs dont la commission est inférieure à 25% de leur salaire.
select ENAME 
from EMP
where COMM < (SAL * 0.25)
-- Nombre d'employés du département n° 10.
select count(EMPNO) 
from EMP 
where DEPTNO=10
--Nombre d'employés ayant une commission.
select count(EMPNO) as nombre_employes
from EMP 
where COMM is NOT NULL
-- Nombre de fonctions (JOB) différentes.
select distinct(JOB)
from EMP
-- Salaire moyen par fonction (sans tenir compte des commissions).
select AVG(SAL) ,JOB
from EMP 
group by JOB
--Total des salaires du département SALES
select SUM(SAL)
from EMP E ,DEPT D
where E.DEPTNO=D.DEPTNO and D.DNAME='SALES'
--Nom des employés avec le nom de leur département 
select ENAME,DNAME
from EMP E ,DEPT D
where E.DEPTNO=D.DEPTNO
--Nom, fonction et salaire de l'employé ayant le salaire le plus élevé.
select ENAME,SAL
from EMP 
where SAL >= ALL(select SAL from EMP)
--Nom des employés gagnant plus que JONES.
select ENAME
from EMP
where SAL > (select SAL from EMP where ENAME ='JONES')
--Nom des employés occupant la même fonction que JONES
select ENAME
from EMP 
where JOB = (select JOB from EMP where ENAME='JONES') and ENAME<>'JONES'
--Nom des employés ayant même manager (MGR) que CLARK.
select ENAME
from EMP 
where MGR = (select MGR from EMP where ENAME='CLARK')and ENAME<>'CLARK'
-- Nom et fonction des employés ayant même fonction et même manager que TURNER
select ENAME,JOB
from EMP
WHERE (JOB,MGR) in (select JOB,MGR from EMP where ENAME='TURNER')AND ENAME<>'TURNER';
--Nom des employés embauchés avant tous les employés du département n° 10.
select ENAME
from EMP
where HIREDATE < all(select HIREDATE from EMP where DEPTNO=10)
--Liste des employés en indiquant pour chacun son nom et celui de son manager
select emp.ENAME,man.ENAME
from EMP emp ,EMP man
where emp.EMPNO!=ma.EMPNO and emp.MGR=ma.ENAME
--Nom des employés ne travaillant pas dans le même département que leur manager.
select emp.ENAME,man.ENAME
from EMP emp ,EMP man
where emp.EMPNO!=ma.EMPNO and emp.MGR=ma.ENAME and emp.DEPTNO!= mn.DEPTNO