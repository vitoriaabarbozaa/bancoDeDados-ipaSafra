-- Função 01: retorna total de solicitações de um agricultor
DROP FUNCTION IF EXISTS fn_total_solicitacoes;
CREATE FUNCTION fn_total_solicitacoes(agri INT)
RETURNS INT
DETERMINISTIC
RETURN (SELECT COUNT(*) FROM solicitacao WHERE fk_agricultor_id_agricultor = agri);

-- Função 02: retorna estoque disponível
DROP FUNCTION IF EXISTS fn_estoque_atual;
CREATE FUNCTION fn_estoque_atual(est INT)
RETURNS INT
DETERMINISTIC
RETURN (SELECT quantidade_estoque FROM estoque WHERE id_estoque = est);

-- Função 03: retorna nome do agricultor
DROP FUNCTION IF EXISTS fn_nome_agricultor;
CREATE FUNCTION fn_nome_agricultor(idA INT)
RETURNS VARCHAR(150)
DETERMINISTIC
RETURN (SELECT nome_completo FROM agricultor WHERE id_agricultor = idA);

-- Função 04: retorna cidade da logística
DROP FUNCTION IF EXISTS fn_cidade_logistica;
CREATE FUNCTION fn_cidade_logistica(idLog INT)
RETURNS VARCHAR(100)
DETERMINISTIC
RETURN (SELECT cidade FROM logistica WHERE id_logistica = idLog);

-- Função 05: retorna status do rastreamento
DROP FUNCTION IF EXISTS fn_status_rastreio;
CREATE FUNCTION fn_status_rastreio(idR INT)
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN (SELECT status_processamento FROM rastreamento WHERE id_rastreamento = idR);

-- Função 06: retorna quantidade de insumos pedidos numa solicitação
DROP FUNCTION IF EXISTS fn_insumos_solicitados;
CREATE FUNCTION fn_insumos_solicitados(idS INT)
RETURNS INT
DETERMINISTIC
RETURN (SELECT COUNT(*) FROM insumo WHERE id_insumo = (SELECT fk_insumo_id_insumo FROM solicitacao WHERE id_solicitacao=idS));


DELIMITER //

CREATE PROCEDURE criar_solicitacao (
IN pid_agricultor INT,
IN pdescricao VARCHAR(255),
IN pstatus VARCHAR(50)
)
BEGIN
INSERT INTO solicitacao (id_agricultor, descricao, status)
VALUES (pid_agricultor, pdescricao, pstatus);
END //


CREATE PROCEDURE atualizar_status_solicitacao (
IN pid INT,
IN pnovo_status VARCHAR(50)
)
BEGIN
UPDATE solicitacao
SET status = pnovo_status
WHERE id_solicitacao = pid;
END //


CREATE PROCEDURE deletar_solicitacao (IN pid INT)
BEGIN
DELETE FROM solicitacao WHERE id_solicitacao = pid;
END //


CREATE PROCEDURE listar_solicitacoes_agricultor (IN pid_agri INT)
BEGIN
SELECT * FROM solicitacao WHERE id_agricultor = pid_agri;
END //


CREATE PROCEDURE criar_logistica (
IN pid_solicitacao INT,
IN petapa VARCHAR(50),
IN pdata DATE
)
BEGIN
INSERT INTO logistica (id_solicitacao, etapa, data_prevista)
VALUES (pid_solicitacao, petapa, pdata);
END //


CREATE PROCEDURE atualizar_logistica (
IN pid INT,
IN petapa VARCHAR(50)
)
BEGIN
UPDATE logistica
SET etapa = petapa
WHERE id_logistica = pid;
END //


CREATE PROCEDURE criar_rastreamento (
IN pid_log INT,
IN pstatus VARCHAR(50),
IN pdata DATETIME
)
BEGIN
INSERT INTO rastreamento (id_logistica, status_rastreio, data_atualizacao)
VALUES (pid_log, pstatus, pdata);
END //


CREATE PROCEDURE atualizar_rastreamento (
IN pid INT,
IN pstatus VARCHAR(50)
)
BEGIN
UPDATE rastreamento
SET status_rastreio = pstatus
WHERE id_rastreamento = pid;
END //