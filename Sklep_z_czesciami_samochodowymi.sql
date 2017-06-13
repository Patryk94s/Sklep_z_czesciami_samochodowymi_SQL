create database Sklep_z_czesciami_samochodowymi;
use Sklep_z_czesciami_samochodowymi ;

CREATE TABLE samochod(
	id_sam int primary key auto_increment,
	marka varchar(50),
    model varchar(50),
    typ varchar(30),
    data_prod date,
    kraj_poch varchar(3)
);

describe samochod;

CREATE TABLE login(
    id_u int primary key auto_increment,
    nazwa_u varchar(50),
    haslo_u varchar(50)
);
describe login;

CREATE TABLE klienci (
	id_k int primary key auto_increment,
    imie_k varchar(50),
    nazwisko_k varchar(50),
    ulica_k varchar(50),
    kod_pocz_k varchar(10),
    miejsc_k varchar(50),
    tel_kom_k varchar(9), 
    id_u int,
	id_sam int,
    foreign key (id_u) references login(id_u),
    foreign key (id_sam) references samochod(id_sam)
);

describe klienci;

CREATE TABLE towar (
	id_towaru int primary key auto_increment,
    nazwa_towaru_t varchar(50),
	kategoria varchar(50),
    producent varchar(50),
    stan_pocz int,
    stawka_vat int,
    marza int,
    cena_zakupu int,
    cena_sprz int
);

describe towar;


CREATE TABLE gwarancja (
	id_gwar int primary key auto_increment,
    data_zak date,
    okres_gwar int
	);

describe gwarancja;

CREATE TABLE faktura_sp (
	id_nr_fak_s int primary key auto_increment,
    id_towaru int,
    data_sp date,
    ilosc_sp int, 
    sp_zap varchar(20),
	id_k int,
    id_gwar int,
    foreign key (id_k) references klienci(id_k),
    foreign key (id_gawr) references gwarancja(id_gwar),
    foreign key (id_towaru) references towar(id_towaru)
    
);
describe faktura_sp;

CREATE TABLE faktura_zak (
	id_nr_fak_z int primary key auto_increment,
    id_towaru int,
    data_zak date,
    ilosc_zak int, 
    sposob_zak varchar(20),
	id_d int,
    foreign key (id_d) references dostawcy(id_d)
    
);
describe faktura_zak;



CREATE TABLE dostawcy (
	id_d int primary key auto_increment,
    nazwa_firmy varchar(20),
    nip varchar(10),
    ulica_d varchar(30),
    kod_poczt_d varchar(6),
    miejsc_d varchar(20)
);

describe dostawcy;

drop table gwarancja;
drop table dostawcy;
drop table towary;
drop table samochod;
drop table klienci;
drop table login;

INSERT INTO login VALUES (1, 'hiegar','radzlo12');
INSERT INTO login VALUES (2, 'andbur','rafzla33');
INSERT INTO login VALUES (3, 'zygflo','marlod23');
INSERT INTO login VALUES (4, 'bazant','slokli36');
INSERT INTO login VALUES (5, 'helgro','markal22');
INSERT INTO login VALUES (6, 'lucgod','jasopo56');
INSERT INTO login VALUES (7, 'zacbac','cielod41');
INSERT INTO login VALUES (8, 'izagar','mocwar02');
INSERT INTO login VALUES (9, 'iwaglu','zlosoc33');
INSERT INTO login VALUES (10, 'kambal','bacwar02');

select * from login;


INSERT INTO gwarancja VALUES (1,'2017-02-16', 24);
INSERT INTO gwarancja VALUES (2,'2017-01-10', 24);
INSERT INTO gwarancja VALUES (3,'2017-03-15', 36);
INSERT INTO gwarancja VALUES (4,'2017-04-16', 24);
INSERT INTO gwarancja VALUES (5,'2017-01-05', 12);

select * from gwarancja;


