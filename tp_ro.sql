
-- A) Liste des maladies des animaux dans des cages de fonction 'fauve'
SELECT TABLE(a.liste_maladies) 
FROM LesAnimaux a 
WHERE a.fonction_cage = 'fauve';


-- B) Maladies des animaux en 'fauve' contractées en 2022
SELECT VALUE(m) 
FROM LesAnimaux a, TABLE(a.liste_maladies) m
WHERE a.fonction_cage = 'fauve' 
  AND EXTRACT(YEAR FROM m.datem) = 2022;

-- C) Nom de l'animal, date et nom des maladies en 'fauve' en 2022
SELECT a.nomA, m.datem, m.nomm
FROM LesAnimaux a, TABLE(a.liste_maladies) m
WHERE a.fonction_cage = 'fauve' 
  AND EXTRACT(YEAR FROM m.datem) = 2022;

-- D) Liste des employés qui sont gardiens
SELECT VALUE(g)
FROM lesemployes e
WHERE e IS OF (tgardien);
-- E) Liste des cages gardées par "Lachaize"
SELECT TABLE(TREAT(e AS tgardien).liste_cages)
FROM lesemployes e
WHERE e.nomE = 'Lachaize';
