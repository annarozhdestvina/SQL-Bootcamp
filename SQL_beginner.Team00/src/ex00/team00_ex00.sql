create table nodes
( id bigint primary key ,
  point1 varchar not null,
  point2 varchar not null,
  cost integer not null default 10
  );



insert into nodes values (1, 'A', 'B', 10 );
insert into nodes values (2, 'B', 'A', 10 );

insert into nodes values (3, 'A', 'C', 15 );
insert into nodes values (4, 'C', 'A', 15 );

insert into nodes values (5, 'A', 'D', 20 );
insert into nodes values (6, 'D', 'A', 20 );

insert into nodes values (7, 'B', 'C', 35 );
insert into nodes values (8, 'C', 'B', 35 );

insert into nodes values (9, 'B', 'D', 25 );
insert into nodes values (10, 'D', 'B', 25 );

insert into nodes values (11, 'C', 'D', 30 );
insert into nodes values (12, 'D', 'C', 30 );
