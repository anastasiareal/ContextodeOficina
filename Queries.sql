-- Inserção de dados para testes
INSERT INTO Cliente (Nome, Endereco, Telefone) VALUES
('Carlos Silva', 'Rua A, 123', '11999999999'),
('Ana Souza', 'Rua B, 456', '11988888888');


INSERT INTO Veiculo (Placa, Modelo, Ano, ClienteID) VALUES
('ABC1234', 'Gol', 2015, 1),
('XYZ5678', 'Fiesta', 2018, 2);


insert INTO Mecanico (Nome, Endereco, Especialidade) VALUES
('João Pedro', 'Rua C, 789', 'Suspensão'),
('Marcos Lima', 'Rua D, 321', 'Freios');


INSERT INTO Equipe (Nome_Equipe) VALUES
('Equipe A'), ('Equipe B');

INSERT INTO OrdemServico (Data_Emissao, Valor_Total, Status, VeiculoID, EquipeID) VALUES
('2024-04-01', 500.00, 'Aberta', 1, 1),
('2024-04-02', 300.00, 'Concluída', 2, 2);


INSERT INTO Servico (Descricao, Valor_Mao_De_Obra) VALUES
('Troca de óleo', 100.00),
('Alinhamento', 150.00);


INSERT INTO Peça (Descricao, Valor_Unitario, Quantidade_Estoque) VALUES
('Óleo 5W30', 50.00, 20),
('Filtro de óleo', 25.00, 15);




-- Consultas SQL para testes

-- Recuperação simples
SELECT * FROM Cliente;

-- Filtro com WHERE
SELECT * FROM OrdemServico WHERE Status = 'Aberta';

-- Expressão para gerar atributo derivado
SELECT Nome, LENGTH(Nome) AS Tamanho_Nome FROM Cliente;

-- Ordenação de dados
SELECT * FROM Veiculo ORDER BY Ano DESC;

-- Uso de HAVING para filtrar grupos
SELECT EquipeID, COUNT(*) AS Total_Servicos FROM OrdemServico GROUP BY EquipeID HAVING COUNT(*) > 1;

-- Junção entre tabelas
SELECT OS.Numero_OS, C.Nome AS Cliente, V.Modelo, E.Nome_Equipe
FROM OrdemServico OS
JOIN Veiculo V ON OS.VeiculoID = V.VeiculoID
JOIN Cliente C ON V.ClienteID = C.ClienteID
JOIN Equipe E ON OS.EquipeID = E.EquipeID




