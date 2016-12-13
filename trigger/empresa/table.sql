DROP TABLE empregados;
CREATE TABLE empregados (
	`id_empregado` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`sobrenome` VARCHAR(50) NOT NULL,
	`nome` VARCHAR(50) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`cargo` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id_empregado`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE empregado_auditoria;
CREATE TABLE empregado_auditoria (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_empregado` INT NOT NULL,
	`sobrenome` VARCHAR(50) NOT NULL,
	`modificadoem` datetime DEFAULT NULL,
	`acao` VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_empregado_auditoria_empregados` FOREIGN KEY (`id_empregado`) 
		REFERENCES `empregados` (`id_empregado`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
