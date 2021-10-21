INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_tequilala', 'tequilala', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_tequilala', 'tequilala', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_tequilala', 'tequilala', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('tequilala','Tequila-la')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('tequilala',0,'recruit','Camarero',500,'{}','{}'),
	('tequilala',1,'officer','Bailarin',800,'{}','{}'),
	('tequilala',2,'sergeant','Seguridad',1000,'{}','{}'),
	('tequilala',3,'lieutenant','Encargado',1200,'{}','{}'),
	('tequilala',4,'boss','Jefe',1500,'{}','{}')
;
