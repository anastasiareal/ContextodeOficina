-- esquema lógico para o contexto de uma oficina.

CREATE DATABASE OficinaDB;
USE OficinaDB;

-- Tabela Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    VeiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(10) UNIQUE NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Ano YEAR,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID) ON DELETE SET NULL
);


-- Tabela Mecânico
CREATE TABLE Mecanico (
    MecanicoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Especialidade VARCHAR(100)
);


-- Tabela Equipe
CREATE TABLE Equipe (
    EquipeID INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Equipe VARCHAR(100) UNIQUE NOT NULL
);


-- Tabela Ordem de Serviço
CREATE TABLE OrdemServico (
    Numero_OS INT PRIMARY KEY AUTO_INCREMENT,
    Data_Emissao DATE NOT NULL,
    Valor_Total DECIMAL(10,2) DEFAULT 0,
    Status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') NOT NULL,
    Data_Conclusao DATE,
    VeiculoID INT NOT NULL,
    EquipeID INT,
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID) ON DELETE CASCADE,
    FOREIGN KEY (EquipeID) REFERENCES Equipe(EquipeID) ON DELETE SET NULL
);


-- Tabela Serviço
CREATE TABLE Servico (
    ServicoID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255) NOT NULL,
    Valor_Mao_De_Obra DECIMAL(10,2) NOT NULL
);


-- Tabela Peça
CREATE TABLE Peça (
    PecaID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255) NOT NULL,
    Valor_Unitario DECIMAL(10,2) NOT NULL,
    Quantidade_Estoque INT NOT NULL DEFAULT 0
);


-- Tabela de Referência de Mão de Obra
CREATE TABLE ReferenciaMaoDeObra (
    ReferenciaID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Servico VARCHAR(255) NOT NULL,
    Valor_Padrao DECIMAL(10,2) NOT NULL
    );


-- Tabela Ordem de Serviço - Serviço (Relacionamento Muitos-para-Muitos)
CREATE TABLE OS_Servico (
    Numero_OS INT,
    ServicoID INT,
    Quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (Numero_OS, ServicoID),
    FOREIGN KEY (Numero_OS) REFERENCES OrdemServico(Numero_OS) ON DELETE CASCADE,
    FOREIGN KEY (ServicoID) REFERENCES Servico(ServicoID) ON DELETE CASCADE
);


-- Tabela Mecânico - Equipe (Relacionamento Muitos-para-Muitos)
CREATE TABLE Mecanico_Equipe (
    MecanicoID INT,
    EquipeID INT,
    PRIMARY KEY (MecanicoID, EquipeID),
    FOREIGN KEY (MecanicoID) REFERENCES Mecanico(MecanicoID) ON DELETE CASCADE,
    FOREIGN KEY (EquipeID) REFERENCES Equipe(EquipeID) ON DELETE CASCADE
);



-- Tabela Ordem de Serviço - Peça (Relacionamento Muitos-para-Muitos)
CREATE TABLE OS_Peça (
    Numero_OS INT,
    PecaID INT,
    Quantidade_Usada INT NOT NULL DEFAULT 1,
    PRIMARY KEY (Numero_OS, PecaID),
    FOREIGN KEY (Numero_OS) REFERENCES OrdemServico(Numero_OS) ON DELETE CASCADE,
    FOREIGN KEY (PecaID) REFERENCES Peça(PecaID) ON DELETE CASCADE
);






