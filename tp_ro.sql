-- Partie 1 : Schéma relationnel objet

-- Création du type objet pour les maladies
type Maladie_t AS OBJECT (
    date_maladie DATE,
    nom_maladie VARCHAR2(100)
);
/

-- Création d'une table imbriquée pour les maladies
type Maladies_t AS TABLE OF Maladie_t;
/

-- Création du type objet pour les cages
type Cage_t AS OBJECT (
    num_cage NUMBER,
    fonction VARCHAR2(50),
    num_allee NUMBER
);
/

-- Création du type objet pour les employés
type Employe_t AS OBJECT (
    nom VARCHAR2(100),
    adresse VARCHAR2(200),
    specialites VARRAY(10) OF VARCHAR2(50)
);
/

-- Type objet pour les responsables d'allée
type Responsable_t UNDER Employe_t (
    num_allee NUMBER
);
/

-- Type objet pour les gardiens
type Gardien_t UNDER Employe_t (
    cages_surveillees TABLE OF Cage_t
);
/

-- Création de la table des animaux
CREATE TABLE Animaux (
    nom VARCHAR2(100) PRIMARY KEY,
    sexe CHAR(1),
    type_espece VARCHAR2(50),
    fonction_cage VARCHAR2(50),
    date_naissance DATE,
    pays_origine VARCHAR2(100),
    cage REF Cage_t,
    maladies Maladies_t
) NESTED TABLE maladies STORE AS maladies_tab;

-- Création de la table des cages
CREATE TABLE Cages OF Cage_t (
    PRIMARY KEY (num_cage)
);

-- Création de la table des employés
CREATE TABLE Employes OF Employe_t;

-- Création de la table des responsables d'allée
CREATE TABLE Responsables OF Responsable_t;

-- Création de la table des gardiens
CREATE TABLE Gardiens OF Gardien_t NESTED TABLE cages_surveillees STORE AS cages_surveillees_tab;

-- Partie 2 : Interrogation

-- A) Liste des maladies des animaux dans des cages de fonction 'fauve'
SELECT a.maladies
FROM Animaux a
WHERE a.fonction_cage = 'fauve';

-- B) Maladies des animaux en 'fauve' contractées en 2022
SELECT VALUE(m)
FROM Animaux a, TABLE(a.maladies) m
WHERE a.fonction_cage = 'fauve'
AND EXTRACT(YEAR FROM m.date_maladie) = 2022;

-- C) Nom de l'animal, date et nom des maladies en 'fauve' en 2022
SELECT a.nom, m.date_maladie, m.nom_maladie
FROM Animaux a, TABLE(a.maladies) m
WHERE a.fonction_cage = 'fauve'
AND EXTRACT(YEAR FROM m.date_maladie) = 2022;

-- D) Liste des employés qui sont gardiens
SELECT VALUE(g)
FROM Employes e
WHERE TREAT(VALUE(e) AS Gardien_t) IS OF (ONLY Gardien_t);

-- E) Liste des cages gardées par "Lachaize"
SELECT g.cages_surveillees
FROM Gardiens g
WHERE g.nom = 'Lachaize';
