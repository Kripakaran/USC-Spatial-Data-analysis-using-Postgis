drop table if exists loc;

--- table creation
create table loc(id integer,name varchar(30),shape geometry);

insert into loc values(1,'gerontology',ST_GeomFromText('POINT(-118.290695 34.019227)'));
insert into loc values(2,'Leavey',ST_GeomFromText('POINT(-118.2829473 34.0218530)'));
insert into loc values(3,'WilsonDental',ST_GeomFromText('POINT(-118.286197 34.024000)'));
insert into loc values(4,'Hoose',ST_GeomFromText('POINT(-118.286597 34.018699)'));
insert into loc values(5,'Gaughan',ST_GeomFromText('POINT(-118.282502 34.018622)'));
insert into loc values(6,'Fertitta',ST_GeomFromText('POINT(-118.282442 34.018706)'));
insert into loc values(7,'Starbucks',ST_GeomFromText('POINT(-118.282157 34.021662)'));
insert into loc values(8,'Coffeebean',ST_GeomFromText('POINT(-118.2861215 34.020159)'));
insert into loc values(9,'Littlegalen',ST_GeomFromText('POINT(-118.287282 34.023005)'));
insert into loc values(10,'Parkside',ST_GeomFromText('POINT(-118.291180 34.018017)'));
insert into loc values(11,'CinematicArts',ST_GeomFromText('POINT(-118.286539 34.023591)'));
insert into loc values(12,'Socialwork',ST_GeomFromText('POINT(-118.282410 34.022320)'));
insert into loc values(13,'Marshall',ST_GeomFromText('POINT(-118.285742 34.018823)'));
insert into loc values(14,'CompScience',ST_GeomFromText('POINT(-118.289410 34.019476)'));
insert into loc values(15,'PublicPolicy',ST_GeomFromText('POINT(-118.283581 34.019387)'));

--- convex hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(loc.shape))) from loc;

--- nearest neighbours
SELECT g1.id,g2.id FROM loc as g1, loc as g2 WHERE g1.id <> g2.id and g1.id = 2 ORDER BY g1.id, ST_Distance(g1.shape,g2.shape) LIMIT 4;
