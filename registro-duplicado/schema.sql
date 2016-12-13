drop table if exists produto
create table produto (
	id INT PRIMARY KEY AUTO_INCREMENT
	inclusao date NOT NULL,
	nome varchar(50) NOT NULL,
)

-- nao permite que seja inserido dois clientes com o msm nome, e inclusao
-- chave
ALTER TABLE produto ADD UNIQUE INDEX(inclusao, nome);
