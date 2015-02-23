/* Vedad: Odlicno! sto si komentarisao svaki query *?

/* Queries seem fine - one suggestion for future reference is to write select with indentations
It is much more readable, for you and others

  SELECT
      pet.id,
      pet.name,
      pet.age,
      pet.dead
  FROM pet, person_pet, person
  WHERE
      pet.id = person_pet.pet_id AND
      person_pet.person_id = person.id AND
      person.first_name = "Zed";

*/

/* Izlistati sve vozace zajedno za identifikacijskim brojem i tipom vozila koja su koristili*/
select id_vozaca, vozac.ime, vozac.prezime, vozilo.tip_vozila from red_voznje
 inner join vozac on id_vozaca = vozac.id
 inner join vozilo on id_vozila = vozilo.id;

 /* Izlistati sve tramvajske linije - polazna stanica i krajnja stanica*/
select red_voznje.kod_linije ,linija.polazna_tacka, linija.krajnja_tacka from red_voznje
inner join linija on red_voznje.kod_linije = linija.kod_linije
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.Tip_vozila = "TRA";

/* Izlistati sve trolejbuske linije - polazna stanica i krajnja stanica*/
select red_voznje.kod_linije ,linija.polazna_tacka, linija.krajnja_tacka from red_voznje
inner join linija on red_voznje.kod_linije = linija.kod_linije
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.Tip_vozila = "TRO";

/* Izlistati sve autobuske linije - - polazna stanica i krajnja stanica*/
select red_voznje.kod_linije ,linija.polazna_tacka, linija.krajnja_tacka from red_voznje
inner join linija on red_voznje.kod_linije = linija.kod_linije
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.Tip_vozila = "AUT";

/* Izlistati sve stanice sa kojih polaze autobusi i trolejbusi*/
select polazna_tacka from linija
inner join red_voznje on red_voznje.kod_linije = linija.kod_linije
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.Tip_vozila = "TRO" or vozilo.Tip_vozila ="AUT";

/* Izlistati sve stanice sa kojih polaze autobusi i tramvaji*/
select polazna_tacka from linija
inner join red_voznje on red_voznje.kod_linije = linija.kod_linije
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.Tip_vozila = "TRA" or vozilo.Tip_vozila ="AUT";

/* Napisati query koji ce vratiti prosjek godina vozaca*/
select avg(godine) from vozac;

/* Query koji ce ispisati prosjek godina rada u firmi za vozace*/
/* Za godine rada koristio sam datume u varcharu*/

/* Napisati ime i prezime najstarijeg vozaca*/
select max(godine), ime, prezime from vozac;

/* Za odredenu stanicu napisati sve linije koje polaze sa te stanice, ispis sortirati po frekvenciji voznje na liniji*/
select kod_linije from linija
where polazna_tacka="Dom Armije" order by interval;

/* Za odredenu liniju ispisati sve vozace koji rade na toj liniji*/
select red_voznje.id_vozaca, vozac.ime, vozac.prezime from red_voznje
inner join vozac on red_voznje.id_vozaca = vozac.ID
inner join linija on linija.kod_linije = red_voznje.kod_linije
where linija.polazna_tacka="Dom Armije";

/* Za odredeno vozilo ispisati sve vozace koji su ga koristili*/
select red_voznje.id_vozaca, vozac.ime, vozac.prezime from red_voznje
inner join vozac on red_voznje.id_vozaca = vozac.ID
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where vozilo.id = 12;

/* Imena vozaca koji voze na liniji sa rednim brojem 1 i liniji sa rednim brojem 20*/
select red_voznje.id_vozaca, vozac.ime, vozac.prezime from red_voznje
inner join vozac on red_voznje.id_vozaca = vozac.ID
where red_voznje.kod_linije = "16b" or red_voznje.kod_linije="3";

/* Izlistati vozace koji rade u prvoj smijeni*/
select red_voznje.id_vozaca, vozac.ime, vozac.prezime from red_voznje
inner join vozac on red_voznje.id_vozaca = vozac.ID
where red_voznje.smjena = 1;

/* Izlistati vozace koji rade u prvoj smjeni a voze autobuse.*/
select red_voznje.id_vozaca, vozac.ime, vozac.prezime from red_voznje
inner join vozac on red_voznje.id_vozaca = vozac.ID
inner join vozilo on red_voznje.id_vozila = vozilo.ID
where red_voznje.smjena = 1 AND  vozilo.Tip_vozila="TRA";

/* Izlistati sve polazne stanice za odredenog vozaca*/
select red_voznje.kod_linije, linija.polazna_tacka from red_voznje
inner join linija on red_voznje.kod_linije = linija.kod_linije
inner join vozac on red_voznje.id_vozaca = vozac.ID
where vozac.ID = 1;