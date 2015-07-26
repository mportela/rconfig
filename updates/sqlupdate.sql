-- Dumping structure for table DATABASE_NAME.nodes
ALTER TABLE nodes
ADD COLUMN `defaultCreds` int(1) DEFAULT NULL AFTER `nodeAddedBy`,
ADD COLUMN `defaultUsername` varchar(255) DEFAULT NULL AFTER `defaultCreds`,
ADD COLUMN `defaultPassword` varchar(255) DEFAULT NULL AFTER `defaultUsername`,
ADD COLUMN `defaultEnablePassword` varchar(255) DEFAULT NULL AFTER `defaultPassword`;

-- Dumping structure for table DATABASE_NAME.compliancePolElem
CREATE TABLE IF NOT EXISTS `compliancePolElem` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `elementName` varchar(255) NOT NULL,
  `elementDesc` varchar(255) NOT NULL,
  `singleParam1` int(10) DEFAULT NULL COMMENT '1, equals. 2, contains',
  `singleLine1` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping structure for table DATABASE_NAME.compliancePolElemTbl
CREATE TABLE IF NOT EXISTS `compliancePolElemTbl` (
  `polId` int(10) DEFAULT NULL,
  `elemId` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- Dumping structure for table DATABASE_NAME.compliancePolicies
CREATE TABLE IF NOT EXISTS `compliancePolicies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `policyName` varchar(255) DEFAULT NULL,
  `policyDesc` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;


-- Dumping structure for table DATABASE_NAME.complianceReportPolTbl
CREATE TABLE IF NOT EXISTS `complianceReportPolTbl` (
  `reportId` int(10) DEFAULT NULL,
  `polId` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;


-- Dumping structure for table DATABASE_NAME.complianceReports
CREATE TABLE IF NOT EXISTS `complianceReports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reportsName` varchar(255) DEFAULT NULL,
  `reportsDesc` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping structure for table DATABASE_NAME.tasks
ALTER TABLE tasks ADD `complianceId` int(10) DEFAULT NULL AFTER mailErrorsOnly;
-- Dumping structure for table DATABASE_NAME.tasks
ALTER TABLE tasks ADD `snipId` int(10) DEFAULT NULL AFTER taskDescription;

-- Dumping structure for table rconfigdev1.snippets
CREATE TABLE IF NOT EXISTS `snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snippetName` varchar(255) NOT NULL,
  `snippetDesc` varchar(255) NOT NULL,
  `snippet` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;