INSERT INTO samochod VALUES (1, 'Alfa', 'Romeo', '2.0 TS', '2002-02-20','ITA'); 
INSERT INTO samochod VALUES (2, 'Audi', 'Q2', '2.0 TDI', '2017-01-10','GER'); 
INSERT INTO samochod VALUES (3, 'Audi', 'TT', '2.0 TFSI', '2014-09-25','GER'); 
INSERT INTO samochod VALUES (4, 'Honda', 'Civic IX', '1.8 i-VTEC', '2012-05-02','JPN'); 
INSERT INTO samochod VALUES (5, 'Mercedes', 'C', '2.8', '2006-03-07','GER'); 
INSERT INTO samochod VALUES (6, 'VOLVO', 'V40', '2.0 T4', '2014-09-23','SWE'); 
INSERT INTO samochod VALUES (7, 'Mazda', 'MX-5 (IV)', '2.0', '2015-10-12','JPN'); 
INSERT INTO samochod VALUES (8, 'Toyota', 'RAV-4', '2.0 D-4D', '2015-12-07','JPN'); 
INSERT INTO samochod VALUES (9, 'BMW', '3 (F30)', '2.0 TS', '2002-02-20','GER'); 
INSERT INTO samochod VALUES (10, 'Renault', 'Talisman', '1.6 TCE 200','2016-04-12','FRA'); 

select * from samochod;

INSERT INTO faktura_sp  VALUES (1,1,'2017-02-16', 4,'przelew', 2, 1 ); 
INSERT INTO faktura_sp  VALUES (2,7,'2017-04-16', 1 ,'gotowka', 9, 4 ); 
INSERT INTO faktura_sp  VALUES (3,9,'2017-01-05', 1,'karta platnicza', 10, 5 ); 
INSERT INTO faktura_sp  VALUES (4,10,'2017-01-10',1,'gotowka', 7, 2 ); 
INSERT INTO faktura_sp  VALUES (5,4,'2017-03-15', 2,'przelew', 5, 3); 

select * from faktura_sp;

INSERT INTO faktura_zak  VALUES (1,1,'2017-01-03',50 ,'przelew', 1 ); 
INSERT INTO faktura_zak  VALUES (2,5,'2017-02-02',25 ,'przelew', 3); 
INSERT INTO faktura_zak  VALUES (3,3,'2017-01-20', 10,'przelew', 4 ); 
INSERT INTO faktura_zak  VALUES (4,9,'2017-01-01', 20,'przelew', 2 ); 
INSERT INTO faktura_zak  VALUES (5,3,'2017-02-10',30,'przelew', 5); 

select * from faktura_zak;





INSERT INTO towar VALUES (1,'tarcze hamulcowe', 'uklad hamulcowy', 'Bosch', 100, 23, 30, 230, 260); 
INSERT INTO towar VALUES (2,'tarcze hamulcowe', 'uklad hamulcowy', 'Bosch', 50, 23, 35, 290, 325); 
INSERT INTO towar VALUES (3,'cewka zaplonowa', 'uklad zaplonowy', 'Delphi', 30, 23, 25, 155,180 ); 
INSERT INTO towar VALUES (4,'amortyzator tyl', 'amortyzacja', 'Kayaba', 20, 23, 20, 230, 250); 
INSERT INTO towar VALUES (5,'Łożysko hydrauliczne koncentryczne', 'uklad napedowy', 'ZF TRW', 100, 23, 30, 230, 260); 
INSERT INTO towar VALUES (6,'drazek kierowniczy osiowy', 'uklad kierowniczy', 'ZF TRW', 3, 23, 60, 800, 860); 
INSERT INTO towar VALUES (7,'filtr oleju', 'filtry', 'Bosch', 30, 23, 10, 30, 40); 
INSERT INTO towar VALUES (8,'klimatyzacja', 'uklad chlodniczy', 'Delphi', 5, 23, 100, 900, 1000); 
INSERT INTO towar VALUES (9,'czujnik obr./min', 'uklad elektryczny', 'Hella', 25, 23, 50, 400, 450); 
INSERT INTO towar VALUES (10,'sterownik swiec zarowych', 'uklad elektryczny', 'Hella', 5, 23, 65, 300, 365); 

select * from towar;





