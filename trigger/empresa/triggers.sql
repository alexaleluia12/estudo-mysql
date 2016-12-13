DELIMITER $$
	DROP TRIGGER IF EXISTS antesDeUpdate_empregados;
	CREATE 
		TRIGGER antesDeUpdate_empregados
		BEFORE UPDATE ON empregados
		FOR EACH ROW BEGIN
			INSERT INTO empregado_auditoria
			SET acao = 'update',
				id_empregado = OLD.id_empregado,
				sobrenome = OLD.sobrenome,
				modificadoem = NOW();
		END$$
DELIMITER ;
