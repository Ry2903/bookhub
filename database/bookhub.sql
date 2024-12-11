DROP DATABASE IF EXISTS bookhub;
CREATE DATABASE bookhub;
USE bookhub;

-- Criação da tabela de cadastro de usuário
CREATE TABLE cadastro (
    userid INT NOT NULL auto_increment PRIMARY KEY,
    nome varchar(255) NOT NULL,
    user varchar(50) UNIQUE NOT NULL,
    senha varchar(255) NOT NULL, -- será armazeenada em hash
    pf_photo varchar(255),
    bio text,
    criacao timestamp default current_timestamp
) default charset utf8mb4;

-- Criação da tabela de livros
CREATE TABLE livros (
    isbn BIGINT UNIQUE NOT NULL PRIMARY KEY,
    livnome varchar(255) NOT NULL,
    autor varchar(255) NOT NULL,
    editora varchar(255) NOT NULL,
    qtdpag INT NOT NULL
 ) default charset utf8mb4;

-- Criação da tabela de posts
CREATE TABLE posts (
    postid INT NOT NULL auto_increment PRIMARY KEY,
    userid int,
    conteudo text,
    livro int,
    pagatual int,
    datapost timestamp default current_timestamp,
    FOREIGN KEY  (userid) REFERENCES cadastro(userid),
    FOREIGN KEY (livro) REFERENCES livros(isbn)
) default charset utf8mb4;

-- Inserções bases (cadastro, livros, posts)
INSERT INTO cadastro (nome, user, senha, pf_photo, bio, criacao) VALUES
("Ryan", "theking2903", "@Ryan2903*", "", "The Creator.", "2024-12-11 01:26:28");

INSERT INTO livros VALUES
(9786555354188, "A Canção de Aquiles", "Madeline Miller", "Editora Minotauro", 336),
(9788565765350, "Aristóteles e Dante descobrem os segredos do universo (1)", "Benjamin Alire Sáenz", "Seguinte", 392),
(9788576831303, "Diário de um Banana 1", "Jeff Kinney", "VR Editora", 224),
(9786555665505, "Não era pra ser você", "Thais Bergmann", "Astral Cultural", 272);

INSERT INTO posts (userid, conteudo, livro, pagatual, datapost) VALUES
(1, "MDS MAYARA E CAUÃ TÃO COMEÇANDO A QUERER SE PEGAR IHULLLL", 9786555665505, 163, "2024-11-13");