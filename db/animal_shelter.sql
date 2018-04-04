DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);




CREATE TABLE animals
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  adoptable VARCHAR(255),
  age VARCHAR(255),
  admission_date DATE(255),
  owner_id INT8 REFERENCES owners(id)
);
