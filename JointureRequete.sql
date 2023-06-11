IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Cegep')
CREATE DATABASE Cegep;

Use Cegep;

drop table etudiant;
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'etudiant')
create table etudiant
(
    etudiantId int identity PRIMARY KEY,
    prenom VARCHAR(50),
    nom varchar(50)
);

drop table cour;
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'cours')
create table cours
(
    courId int identity PRIMARY KEY,
    titre VARCHAR(50)
);

drop table etudiant_cours;
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'etudiant_cours')
create table etudiant_cours
(
    etudiantId int  not null,
    courId int not null,
    dateDebut date not null,
    dateFin date,
    noteFinale int
    CONSTRAINT fk_etudiant FOREIGN KEY(etudiantId) REFERENCES etudiant(etudiantId),
    CONSTRAINT fk_courId FOREIGN KEY(courId) REFERENCES cours(courId)
);


insert into etudiant (prenom,nom) values
('Marie', 'Viere'),
('Alex','Terrieur'),
('Alain', 'Terrieur'),
('Gille' ,'Eparballe'),
('Alain' ,'Verse');

insert into cours (titre) VALUES
('Philosophie'),
('Introduction a la productivite'),
('Viennoiserie - Specialite Chocolatine');

insert into etudiant_cours(etudiantId, courId, dateDebut, dateFin, noteFinale) VALUES
(1,3,'2022-08-29',null,null),
(2,3,'2002-08-29',null,null),
(3,3,'2022-08-29',null,null),
(4,3,'2022-01-03','2022-06-06',54),
(5,3,'2022-01-03',null,null),
(5,3,'2022-08-29',null,null),
(1,1,'2022-01-03','2022-06-06',81),
(2,1,'2022-01-03','2022-06-06',50),
(3,1,'2022-01-03','2022-06-06',75),
(4,1,'2022-01-03','2022-06-06',45),
(5,1,'2022-01-03',null,null);

select titre from cours where titre like '%c%';

select CONCAT_WS(' ', prenom, nom) as Etudiant, count(ec.courId) as CourSuivi from etudiant as e
left join etudiant_cours as ec
on ec.etudiantId = e.etudiantId
where ec.dateFin is null
group by CONCAT_WS(' ', prenom, nom)
HAVING count(ec.courId) > 2;

select CONCAT_WS(' ', prenom, nom) as Etudiant, count(ec.courId) as CourReussi from etudiant as e
left join etudiant_cours as ec
on ec.etudiantId = e.etudiantId
where ec.noteFinale > 60
GROUP BY CONCAT_WS(' ', prenom, nom);


select c.titre as Cours, count(ec.etudiantId) NombreEtudiant from cours as c
left join etudiant_cours as ec
on c.courId = ec.courId
where ec.dateDebut = '2022-08-29'
GROUP BY c.titre
having count(ec.etudiantId) > 0;


/*Question 2*/

Use summit;

select CONCAT_WS(' ', first_name, last_name) as Employe, salary from s_emp as e
where salary > (select AVG(salary) from s_emp);

select last_name as Nom from s_emp as e
left join s_dept as s
on s.id = e.dept_id
where s.id = (select dept_id from s_emp where last_name = 'Smith') and last_name != 'Smith';

select name as NomClient, o.id as NumeroCommande, DATEDIFF(DAY,date_ordered, date_shipped) as DelaiCommande from s_customer as c
left join s_ord as o
on o.customer_id = c.id
where DATEDIFF(DAY,date_ordered, date_shipped) > (select AVG(DATEDIFF(DAY,date_ordered, date_shipped)) from s_ord)
ORDER BY DelaiCommande desc;

Select name from s_dept as s, s_emp as e
where (select COUNT(*) from s_emp as e where e.dept_id = s.id) = 2
GROUP BY name;

select d.name as Departement, count(e.id) as NombreEmploye from s_dept as d
join s_emp as e
on e.dept_id = d.id
GROUP BY d.name, d.id;


select total 
from s_ord as o
left join s_emp as e
on e.id = o.sales_rep_id
where e.id = 12 and total < any(select total from s_ord as o2 where o2.sales_rep_id = 14 )
ORDER BY total ASC;


select top 1 last_name from s_emp ORDER BY start_date desc;

select DISTINCT last_name as Nom, salary, dept_id as NumeroDepartement from s_emp, s_dept as d
where salary > (select avg(salary) from s_emp as e2 where e2.dept_id = d.id and salary > 1350);

select AVG(price) from s_item , s_product, s_inventory, s_warehouse as w
where w.id = 101;

select c.name, c.credit_rating from s_customer as c
where c.credit_rating like '%exce%';

select c.id as client, cast(ROUND(AVG(i.quantity),2) as decimal(10,2)) from s_customer as c, s_emp as e, s_ord as o, s_item as i
where c.sales_rep_id = (select id from s_emp where last_name = 'Giljum' and first_name = 'Henry')
group by c.id;

select CONCAT_WS(' ', e1.first_name, e1.last_name) as Superieur, COALESCE(sum(e2.id), 0) as NombreEmployer
from s_emp as e1
left join s_emp as e2
on e1.id = e2.manager_id
group by CONCAT_WS(' ', e1.first_name, e1.last_name);