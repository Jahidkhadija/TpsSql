Exercice1 :
Q1 : Donnez la liste des avions dont la capacité est supérieure à 350 passagers. 
Select *
From airplane
Where capacity >350
Q2 : Quels sont les numéros et noms des avions localisés à Nice ? 
Select  NumAp,NameAp
From airplane
Where localisation=’Nice’ ;
 Q3 : Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ? 
Select NumP, Dep_T,
From flight
Q4 : Donnez toutes les informations sur les pilotes de la compagnie. 
Select *
From Pilot
Q5 : Quel est le nom des pilotes domiciliés à Paris dont le salaire est supérieur à 15000 ? 
Select NameP
From pilot
Where Address=’Paris’ and salary > 15000
Q6 : Quels sont les avions (numéro et nom) localisés à Nice ou dont la capacité est inférieure à 350 passagers ? 
Select NumAp,NameAp
From airplane
Where localization=’Nice’ and capacity <350
Q7 : Liste des vols au départ de Nice allant à Paris après 18 heures ? 
Select  *
From flight
Where Dep_T=’Nice’ and  Arr_T=’ Paris’ and Arr_H= Dep_H+18
Q8 : Quels sont les numéros des pilotes qui ne sont pas en service ? 
Select NumP
From pilot
Where NumP Not In (select NumP
From flight)
Q9 : Quels sont les vols (numéro, ville de départ) effectués par les pilotes de numéro 100 et 204 ? 
Select NumF, Dep_T
From flight
Where NumP in(100,204)
Exercice2:
1. Quelles sont les personnes ayant emprunté le livre "Recueil Examens BD" ?
Select *
From Emprunt 
Where livre=’Recueil Examens BD’
2. Quelles sont les personnes n'ayant jamais rendu de livre en retard ?
Select Personne 
From Emprunt
Where Personne in(
Select Personne 
From Retard) 
3. Quelles sont les personnes ayant emprunté tous les livres (empruntés au moins une fois) ?
Select Personne from Emprunt where Livre = all (select Livre from Emprunt) and count(DateEmprunt)>=1
4. Quels sont les livres ayant été empruntés par tout le monde (i.e. tous les emprunteurs) ?
Select livre from Emprunt where Personne = all (select Personne  from Emprunt)
5. Quelles sont les personnes ayant toujours rendu en retard les livres qu'elles ont empruntés ?
Select Personne 
From retard

