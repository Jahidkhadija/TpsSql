--Créer les tables suivantes:
create table PIECE 
(
	NOP int not null,
	DESIGNATION varchar(30) not null, 
	COULEUR varchar(30) not null, 
	POIDS double not null
) ;
create table SERVICE 
(
	NOS int not null, 
	INTITULE varchar(30) not null, 
	LOCALISATION varchar(30) not null
) ;
create table ORDRE 
(
	NOP int not null, 
	NOS int not null, 
	QUANTITE double not null
) ;
create table NOMENCLATURE 
(
	NOPA int not null, 
	NOPC int not null, 
	QUANTITE double not null
) ;
--insérer des pièces de même numéro dans la table PIECE
insert into PIECE values( 1,'fruit','rouge',40.5);
insert into PIECE values( 2,'leguimes','vers',40);
--insérer des services de même numéro dans la table SERVICE ;
insert into SERVICE values(1,'Informatique','agadir');
insert into SERVICE values(2,'MATH','wjda');
--insérer des ordres dans la table ORDRE pour un service qui n’existe pas dans la table SERVICE
insert into ORDRE values(30,10,50.9);
--insérer dans la table NOMENCLATURE des tuples faisant référence à des pièces inexistantes dans la table PIECE.
insert into NOMENCLATURE values(19,29,59.9);
insert into NOMENCLATURE values(27,47,77);
insert into NOMENCLATURE values(67,12,69.4);
--Ajouter à toutes les tables les contraintes d’intégrité concernant les clés primaires et étrangères.
remarque : les contrainte ne vont pas s'ajouter car les tuples ne respect pas ces derniers j'ai supprimer tout ce qui'est dans les table 
alter table PIECE 
add constraint Pk_1 primary key (NOP)
alter table SERVICE
add constraint Pk_2 primary key (NOS)
alter table ORDRE 
add constraint Pk_3 primary key (NOP,NOS)
alter table NOMENCLATURE 
add constraint Pk_4 primary key (NOPA,NOPC)
alter table SERVICE 
add constraint fk_1 FOREIGN KEY (NOP) REFFERENCES PIECE(NOP)
alter table SERVICE
add constraint fk_2 FOREIGN KEY (NOS) REFFERENCES SERVICE(NOS)
alter table NOMENCLATURE 
add constraint fk_3 FOREIGN KEY (NOPA) REFFERENCES PIECE(NOP)
alter table NOMENCLATURE
add constraint fk_4 FOREIGN KEY (NOPC) REFFERENCES SERVICE(NOS)
--Corriger ou supprimer les tuples incorrects
delete from PIECE
delete from SERVICE 
delete NOMENCLATURE
delete ORDRE
--. Ajouter une contrainte de domaine sur l’attribut COULEUR, qui ne doit prendre que les valeurs ROUGE, VERTE, BLEUE et JAUNE.
alter table PIECE
add Constraint ch_1 Check COULEUR in('ROUGE','VERTE','BLEUE','JAUNE');
--Augmenter le type des attributs DESIGNATION et INTITULE de 10 caractères.
alter table PIECE
Modify DESINGATION VARCHAR(40);
ALTER TABLE SERVICE 
MODIFY INTITULE VARCHAR(40);
--Diminuer le type de l’attribut LOCALISATION de 10 caractères. 
alter table SERVICE
Modify LOCALISATION VARCHAR(20);
--Ajouter l’attribut DIRECTEUR à la table SERVICE.
alter table SERVICE 
add DIRECTEUR VARCHAR(30) not null;
--Supprimer l’attribut LOCALISATION de la table SERVICE.
alter table SERVICE
DROP LOCALISATION
--Supprimer la clé primaire de la table PIECE
impossible 
--Supprimer la contrainte de domaine sur l’attribut COULEUR
alter table PIECE
disable constraint ch_1;
--Supprimer la table NOMENCLATURE
drop NOMENCLATURE;
--Supprimer la table ORDRE en utilisant l’option CASCADE CONSTRAINTS et vérifier l’effet sur les tables PIECE et SERVICE.