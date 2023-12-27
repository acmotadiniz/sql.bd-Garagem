CREATE DATABASE BDGaragem;

use BDGaragem;

--Criando tabela Modelo--
CREATE TABLE Modelo
(
	codMod int identity, 
	desc_mod varchar(50),
	PRIMARY KEY(codMod)
);

--Insert tabela Modelo--
INSERT INTO Modelo (desc_mod) VALUES ('Modelo 1');
INSERT INTO Modelo (desc_mod) VALUES ('Modelo 2');
INSERT INTO Modelo (desc_mod) VALUES ('Modelo 3');
INSERT INTO Modelo (desc_mod) VALUES ('Modelo 4');
INSERT INTO Modelo (desc_mod) VALUES ('Modelo 5');

select * from Modelo;

--Criando tabela Cliente--
CREATE TABLE Cliente
(
	cpf varchar(14), 
	nome varchar(30),
	nasc date,
	PRIMARY KEY(cpf)
	);

-- Inserindo na tabela Cliente--
INSERT INTO Cliente (cpf, nome, nasc) VALUES ('453.456.599-01', 'Carolina Diniz', '25/05/2000');
INSERT INTO Cliente (cpf, nome, nasc) VALUES ('187.654.566-02', '´José Carlos', '10/12/1999');
INSERT INTO Cliente (cpf, nome, nasc) VALUES ('456.789.223-02', 'Maria Santos', '22/02/1998');
INSERT INTO Cliente (cpf, nome, nasc) VALUES ('654.987.251-03', 'Ana Mota', '05/12/2002');
INSERT INTO Cliente (cpf, nome, nasc) VALUES ('129.234.453-04', 'Roberto Cruzes', '11/06/1998');

select * from Cliente;


--Criando tabela Patio--
CREATE TABLE Patio
(
	patio_num int identity, 
	enderco varchar(30),
	capacidade int,
	PRIMARY KEY(patio_num)
);
--Insert tabela Patio*/
INSERT INTO Patio (enderco, capacidade) VALUES ('Rua Liberdade, 100', 60);
INSERT INTO Patio (enderco, capacidade) VALUES ('Rua Lagoinha, 154', 30);
INSERT INTO Patio (enderco, capacidade) VALUES ('Avenida Bla, 700', 55);
INSERT INTO Patio (enderco, capacidade) VALUES ('BeiraMar, 4006', 80);
INSERT INTO Patio (enderco, capacidade) VALUES ('Nordestina ,7810', 75);

select * from Patio;

-- criando tabela Veiculo
CREATE TABLE Veiculo
(
placa varchar(8),
codMod int NULL,
cpf varchar(12),
cor varchar(10) NULL,
ano int NULL,
PRIMARY KEY(placa)
);

--Inserts tabela Veiculo--

 INSERT INTO Veiculo (codMod, cpf, placa, cor, ano)
	VALUES (1, '987654321-00', 'XYZ-1234', 'Vermelho', 2015);

	INSERT INTO Veiculo (codMod, cpf, placa, cor, ano)
	VALUES (2, '123456789-00', 'ABC-5678', 'Prata', 2019);

	INSERT INTO Veiculo (codMod, cpf, placa, cor, ano)
	VALUES (1, '555555555-55', 'DEF-9876', 'Azul', 2022);

	INSERT INTO Veiculo (codMod, cpf, placa, cor, ano)
	VALUES (2, '111222333-44', 'JEG-1010', 'Verde', 2018);

	INSERT INTO Veiculo (codMod, cpf, placa, cor, ano)
	VALUES (1, '999888777-66', 'JJJ-2020', 'Branco', 2010);
	select * from Veiculo;
--criacao tabela Estaciona--
CREATE TABLE Estaciona
(
cod int,
patioNum int NULL,
placa varchar(8) NULL,
dtEntrada datetime NULL,
dtSaida datetime NULL,
hsEntrada time NULL,
hsSaida time NULL,
PRIMARY KEY (cod)
);

