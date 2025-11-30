-- view

CREATE VIEW vw_solicitacoes_com_agricultor AS
SELECT s.*, a.nome_completo
FROM solicitacao s JOIN agricultor a ON s.fk_agricultor_id_agricultor = a.id_agricultor;

CREATE VIEW vw_logistica_com_solicitacao AS
SELECT l.*, s.finalidade FROM logistica l JOIN solicitacao s ON s.id_solicitacao = l.fk_solicitacao_id_solicitacao;

CREATE VIEW vw_rastreio_completo AS
SELECT r.*, l.cidade FROM rastreamento r JOIN logistica l ON r.fk_logistica_id_logistica = l.id_logistica;

CREATE VIEW vw_suporte_resumo AS
SELECT nome, email, assunto, data_envio FROM suporte;

CREATE VIEW vw_insumos_estoque AS
SELECT i.*, e.status_estoque FROM insumo i JOIN estoque e ON e.id_estoque = i.fk_estoque_id_estoque;

CREATE VIEW vw_agricultores_sem_solicitacao AS
SELECT a.* FROM agricultor a LEFT JOIN solicitacao s ON s.fk_agricultor_id_agricultor = a.id_agricultor WHERE s.id_solicitacao IS NULL;

CREATE VIEW vw_solicitacoes_insumos AS
SELECT s.id_solicitacao, i.tipo_insumo, i.cultura FROM solicitacao s JOIN insumo i ON i.id_insumo = s.fk_insumo_id_insumo;

CREATE VIEW vw_solicitacoes_area_ordenada AS
SELECT * FROM solicitacao ORDER BY area_plantio DESC;

CREATE VIEW vw_estoque_critico AS
SELECT * FROM estoque WHERE status_estoque = 'critico';

CREATE VIEW vw_suporte_cidades AS
SELECT cidade, COUNT(*) AS total FROM suporte GROUP BY cidade;