INSERT INTO klienci VALUES 	(1, 'Hieromina','Garlicka','Radow 5','Zloczew','12-455','518553215',1,2);
INSERT INTO klienci VALUES	(2, 'Andrzej', 'Buraczewski', 'Rafas 3', 'Zlaków', '33-333', '671345689',2,1);
INSERT INTO klienci VALUES	(3, 'Zygfryd', 'Florek', 'Marska 3', 'Łódź','23-111', '533128790',3,5);
INSERT INTO klienci VALUES	(4, 'Bazylia', 'Antoniak', 'Słoneczna 3', 'Klicków','36-555', '733452123',4,3);
INSERT INTO klienci VALUES	(5, 'Helmut', 'Grodziński', 'Marolwa 123', 'Kalisz','22-344', '529867343',5,4);
INSERT INTO klienci VALUES	(6, 'Lucjan', 'Godzisz', 'Jasna 3','Opole','56-321', '722112565',6,8);
INSERT INTO klienci VALUES	(7, 'Zachar', 'Bachurski', 'Ciemna 21', 'Łódź', '41-512', '512356744',7,10 );
INSERT INTO klienci VALUES	(8, 'Izabela', 'Garus', 'Mozarta 3', 'Warszawa', '02-736', '576353421',8,6);
INSERT INTO klienci VALUES	(9, 'Iwan', 'Głuchowski', 'Złota 23', 'Sochaczew', '33-333', '512676890',9,7);
INSERT INTO klienci VALUES	(10, 'Kamil', 'Balon', 'Bacha 22', 'Warszawa', '02-743', '516346212',10,9);

select * from klienci;



INSERT INTO dostawcy VALUES (1,'Bosch', '5261027992','Jutrzenki 105', '02-231' ,'Warszawa');
INSERT INTO dostawcy VALUES (2,'Hella','5210087381','Wał Miedzeszyński 552', '03-994' ,'Warszawa');
INSERT INTO dostawcy VALUES (3,'ZF TRW','5730105234','Rolnicza 33', '42-200' ,'Częstochowa');
INSERT INTO dostawcy VALUES (4,'Delphi','6840001364','Podgórki Tynieckie 2', '30-399' ,'Krakow');
INSERT INTO dostawcy VALUES (5,'Kayaba','3020000341','Tama Pomorzańska 1', '70-030','Szczecin');

select * from dostawcy;



select nazwa_firmy,nip,miejsc_d from dostawcy;  #wypisanie 3 wybranych kolumn z tabeli dostawcy
select *from klienci order by imie_k asc, nazwisko_k asc;     #sortowanie alfabetyczne imienia i nazwiska z tabeli klienci
select *from dostawcy order by nazwa_firmy asc;               #uporzadkowanie alfabetyczne nazwy firmy z tabeli dostwacy
select *from towar order by cena_zakupu desc, cena_sprz desc;   #uporzadkowanie w tabeli towar cene_zakupu i cene sprzedazy malejaco
select *from towar order by cena_zakupu desc, cena_sprz desc limit 1;   #wypisanie najdrozszego towaru w sklepie
select *from samochod where kraj_poch='GER';                    #wypisanie producentow samochodow pochodzacych z Niemiec
select *from samochod where marka='Audi';                          #wypisanie somochodow marki: Audi
select concat(imie_k,' ',nazwisko_k, ' ', miejsc_k) AS dane from klienci;         #wypisanie w jednej kolumnie
select marka, model from samochod where kraj_poch='JPN';             #samochody tylko z JPN
select *from towar where kategoria  like '%ham%';     

select dostawcy.nazwa_firmy, dostawcy.nip, dostawcy.miejsc_d, faktura_zak.ilosc_zak,faktura_zak.data_zak from dostawcy, faktura_zak where dostawcy.id_d=faktura_zak.id_d;
select imie_k, nazwisko_k,nazwa_towaru_t, okres_gwar, data_sp,ilosc_sp, sp_zap from klienci, towar, gwarancja, faktura_sp where gwarancja.id_gwar=faktura_sp.id_gwar and klienci.id_k=faktura_sp.id_k and towar.id_towaru=faktura_sp.id_towaru;
select imie_k, nazwisko_k,nazwa_u,haslo_u,marka, model from klienci, samochod, login where samochod.id_sam=klienci.id_sam and login.id_u=klienci.id_u ;


SELECT *,CASE WHEN stan_pocz > 50 THEN 'Ilosc towaru w normie' ELSE 'Nalezy zakupic dodatkowy produkt' END AS TOWAR FROM towar;
              
              
create view samochod_GER as select marka, model, kraj_poch from samochod where kraj_poch='GER';
drop view samochod_GER;
select *from samochod_GER;

create view towar_BOSCH as select nazwa_towaru_t, kategoria, producent from towar where producent='Bosch';
select *from towar_BOSCH;


create trigger towar_trig after insert on faktura_zak for each row update towar set stan_pocz = stan_pocz + ilosc_zak where ilosc_zak=new.ilosc_zak;
INSERT INTO faktura_zak  VALUES (1,1,'2017-01-03',50 ,'przelew', 1 ); 
select *from towar; 
