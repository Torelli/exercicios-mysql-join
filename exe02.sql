CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    categoriaId BIGINT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    valor INT NOT NULL,
    bordaRecheada BOOLEAN NOT NULL,
    FOREIGN KEY (categoriaId) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias(nome) 
VALUES ("Salgadas Clássicas"),
("Salgadas Especiais"),
("Doces Clássicas"),
("Doces Especiais"),
("Veganas");

INSERT INTO tb_pizzas(categoriaId, nome, valor, bordaRecheada)
VALUES (1, "Mussarela", 45, false),
(2, "Lombo canadense", 60, true),
(3, "Brigadeiro", 55, true),
(4, "Nutella", 70, true),
(5, "Carne de jaca", 45, false),
(1, "Portuguesa", 50, true),
(2, "Doritos apimentado", 55, false),
(3, "Romeu e Julieta", 45, false);

SELECT * FROM tb_pizzas WHERE valor > 45;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE nome LIKE "%m%";

SELECT tb_categorias.nome as tipo, tb_pizzas.nome as sabor, tb_pizzas.valor as preco, tb_pizzas.bordaRecheada
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_categorias.id = tb_pizzas.categoriaId;

SELECT tb_categorias.nome as tipo, tb_pizzas.nome as sabor, tb_pizzas.valor as preco, tb_pizzas.bordaRecheada
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_categorias.id = tb_pizzas.categoriaId
WHERE tb_categorias.nome LIKE "%doce%";





