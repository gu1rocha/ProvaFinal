/* ITEM A: 
Crie o banco de dados, chamado “empresa” e as tabelas departamento e funcionário. Lembre-se de criar as chaves primárias como geradas automaticamente e a chave estrangeira entre a tabela Funcionário e a tabela Departamento.
*/
CREATE DATABASE empresa;
USE empresa;
CREATE TABLE departamento(
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
);

CREATE TABLE funcionario(
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    salario VARCHAR(50) NOT NULL,
    codigo_departamento INT NOT NULL,
    CONSTRAINT FK_departamento FOREIGN KEY (codigo_departamento) REFERENCES departamento (codigo)
);

/* ITEM B:
Crie os comandos para realizar a inserção dos 3 departamentos e dos 5 funcionários apresentados na tabela.
*/
INSERT INTO departamento (nome) 
    VALUES ('RH'),('TI'),('Financeiro');
    
INSERT INTO funcionario (nome,salario,cor,codigo_departamento) 
    VALUES ('João Silva','2000,00','1'),
    ('Maria Pereira','3000,00','2'),
    ('José Peres','4000,00','2'),
    ('Tereza Cristina','3000,00','3'),
    ('Francisco José','1500,00','3');

/* ITEM C:
Crie um comando para alterar o salário do funcionário José Peres para 5000,00, usando sua chave primária
*/
UPDATE funcionario SET salario = '5000,00' WHERE codigo = 3;

/* ITEM D:
Crie uma consulta que seja capaz de exibir nome do departamento, a quantidade de funcionários e a soma do salário de todos os funcionários daquele departamento
*/
SELECT d.nome, COUNT(f.codigo_departamento) AS qtd_departamento, SUM(f.salario) AS soma_salario
FROM departamento AS d
LEFT JOIN funcionario AS f
ON d.codigo = f.codigo_departamento
GROUP BY d.nome;

/* ITEM E:
Crie um comando para excluir o funcionário Francisco José, usando sua chave primária
*/
DELETE FROM departamento WHERE codigo = 5;