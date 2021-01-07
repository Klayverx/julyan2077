/* BD_Lógico: */

CREATE TABLE Clientes (
    IdCliente INTEGER PRIMARY KEY,
    Nome VARCHAR,
    E_mail VARCHAR,
    Telefone VARCHAR,
    Senha VARCHAR
);

CREATE TABLE Pedido (
    IdPedido INTEGER PRIMARY KEY,
    Data_do_pedido DATE,
    Nome VARCHAR,
    Data_solicitada DATE,
    Valor_total NUMERIC,
    Mensagem VARCHAR,
    fk_Clientes_IdCliente INTEGER
);

CREATE TABLE Procedimento (
    IdProcedimento INTEGER PRIMARY KEY,
    Resumo VARCHAR,
    Descricao VARCHAR,
    Preco NUMERIC,
    Nome VARCHAR,
    Imagem BLOB
);

CREATE TABLE Tem (
    fk_Pedido_IdPedido INTEGER,
    fk_Procedimento_IdProcedimento INTEGER
);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Clientes_IdCliente)
    REFERENCES Clientes (IdCliente)
    ON DELETE CASCADE;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Pedido_IdPedido)
    REFERENCES Pedido (IdPedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Procedimento_IdProcedimento)
    REFERENCES Procedimento (IdProcedimento)
    ON DELETE RESTRICT;