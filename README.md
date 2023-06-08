Exercice – Jointures et Requêtes imbriquées
Question 1
Ouvrez SSMS et implantez les tables "etudiant", "cours" et "etudiant_cours" dans une BD Cegep:

etudiantId   prenom     nom
1            Marie      Vière
2            Alex       Terrieur
3            Alain      Terrieur
4            Gille      Éparballe
5            Alain      Verse

coursId      titre
1            Philosophie
2            Introduction à la productivité
3            Viennoiserie - Spécialité Chocolatine

etudiantId  coursId     dateDebut       dateFin         noteFinale
1           3           2022-08-29      NULL            NULL
2           3           2022-08-29      NULL            NULL
3           3           2022-08-29      NULL            NULL
4           3           2022-01-03      2022-06-06      54
5           3           2022-01-03      NULL            NULL
5           3           2022-08-29      NULL            NULL
1           1           2022-01-03      2022-06-06      81
2           1           2022-01-03      2022-06-06      50
3           1           2022-01-03      2022-06-06      75
4           1           2022-01-03      2022-06-06      45
5           1           2022-01-03      NULL            NULL

• Écrivez les requêtes suivantes :

1. Affichez le titre de tous les cours qui contiennent la lettre 'c' dans le titre

2. Affichez les étudiants qui suivent au moins deux cours avec le nombre de cours suivi (dateFin IS NULL)

3. Affichez le nombre de cours réussis pour chaque étudiant

4. Affichez la liste des cours suivis par au moins un étudiant pour la session qui a débuté le '2022-08-29'

Question 2
Matériel requis : summit.sql (à exécuter avant de commencer si nécessaire)
1. Affichez le nom et le numéro de tous les employés qui gagnent plus que la moyenne des
salaires. Affichez le résultat en ordre décroissant de salaire. (13 enregistrements)

2. Affichez le nom de tous les employés qui sont dans le même département que Smith.
N'affichez pas Smith. (3 enregistrements)

3. Affichez le nom du client, le numéro de la commande et le délai de livraison (nombre de jours
écoulés entre la date de livraison et la date de la commande), pour toutes les commandes
ayant un délai de livraison supérieur à la moyenne. L'affichage doit être trié en ordre
décroissant de délai de livraison. Utilisez des noms de colonnes significatifs à l'affichage.
(8 enregistrements)

4. Affichez les noms différents de département pour les départements qui ont 2 employés. (3
enregistrements)

5. Affichez, pour tous les départements, le nombre d’employés. Si un département n’a pas
d’employés la requête affiche zéro (0). (13 enregistrements) ????

6. Affichez les ventes du représentant numéro 12 qui sont inférieures à toutes les ventes du
représentant numéro 14 (sans utiliser MIN). (1 enregistrement)

7. Déterminez le nom, l’emploi et l'ancienneté de l'employé le plus ancien. (1 enregistrement)

8. Affichez le nom, le salaire et le numéro de département des employés dont le salaire est plus
élevé que le salaire moyen des employés des départements ayant au moins un employé dont
le salaire est supérieur à 1350$. (8 enregistrements)

9. Affichez le prix moyen des produits qui se retrouvent à l’entrepôt 101. (1 enregistrement)

10. Affichez le nom de chaque client qui a acheté au moins deux exemplaires d'un même produit
(dans la même commande ou dans des commandes séparées) et dont la cote de crédit est
excellente. (9 enregistrements)

11. Affichez les numéros des clients de Henry Giljum et la moyenne des quantités vendues pour
chaque client qui a passé une commande. Affichez la moyenne avec deux décimales. (2
enregistrements)

12. Affichez pour chaque nom d'employé le nombre d'employés qui sont sous leur supervision.
(25 enregistrements)