CREATE TABLE `blog`(
	`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
	`title` text,
	`content` text,
	`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Blog posts';


CREATE TABLE `audit` (
	`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
	`blog_id` mediumint(8) unsigned NOT NULL,
	`changetype` enum('NEW', 'EDIT', 'DELETE') NOT NULL,
	`changetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_audit_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
