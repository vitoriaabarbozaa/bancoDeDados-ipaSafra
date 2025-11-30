show databases;
create database ipa_SAFRA;
use ipa_SAFRA;


CREATE TABLE agricultor (
    id_agricultor INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(150),
    cpf CHAR(11),
    tipo_propriedade VARCHAR(60),
    caf VARCHAR(30),
    cep CHAR(8),
    complemento VARCHAR(120)
);

CREATE TABLE endereco_propriedade (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(150),
    cep CHAR(8),
    bairro VARCHAR(80),
    numero VARCHAR(10),
    complemento VARCHAR(120),
    estado CHAR(2),
    ponto_referencia VARCHAR(200),
    fk_agricultor_id_agricultor INT,
    CONSTRAINT FK_agricultor_endereco
        FOREIGN KEY (fk_agricultor_id_agricultor)
        REFERENCES agricultor(id_agricultor)
        ON DELETE CASCADE
);

CREATE TABLE solicitacao (
    id_solicitacao INT PRIMARY KEY AUTO_INCREMENT,
    data_solicitacao DATE,
    finalidade VARCHAR(150),
    area_plantio DECIMAL(10,2),
    data_plantio_ideal DATE,
    fk_agricultor_id_agricultor INT,
    CONSTRAINT FK_agricultor_solicitacao
        FOREIGN KEY (fk_agricultor_id_agricultor)
        REFERENCES agricultor(id_agricultor)
        ON DELETE CASCADE
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_estoque INT,
    status_estoque ENUM('disponivel', 'critico', 'esgotado')
);

CREATE TABLE insumo (
    id_insumo INT PRIMARY KEY AUTO_INCREMENT,
    tipo_insumo VARCHAR(80),
    cultura VARCHAR(80),
    variedade VARCHAR(100),
    quantidade_solicitada VARCHAR(20),
    fk_estoque_id_estoque INT,
    CONSTRAINT FK_insumo_estoque
        FOREIGN KEY (fk_estoque_id_estoque)
        REFERENCES estoque(id_estoque)
        ON DELETE CASCADE
);

ALTER TABLE solicitacao
ADD fk_insumo_id_insumo INT,
ADD CONSTRAINT FK_solicitacao_insumo
    FOREIGN KEY (fk_insumo_id_insumo)
    REFERENCES insumo(id_insumo)
    ON DELETE RESTRICT;

CREATE TABLE logistica (
    id_logistica INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100),
    forma_entrega ENUM('retirada', 'entrega'),
    rua VARCHAR(150),
    cep CHAR(8),
    complemento VARCHAR(120),
    destinatario VARCHAR(150),
    telefone VARCHAR(20),
    previsao_despacho DATE,
    fk_solicitacao_id_solicitacao INT,
    CONSTRAINT FK_logistica_solicitacao
        FOREIGN KEY (fk_solicitacao_id_solicitacao)
        REFERENCES solicitacao(id_solicitacao)
        ON DELETE CASCADE
);

CREATE TABLE rastreamento (
    id_rastreamento INT PRIMARY KEY AUTO_INCREMENT,
    numero_rastreio VARCHAR(50),
    status_processamento ENUM('pendente', 'em processamento', 'despachado', 'entregue'),
    data_atualizacao DATETIME,
    fk_solicitacao_id_solicitacao INT,
    fk_logistica_id_logistica INT,
    CONSTRAINT FK_rastreamento_solicitacao
        FOREIGN KEY (fk_solicitacao_id_solicitacao)
        REFERENCES solicitacao(id_solicitacao)
        ON DELETE CASCADE,
    CONSTRAINT FK_rastreamento_logistica
        FOREIGN KEY (fk_logistica_id_logistica)
        REFERENCES logistica(id_logistica)
        ON DELETE CASCADE
);

CREATE TABLE suporte (
    id_suporte INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    email VARCHAR(150),
    cidade VARCHAR(80),
    telefone VARCHAR(20),
    estado CHAR(2),
    assunto VARCHAR(120),
    mensagem TEXT,
    data_envio DATETIME
);

CREATE TABLE perfil_sustentabilidade (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    data_geracao DATE,
    arquivo_pdf VARCHAR(255),
    fk_agricultor_id_agricultor INT,
    CONSTRAINT FK_perfil_agricultor
        FOREIGN KEY (fk_agricultor_id_agricultor)
        REFERENCES agricultor(id_agricultor)
        ON DELETE CASCADE
);
