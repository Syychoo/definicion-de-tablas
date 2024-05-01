drop table if exists Peliculas;
drop table if exists Reparto;

create table Peliculas(
	id int primary key,
	pelicula varchar(150) not null,
	anho int,
	director varchar(50)
);

create table Reparto(
	id_pelicula int not null,
	actor varchar(50) not null,
	foreign key(id_pelicula) references Peliculas(id)
);

copy Peliculas
from 'c:\csv\peliculas.csv'
delimiter ','
csv header;

copy Reparto
from 'c:\csv\reparto.csv'
delimiter ','
csv header;

select * from Peliculas;
select * from Reparto;

select p.id from Peliculas p
where p.pelicula = 'Titanic';

select * from Reparto r
where r.id_pelicula = (select p.id from Peliculas p
					  where p.pelicula = 'Titanic');
					  
select count(p.id) from Peliculas p
join Reparto r on p.id = r.id_pelicula
where r.actor = 'Harrison Ford';

select * from Peliculas p
where p.anho >= 1990 and p.anho <= 1999
order by p.anho asc;

select p.pelicula, length(p.pelicula) as longitud_titulo from Peliculas p;

select max(length(p.pelicula)) from Peliculas p;