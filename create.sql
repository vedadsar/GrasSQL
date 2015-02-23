/* TO CREATE THEM BY ORDER !!!!*/
/*Primary key ce biti carchar kod vozila npr TRA154*/

PRAGMA foreign_keys = on;
.header on


/* TODO Vedad: use lower case for table names (tip_vozila), I would highly recommend naming in english but ... it is up to you

	 Good thing about naming converntion in english is that it forces singular/plural conventions, and modern ORMs (e.g. ActiveRecord)
	 highly rely on proper naming of underling DB. Example would be: user/users, student/students.

*/
create table Tip_vozila(
	kod_vozila varchar(3) primary key ,
	naziv_vozila varchar(20)
);


/* TODO Vedad: I would suggest using type 'date' instead of varchar, since when activily working with this Database you will most likely have to convert
string (varchar) to date each time you need that data.

	 TODO Vedad: Also instead of using 'godine' it would be better to have birth date in their that way you have 2 pieces of information based on
	 1 data. You know birthday and you know current year. Also it is highly unpractical to have integer holding year, you will have to update it each
	 year and you do not know when :)

	 TODO Vedad: ID lower case ... id
*/
create table vozac(
	ID integer Primary key autoincrement,
	ime varchar(15),
	prezime varchar(15),
	godine smallint,
	godina_zaposlenja varchar(1,0)
);

create table smjena(
	id smallint primary key,
	ime varchar(6)
);

/* TODO Vedad: field name should be lower case as well */
create table vozilo(
	ID integer primary key,
	Tip_vozila varchar(6) ,
	foreign key(Tip_vozila) references Tip_vozila on update cascade on delete cascade
);


/*Kreiram tabelu linija gdje je primary kez
  kod linije npr "16b"                    */
 /* TODO Vedad: Primary key should be ALWAYS named just 'id' */
create table linija(
	kod_linije varchar(3) primary key,
	polazna_tacka varchar(25),
	krajnja_tacka varchar(25),
	prva_voznja varchar(4),
	interval smallint
);


/*Tablea redova voznje.*/
/* TODO Vedad: Convention for writing foreign key names is: NAME_ID, so if it is 'student' table foreign ID will be 'student_id', in your case
it should be 'kod_linije_id' - again if it was written in english there would be much less confusion and conventions would make much more sense
*/
create table red_voznje(
	id_vozila integer,
	kod_linije varchar(3),
	id_vozaca integer,
	smjena smallint,
	foreign key(id_vozaca) references vozac on update cascade on delete cascade,
	foreign key(kod_linije) references linija on update cascade on delete cascade,
	foreign key(id_vozila) references vozilo on update cascade on delete cascade,
	foreign key(smjena) references smjena on update cascade on delete cascade,
	primary key(id_vozaca,id_vozila,kod_linije, smjena)
);