-- Insert tabela Estaciona--
INSERT INTO Estaciona (pationum, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES (1, 'JJJ-2020', '26/07/2023', '27/07/2023', '10:00:00', '18:00:00');
INSERT INTO Estaciona (pationum, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES (2, 'XYZ-5678', '26/07/2023', '26/07/2023', '09:30:00', '14:45:00');
INSERT INTO Estaciona (pationum, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES (3, 'JEG-1010', '26/07/2023', '28/05/2022', '12:15:00', '15:13:17');
INSERT INTO Estaciona (pationum, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES (4, 'LMN-4567', '25/07/2023', '27/07/2023', '08:30:00', '16:45:00');
INSERT INTO Estaciona (patioNum, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) VALUES (5, 'OPQ-7890', '26/07/2023', '27/07/2023', '10:15:00', '19:30:00');

select * from Estaciona;


--Executando SELECTS usando Inner Join--

-- Exiba a placa e o nome dos donos de todos os veículos:
SELECT Veiculo.placa, Cliente.nome
FROM Veiculo
INNER JOIN Cliente ON Veiculo.cpf = Cliente.cpf;

-- b. Exiba o CPF e o nome do cliente que possui o veículo de placa “JJJ-2020”:
SELECT Cliente.cpf, Cliente.nome
FROM Cliente
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf
WHERE Veiculo.placa = 'JJJ-2020';


-- c. Exiba a placa e a cor do veículo que possui o código de estacionamento 1:
SELECT Veiculo.placa, Veiculo.cor
FROM Veiculo
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 1;


-- d. Exiba o ano e a placa do veículo que possui o código de estacionamento 1:
SELECT Veiculo.ano, Veiculo.placa
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 1;


-- e. Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000:
SELECT Veiculo.placa, Veiculo.ano, Modelo.desc_mod
FROM Veiculo
INNER JOIN Modelo
ON Veiculo.codMod = Modelo.codMod
WHERE Veiculo.ano >= 2000;


-- f. Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEG-1010”:
SELECT Patio.ender, Estaciona.dtEntrada, Estaciona.dtSaida
FROM Estaciona
INNER JOIN Patio
ON Estaciona.patio_num = Patio.patio_num
WHERE Estaciona.placa = 'JEG-1010';


-- g. Exiba a quantidade de vezes que os veículos de cor verde estacionaram:
SELECT COUNT(*) AS quantidade
FROM Veiculo
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Veiculo.cor = 'Verde';


-- h. Liste todos os clientes que possuem carro de modelo 1:
SELECT Cliente.*
FROM Cliente
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf
INNER JOIN Modelo
ON Veiculo.codMod = Modelo.codMod
WHERE Modelo.codMod = 1;


-- i. Liste as placas, os horários de entrada e saída dos veículos de cor verde:
SELECT Veiculo.placa, Estaciona.hsEntrada, Estaciona.hsSaida
FROM Veiculo
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Veiculo.cor = 'Verde';


-- j. Liste todos os estacionamentos do veículo de placa “JJJ-2020”:
SELECT *
FROM Estaciona
WHERE placa = 'JJJ-2020';


-- k. Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2:
SELECT Cliente.nome
FROM Cliente
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 2;


-- l. Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3:
SELECT Cliente.cpf
FROM Cliente
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 3;


-- m. Exiba a descrição do modelo do veículo cujo código do estacionamento é 2:
SELECT Modelo.desc_mod
FROM Modelo
INNER JOIN Veiculo
ON Modelo.codMod = Veiculo.codMod
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 2;


-- n. Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos:
SELECT Veiculo.placa, Cliente.nome, Modelo.desc_mod
FROM Veiculo
INNER JOIN Cliente
ON Veiculo.cpf = Cliente.cpf
INNER JOIN Modelo
ON Veiculo.codMod = Modelo.codMod;



