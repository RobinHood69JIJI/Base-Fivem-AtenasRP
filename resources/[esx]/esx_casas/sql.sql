ALTER TABLE users ADD COLUMN house varchar(10000) DEFAULT '{"owns":false,"furniture":[],"houseId":0}';
ALTER TABLE users ADD COLUMN bought_furniture varchar(10000) DEFAULT '{}';

CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` INT(50),
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('housing', 'Housing', 0)
;

INSERT INTO `datastore` (name, label, shared) VALUES
  ('housing', 'Housing', 0)
;

CREATE TABLE IF NOT EXISTS `playerhousing` (
  `id` int(32),
  `owner` varchar(50),
  `rented` tinyint(1),
  `price` int(32),
  `wardrobe` LONGTEXT,
  PRIMARY KEY (`id`)
);

ALTER TABLE `users`
  ADD `last_house` INT(11) DEFAULT 0
;