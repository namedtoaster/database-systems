CREATE TABLE color
(
  color_id INT NOT NULL,
  color_n VARCHAR(40),
  CONSTRAINT pk_color PRIMARY KEY (color_id)
);

CREATE TABLE make
(
	make_id INT NOT NULL,	 -- add sequence for auto increment
	make_n VARCHAR(20) NOT NULL,
	CONSTRAINT pk_make PRIMARY KEY(make_id)
);

CREATE TABLE model
(
	model_id INT NOT NULL,	 -- add sequence for auto increment
	model_n VARCHAR(20) NOT NULL,
	CONSTRAINT pk_model PRIMARY KEY(model_id)
);

CREATE TABLE trim
(
  trim_id INT NOT NULL,
  trim_n VARCHAR(20),
  CONSTRAINT pk_trim PRIMARY KEY (trim_id)
);

CREATE TABLE type -- i.e sedan, coupe ....
(
  type_id INT NOT NULL,
  type_n VARCHAR(20),
  CONSTRAINT pk_type PRIMARY KEY (type_id)
);

CREATE TABLE car
(
	car_id INT NOT NULL,	 	-- add sequence for auto increment
	make_id INT NOT NULL,
	model_id INT NOT NULL,
  trim_id INT NOT NULL,
	type_id INT NOT NULL,		 	-- i.e. sedan, coupe.  might be best if it has its own table
  year INT,
	doors INT,        -- not a key, but actual number of doors
	CONSTRAINT pk_car PRIMARY KEY(car_id),
	CONSTRAINT fk_make FOREIGN KEY (make_id) REFERENCES make(make_id),
	CONSTRAINT fk_model FOREIGN KEY (model_id) REFERENCES model(model_id),
 	CONSTRAINT fk_trim FOREIGN KEY (trim_id) REFERENCES trim(trim_id),
	CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES type(type_id)
);

CREATE TABLE picture
(
	pic_id INT NOT NULL,
	car_id INT NOT NULL,
	color_id INT NOT NULL,
	loc VARCHAR(250),
	front VARCHAR2(1), -- holds 'Y' or 'N', implies it is a rear image if 'N'
	CONSTRAINT pk_pic PRIMARY KEY(pic_id),
	CONSTRAINT fk_color FOREIGN KEY(color_id) REFERENCES color(color_id),
	CONSTRAINT fk_car FOREIGN KEY(car_id) REFERENCES car(car_id)
);

INSERT INTO make (make_id, make_n) VALUES (1, 'Honda');

INSERT INTO model (model_id, model_n) VALUES (1, 'Civic');
INSERT INTO model (model_id, model_n) VALUES (2, 'Accord');
INSERT INTO model (model_id, model_n) VALUES (3, 'Crosstour');
INSERT INTO model (model_id, model_n) VALUES (4, 'Insight');
INSERT INTO model (model_id, model_n) VALUES (5, 'Pilot');

INSERT INTO type (type_id, type_n) VALUES (1, 'Coupe');
INSERT INTO type (type_id, type_n) VALUES (2, 'Sedan');
INSERT INTO type (type_id, type_n) VALUES (3, 'Crossover SUV');
INSERT INTO type (type_id, type_n) VALUES (4, 'Hybird');
INSERT INTO type (type_id, type_n) VALUES (5, 'Large SUV');

INSERT INTO trim (trim_id, trim_n) VALUES (1, 'DX');
INSERT INTO trim (trim_id, trim_n) VALUES (2, 'EX');
INSERT INTO trim (trim_id, trim_n) VALUES (3, 'SE');

INSERT INTO color(color_id, color_n) VALUES (1, 'Alabaster Silver Metallic');
INSERT INTO color(color_id, color_n) VALUES (2, 'Dyno Blue Pearl');
INSERT INTO color(color_id, color_n) VALUES (3, 'Crystal Black Pearl');
INSERT INTO color(color_id, color_n) VALUES (4, 'Twilight Blue Metallic');
INSERT INTO color(color_id, color_n) VALUES (5, 'Opal Sage Metallic');
INSERT INTO color(color_id, color_n) VALUES (6, 'Milano Red');
INSERT INTO color(color_id, color_n) VALUES (7, 'Bali Blue Pearl');


INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (1, 1, 1, 1, 1, 2012, 2);
INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (2, 1, 2, 2, 1, 2012, 2);
INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (3, 1, 2, 3, 2, 2012, 4);
INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (4, 1, 3, 2, 3, 2012, 4);
INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (5, 1, 4, 2, 4, 2012, 4);
INSERT INTO car (car_id, make_id, model_id, trim_id, type_id, year, doors) 
VALUES (6, 1, 5, 2, 5, 2012, 4);

INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (1,1,1,'C:\2012 Honda Compliance Images\2012 Honda Civic Coupe\2012_Honda_Accord_CivicCoupe_DX\2012_Honda_Accord_CivicCoupe_DX_AlabasterSilverMetallic_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (2,1,1,'C:\2012 Honda Compliance Images\2012 Honda Civic Coupe\2012_Honda_Accord_CivicCoupe_DX\2012_Honda_Accord_CivicCoupe_DX_AlabasterSilverMetallic_r.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (3,1,2,'C:\2012 Honda Compliance Images\2012 Honda Civic Coupe\2012_Honda_Accord_CivicCoupe_DX\2012_Honda_Accord_CivicCoupe_DX_DynoBluePearl_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (4,1,2,'C:\2012 Honda Compliance Images\2012 Honda Civic Coupe\2012_Honda_Accord_CivicCoupe_DX\2012_Honda_Accord_CivicCoupe_DX_DynoBluePearl_r.png', 'n');

INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (5,2,1,'C:\2012 Honda Compliance Images\2012 Honda Accord Coupe\2012_Honda_Accord_Coupe_EX\2012_Honda_Accord_Coupe_EX_AlabasterSilverMetallic_f.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (6,2,1,'C:\2012 Honda Compliance Images\2012 Honda Accord Coupe\2012_Honda_Accord_Coupe_EX\2012_Honda_Accord_Coupe_EX_AlabasterSilverMetallic_r.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (7,3,3,'C:\2012 Honda Compliance Images\2012 Honda Accord Sedan\2012_Honda_Accord_Sedan_SE\2012_Honda_Accord_Sedan_SE_CrystalBlackPearl_f.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (8,4,4,'C:\2012 Honda Compliance Images\2012 Honda Crosstour\2012_Honda_Crosstour_EX\2012_Honda_Crosstour_EX_TwilightBlueMetallic_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (9,4,1,'C:\2012 Honda Compliance Images\2012 Honda Crosstour\2012_Honda_Crosstour_EX\2012_Honda_Crosstour_EX_AlabasterSilverMetallic_r.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (10,4,5,'C:\2012 Honda Compliance Images\2012 Honda Crosstour\2012_Honda_Crosstour_EX\2012_Honda_Crosstour_EX_OpalSageMetallic_r.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (11,5,1,'C:\2012 Honda Compliance Images\2012 Honda Insight\2012_Honda_Insight_EX\2012_Honda_Insight_EX_AlabasterSilverMetallic_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (12,5,1,'C:\2012 Honda Compliance Images\2012 Honda Insight\2012_Honda_Insight_EX\2012_Honda_Insight_EX_AlabasterSilverMetallic_r.png', 'n');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (13,5,6,'C:\2012 Honda Compliance Images\2012 Honda Insight\2012_Honda_Insight_EX\2012_Honda_Insight_EX_MilanoRed_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (14,5,6,'C:\2012 Honda Compliance Images\2012 Honda Insight\2012_Honda_Insight_EX\2012_Honda_Insight_EX_MilanoRed_r.png', 'n');

INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (15,6,7,'C:\2012 Honda Compliance Images\2012 Honda Pilot\2012_Honda_Pilot_EX\2012_Honda_Pilot_EX_BaliBluePearl_f.png', 'y');
INSERT INTO picture (pic_id, car_id, color_id, loc, front)
VALUES (16,6,7,'C:\2012 Honda Compliance Images\2012 Honda Pilot\2012_Honda_Pilot_EX\2012_Honda_Pilot_EX_BaliBluePearl_r.png', 'n');


COMMIT;