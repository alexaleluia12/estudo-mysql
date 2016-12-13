DELIMITER $$

CREATE PROCEDURE Elevar_Ao_Quadrado(INOUT numero INT)
BEGIN
	SET numero = numero * numero;
END $$
DELIMITER ;
