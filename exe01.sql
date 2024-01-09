CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    classeId BIGINT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    poderAtaque INT NOT NULL,
    poderDefesa INT NOT NULL,
    nivel INT NOT NULL,
    FOREIGN KEY (classeId) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes(nome, descricao) 
VALUES ("Bárbaro", "O Bárbaro é um ser que rejeita as regras e costumes da sociedade, adotando uma vida livre das leis e da ordem. Pode também estar ligado aos espíritos da selvageria dos animais."),
("Bardo", "O bardo é quem inspira à todos em um ambiente, sendo um grande mestre das artes. Ele faz tudo através da performance artística, que mais comumente é a música."),
("Mago", "O mago é uma classe conjuradora de magias no RPG, e ele às conjura por meio de anos de estudo sobre os segredos arcanos do universo. São noites em claro estudando cada gesto e cada compontente."),
("Druida", "O Druida é um guardião de toda a natureza. De tudo que é vivo, puro e primordial."),
("Paladino", "Os paladinos são verdadeiros guereiros da justiça, defensores da bondade e destruidores das forças do mal.");

INSERT INTO tb_personagens(classeId, nome, poderAtaque, poderDefesa, nivel)
VALUES (3, "Nimreth", 700, 1500, 15),
(5, "Favian", 1300, 500, 8),
(1, "Nydd", 1800, 600, 14),
(4, "Shiera", 1600, 720, 11),
(3, "Werloth", 1400, 800, 9),
(2, "Dior", 6000, 1000, 14),
(4, "Yrniela", 1600, 850, 11),
(1, "Zastan", 2500, 700, 15);

SELECT * FROM tb_personagens WHERE poderAtaque > 2000;

SELECT * FROM tb_personagens WHERE poderAtaque BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT tb_classes.nome as classe, tb_personagens.nome as nomePersonagem, tb_personagens.poderAtaque, tb_personagens.poderDefesa, tb_personagens.nivel 
FROM tb_personagens INNER JOIN tb_classes 
ON tb_classes.id = tb_personagens.classeId;

SELECT tb_classes.nome as classe, tb_personagens.nome as nomePersonagem, tb_personagens.poderAtaque, tb_personagens.poderDefesa, tb_personagens.nivel 
FROM tb_personagens INNER JOIN tb_classes 
ON tb_classes.id = tb_personagens.classeId
WHERE tb_classes.nome = "Druida";





