/* TO CREATE THEM BY ORDER !!!!*/
/*Primary key ce biti carchar kod vozila npr TRA154*/

PRAGMA foreign_keys = on;
.header on

create table Tip_vozila(
	kod_vozila varchar(3) primary key ,
	naziv_vozila varchar(20)
);

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

create table vozilo(
	ID integer primary key,
	Tip_vozila varchar(6) ,	
	foreign key(Tip_vozila) references Tip_vozila on update cascade on delete cascade	
);


/*Kreiram tabelu linija gdje je primary kez
  kod linije npr "16b"                    */
create table linija(
	kod_linije varchar(3) primary key,	
	polazna_tacka varchar(25),
	krajnja_tacka varchar(25),
	prva_voznja varchar(4),
	interval smallint	
);


/*Tablea redova voznje.*/
create table red_voznje(
	id_vozila integer ,
	kod_linije varchar(3) ,
	id_vozaca integer ,
	smjena smallint,	
	foreign key(id_vozaca) references vozac on update cascade on delete cascade,
	foreign key(kod_linije) references linija on update cascade on delete cascade,
	foreign key(id_vozila) references vozilo on update cascade on delete cascade,
	foreign key(smjena) references smjena on update cascade on delete cascade,
	primary key(id_vozaca,id_vozila,kod_linije, smjena)
);

