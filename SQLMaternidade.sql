CREATE DATABASE maternidade
GO
USE maternidade
GO 
CREATE TABLE mae (
id_mae INT NOT NULL IDENTITY(1001, 1),
nome VARCHAR(60) NOT NULL,
logradouro VARCHAR(100) NOT NULL,
numero INT NOT NULL CHECK (numero > 0),
cep CHAR(08) NOT NULL CHECK(LEN(cep) = 08),
complemento VARCHAR(200) NOT NULL,
telefone CHAR(10) NOT NULL CHECK(LEN(telefone) = 08),
data_nasc DATE NOT NULL
PRIMARY KEY(id_mae)
)
GO 
CREATE TABLE medico(
crm_num INT NOT NULL,
crm_uf CHAR(02) NOT NULL,
nome VARCHAR(60) NOT NULL,
telefone CHAR(11) NOT NULL CHECK(LEN(telefone) = 13) UNIQUE,
especialidade  VARCHAR(30) NOT NULL
PRIMARY KEY (crm_num, crm_uf)
)
GO 
CREATE TABLE bebe(
id INT NOT NULL IDENTITY(1, 1),
nome VARCHAR(60) NOT NULL,
data_nasc DATE NOT NULL DEFAULT GETDATE(),
altura DECIMAL(7, 2) NOT NULL CHECK(altura > 0),
peso DECIMAL(4, 3) NOT NULL CHECK(peso > 0),
id_mae INT NOT NULL
PRIMARY KEY (id)
FOREIGN KEY(id_mae) REFERENCES mae(id_mae)
)
GO 
CREATE TABLE bebe_medico(
id INT NOT NULL IDENTITY(1, 1),
crm_num INT NOT NULL,
crm_uf CHAR(02) NOT NULL
FOREIGN KEY(id) REFERENCES bebe(id),
FOREIGN KEY(crm_num, crm_uf) REFERENCES medico(crm_num, crm_uf)
)














