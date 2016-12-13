DELIMITER $$

CREATE PROCEDURE Verificar_Quantidade_Logons(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM logon;

END $$
DELIMITER ;
