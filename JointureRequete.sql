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