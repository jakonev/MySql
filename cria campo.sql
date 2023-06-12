select first_name FROM sakila.actor
where first_name like "P%" ;

create table JORGE_TESTE (   ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);