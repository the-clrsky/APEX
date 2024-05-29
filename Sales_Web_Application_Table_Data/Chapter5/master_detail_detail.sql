CREATE TABLE MD_continent (
continent_id number(2) CONSTRAINT pk_continent_id PRIMARY KEY,
continent_name varchar2(14)
);

CREATE TABLE MD_country
(country_id number(2) CONSTRAINT pk_country_id PRIMARY KEY, 
 continent_id,
 country_name varchar2(20),
 CONSTRAINT country_id_fk FOREIGN KEY (continent_id) REFERENCES MD_continent(continent_id) 
);

CREATE TABLE MD_city
(city_id number(2) CONSTRAINT pk_city_id PRIMARY KEY, 
 country_id,
 city_name varchar2(20),
 CONSTRAINT city_id_fk FOREIGN KEY (country_id) REFERENCES MD_country(country_id) 
);

CREATE TABLE MD_population
(population_id number(2) CONSTRAINT pk_population_id PRIMARY KEY, 
 city_id,
 population number(12),
 CONSTRAINT population_id_fk FOREIGN KEY (city_id) REFERENCES MD_city(city_id) 
);


insert into MD_continent values (1,'Europe');
insert into MD_continent values (2,'South America');


insert into MD_country values (1,1,'France');
insert into MD_country values (2,1,'Germany');
insert into MD_country values (3,1,'United Kingdom');
insert into MD_country values (4,1,'Italy');
insert into MD_country values (5,1,'Switzerland');
insert into MD_country values (6,2,'Brazil');
insert into MD_country values (7,2,'Argentina');
insert into MD_country values (8,2,'Venezuela');
insert into MD_country values (9,2,'Ecuador');
insert into MD_country values (10,2,'Peru');


insert into MD_city values (1,1,'Paris');
insert into MD_city values (2,1,'Marseille');
insert into MD_city values (3,1,'Lyon');

insert into MD_city values (4,2,'Berlin');
insert into MD_city values (5,2,'Hamburg');
insert into MD_city values (6,2,'Bremen');

insert into MD_city values (7,3,'London');
insert into MD_city values (8,3,'Birmingham');
insert into MD_city values (9,3,'Bristol');

insert into MD_city values (10,4,'Milan');
insert into MD_city values (11,4,'Naples');
insert into MD_city values (12,4,'Rome');

insert into MD_city values (13,5,'Zurich');
insert into MD_city values (14,5,'Geneva');
insert into MD_city values (15,5,'Basel');

insert into MD_city values (16,6,'Sao Paulo');
insert into MD_city values (17,6,'Rio de Janeiro');
insert into MD_city values (18,6,'Salvador');

insert into MD_city values (19,7,'Buenos Aires');
insert into MD_city values (20,7,'Cordoba');
insert into MD_city values (21,7,'Rosario');

insert into MD_city values (22,8,'Caracas');
insert into MD_city values (23,8,'El Tigre');
insert into MD_city values (24,8,'Anaco');

insert into MD_city values (25,9,'Guayaquil');
insert into MD_city values (26,9,'Quito');
insert into MD_city values (27,9,'Cuenca');

insert into MD_city values (28,10,'Lima');
insert into MD_city values (29,10,'Arequipa');
insert into MD_city values (30,10,'Trujillo');




insert into MD_population values (1,1,2229621);
insert into MD_population values (2,2,855393);
insert into MD_population values (3,3,500715);

insert into MD_population values (4,4,3470000);
insert into MD_population values (5,5,1763000);
insert into MD_population values (6,6,551767);

insert into MD_population values (7,7,7375);
insert into MD_population values (8,8,1092330);
insert into MD_population values (9,9,428234);

insert into MD_population values (10,10,6623798);
insert into MD_population values (11,11,5294546);
insert into MD_population values (12,12,4447881);

insert into MD_population values (13,13,366445);
insert into MD_population values (14,14,177500);
insert into MD_population values (15,15,165000);

insert into MD_population values (16,16,11895893);
insert into MD_population values (17,17,6453682);
insert into MD_population values (18,18,2902927);

insert into MD_population values (19,19,1613211);
insert into MD_population values (20,20,9999999);
insert into MD_population values (21,21,1325090);

insert into MD_population values (22,22,5576000);
insert into MD_population values (23,23,151011);
insert into MD_population values (24,24,117105);

insert into MD_population values (25,25,2278691);
insert into MD_population values (26,26,1607734);
insert into MD_population values (27,27,329928);

insert into MD_population values (28,28,9886866);
insert into MD_population values (29,29,1070709);
insert into MD_population values (30,30,805150);

commit;
