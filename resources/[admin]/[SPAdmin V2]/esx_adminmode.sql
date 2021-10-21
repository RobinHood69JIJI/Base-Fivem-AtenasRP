CREATE TABLE IF NOT EXISTS `staff_mode` (
  `staff` varchar(50) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `hour` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
