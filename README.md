# Projeto Lógico de Banco de Dados  para o Contexto de Oficina
Projeto de banco de dados SQL para o contexto de uma oficina.
O projeto visa a criação de um banco de dados relacional para gerenciar as operações de uma oficina mecânica. O objetivo principal é armazenar e organizar informações sobre clientes, veículos, ordens de serviço, mecânicos, equipes, peças e serviços prestados.
Modelagem e Estrutura do Banco de Dados
Entidades Principais e Relacionamentos

Cliente

Armazena informações sobre os clientes da oficina, incluindo nome, endereço e telefone.
Relacionado com Veículo (um cliente pode ter vários veículos).

Veículo

Representa os veículos atendidos na oficina.
Contém placa, modelo, ano e uma chave estrangeira para Cliente.
Relacionado com Ordem de Serviço (um veículo pode ter várias ordens de serviço).

Mecânico

Registra os mecânicos da oficina, incluindo nome, endereço e especialidade.
Relacionado com Equipe (um mecânico pode fazer parte de várias equipes).

Equipe

Define as equipes de mecânicos responsáveis pelas ordens de serviço.
Relacionado com Ordem de Serviço (uma equipe pode trabalhar em várias ordens de serviço).

Ordem de Serviço (OS)

Centraliza os atendimentos realizados pela oficina.
Contém informações sobre data de emissão, status, valor total e vínculo com Veículo e Equipe.
Relacionado com Serviço e Peça através de tabelas intermediárias (muitos-para-muitos).

Serviço

Define os tipos de serviços prestados, como troca de óleo e alinhamento.
Associado a Ordem de Serviço através da tabela intermediária OS_Serviço.

Peça

Contém informações sobre as peças utilizadas nos reparos.
Associado a Ordem de Serviço através da tabela intermediária OS_Peça.
Referência de Mão de Obra
Define os valores padrões de mão de obra para diferentes serviços.

Tabelas Intermediárias (Relacionamentos Muitos-para-Muitos)

OS_Serviço: Relaciona ordens de serviço com serviços realizados.

OS_Peça: Relaciona ordens de serviço com peças utilizadas.

Mecanico_Equipe: Relaciona mecânicos com equipes de trabalho.


