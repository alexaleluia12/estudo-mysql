DELIMITER $
DROP TRIGGER IF EXISTS Tgr_ItensVenda_Insert;
CREATE 
	TRIGGER Tgr_ItensVenda_Insert BEFORE INSERT
	ON ItensVenda
		FOR EACH ROW BEGIN
			
			SELECT Estoque INTO @QUANT FROM Produtos
			WHERE Referencia = NEW.Produto;
			
			IF @QUANT - NEW.QUANTIDADE < 0 THEN
				SET @MSG = concat('Nao ha quantidade suficiente em estoque para ', cast(NEW.Quantidade as char));
				-- da erro e nao insere o ItensVenda, nem meche no esto do Produto :D
				signal sqlstate '45000' set message_text = @MSG;
			ELSE
				UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
				WHERE Referencia = NEW.Produto;
			END IF;
			
		END$
DELIMITER ;


DELIMITER $
DROP TRIGGER IF EXISTS Tgr_ItensVenda_Delete;
CREATE 
	TRIGGER Tgr_ItensVenda_Delete AFTER DELETE
	ON ItensVenda
		FOR EACH ROW BEGIN
				UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
				WHERE Referencia = OLD.Produto;
		END$

DELIMITER ;
