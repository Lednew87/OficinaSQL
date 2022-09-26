CREATE DATABASE Oficina;

USE Oficina;

CREATE TABLE `Ordem de Serviço` (
	`id_os` INT NOT NULL AUTO_INCREMENT,
	`descrição` varchar(255) NOT NULL,
	`cliente_id_cliente` INT NOT NULL,
	`valor_os` FLOAT NOT NULL,
	`data de emissão` DATETIME NOT NULL,
	`data de conclusão` DATETIME NOT NULL,
	`status_os` varchar(45) NOT NULL,
	`pecas_id_pecas` INT NOT NULL,
	PRIMARY KEY (`id_os`)
);

CREATE TABLE `Cliente` (
	`id_cliente` INT NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`endereço` varchar(45) NOT NULL,
	`cpf` varchar(45) NOT NULL,
	`telefone` varchar(45) NOT NULL,
	`carro` varchar(45) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `Mecânico` (
	`id_mecanico` INT NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`endereço` varchar(45) NOT NULL,
	`especialidade` varchar(45) NOT NULL,
	PRIMARY KEY (`id_mecanico`)
);

CREATE TABLE `Peças` (
	`id_pecas` INT NOT NULL AUTO_INCREMENT,
	`valor` FLOAT NOT NULL,
	`nome` varchar(45) NOT NULL,
	`marca` varchar(45) NOT NULL,
	PRIMARY KEY (`id_pecas`)
);

CREATE TABLE `Consertos` (
	`os_id_os` INT NOT NULL,
	`mecanico_id_mecanico` INT NOT NULL,
	`id_consertos` INT NOT NULL AUTO_INCREMENT,
	`cliente_id_cliente` INT NOT NULL,
	PRIMARY KEY (`id_consertos`)
);

CREATE TABLE `Revisões` (
	`id_revisões` BINARY NOT NULL AUTO_INCREMENT,
	`os_id_os` INT NOT NULL,
	`mecanico_id_mecanico` INT NOT NULL,
	`cliente_id_cliente` INT NOT NULL,
	PRIMARY KEY (`id_revisões`)
);

CREATE TABLE `Valor dos Serviços` (
	`id_vlrservicos` INT NOT NULL AUTO_INCREMENT,
	`descricao do servico` varchar(255) NOT NULL,
	`valor` FLOAT NOT NULL,
	`os_id_os` INT NOT NULL,
	`pecas_id_pecas` INT NOT NULL,
	PRIMARY KEY (`id_vlrservicos`)
);

ALTER TABLE `Ordem de Serviço` ADD CONSTRAINT `Ordem de Serviço_fk0` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `Cliente`(`id_cliente`);

ALTER TABLE `Ordem de Serviço` ADD CONSTRAINT `Ordem de Serviço_fk1` FOREIGN KEY (`pecas_id_pecas`) REFERENCES `Peças`(`id_pecas`);

ALTER TABLE `Consertos` ADD CONSTRAINT `Consertos_fk0` FOREIGN KEY (`os_id_os`) REFERENCES `Ordem de Serviço`(`id_os`);

ALTER TABLE `Consertos` ADD CONSTRAINT `Consertos_fk1` FOREIGN KEY (`mecanico_id_mecanico`) REFERENCES `Mecânico`(`id_mecanico`);

ALTER TABLE `Consertos` ADD CONSTRAINT `Consertos_fk2` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `Cliente`(`id_cliente`);

ALTER TABLE `Revisões` ADD CONSTRAINT `Revisões_fk0` FOREIGN KEY (`os_id_os`) REFERENCES `Ordem de Serviço`(`id_os`);

ALTER TABLE `Revisões` ADD CONSTRAINT `Revisões_fk1` FOREIGN KEY (`mecanico_id_mecanico`) REFERENCES `Mecânico`(`id_mecanico`);

ALTER TABLE `Revisões` ADD CONSTRAINT `Revisões_fk2` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `Cliente`(`id_cliente`);

ALTER TABLE `Valor dos Serviços` ADD CONSTRAINT `Valor dos Serviços_fk0` FOREIGN KEY (`os_id_os`) REFERENCES `Ordem de Serviço`(`id_os`);

ALTER TABLE `Valor dos Serviços` ADD CONSTRAINT `Valor dos Serviços_fk1` FOREIGN KEY (`pecas_id_pecas`) REFERENCES `Peças`(`id_pecas`);

SELECT * FROM `Mecanico`;

SELECT * FROM `Mecanico` WHERE `id_mecanico` AND `nome`;

UPDATE `Peças` SET valor = 200,00 WHERE `valor` <= 190,00;

SELECT `nome`, `endereco` FROM `Cliente` ORDER BY `nome` DESC;

SELECT `nome`, UPPER(`NOME`) FROM `Cliente`;

SELECT `Cliente`, COUNT(10) AS VIP FROM `Ordem de Serviço` GROUP BY `valor_os` HAVING COUNT(10) > 350,00;

SELECT * FROM `Cliente_Consertos`
INNER JOIN `Consertos ON `Consertos`.id_conserto` = `Cliente.id_cliente
INNER JOIN `Consertos` ON  = `Cliente`.id_cliente;






