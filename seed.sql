CREATE TABLE cars (

  id SERIAL PRIMARY KEY,
  manufacturer VARCHAR(255),
  model TEXT
  year TEXT
  engine_size TEXT
  power TEXT

);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('Vauxhall', 'Astra', 2010, 1.4, 89);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('Vauxhall', 'Astra', 2008, 1.8, 138);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('BMW', '5 Series', 2012, 3.0, 258);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('BMW', '5 Series', 2014, 3.0, 313);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('Toyota', 'GT86', 2014, 2.0, 197);
INSERT INTO cars (manufacturer, model, year, engine_size, power) VALUES ('Volkswagen', 'Golf R', 2015, 2.0, 305);
