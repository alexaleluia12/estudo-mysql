DELIMITER $$
	DROP FUNCTION IF EXISTS media;
	CREATE 
		FUNCTION media(nome VARCHAR(50)) RETURNS FLOAT BEGIN
		
			DECLARE n1, n2, n3, n4 INT;
			DECLARE valor_media FLOAT;
			
			SELECT nota1, nota2, nota3, nota4 INTO n1, n2, n3, n4
			FROM aluno
			WHERE aluno.nome = nome;
			
			SET valor_media = (n1 + n2 + n3 + n4) / 4.0;
			RETURN valor_media;
	END $$

DELIMITER ;
