-- select

-- 1. Solicitações com nome do agricultor
SELECT s.*, a.nome_completo
FROM solicitacao s
JOIN agricultor a ON s.fk_agricultor_id_agricultor = a.id_agricultor;
-- Explicação: lista solicitações com seus respectivos agricultores.

-- 2. Logística + solicitação
SELECT l.*, s.finalidade
FROM logistica l
JOIN solicitacao s ON l.fk_solicitacao_id_solicitacao = s.id_solicitacao;
-- Explicação: mostra detalhes da logística com finalidade do pedido.

-- 3. Rastreamento com status + cidade da entrega
SELECT r.numero_rastreio, r.status_processamento, l.cidade
FROM rastreamento r
JOIN logistica l ON r.fk_logistica_id_logistica = l.id_logistica;
-- Explicação: status do rastreio + cidade para onde foi enviado.

-- 4. Agricultores que possuem solicitações
SELECT nome_completo
FROM agricultor
WHERE id_agricultor IN (SELECT fk_agricultor_id_agricultor FROM solicitacao);
-- Explicação: lista apenas agricultores que criaram solicitações.

-- 5. Solicitações com insumo solicitado
SELECT s.id_solicitacao, i.tipo_insumo, i.cultura
FROM solicitacao s
JOIN insumo i ON s.fk_insumo_id_insumo = i.id_insumo;
-- Explicação: une solicitação ao insumo.

-- 6. Solicitações acima de 3 hectares
SELECT * FROM solicitacao WHERE area_plantio > 3;
-- Explicação: filtro simples sobre área.

-- 7. Logística com previsão de despacho futura
SELECT * FROM logistica WHERE previsao_despacho > CURDATE();
-- Explicação: mostra entregas ainda não despachadas.

-- 8. Rastreios concluídos
SELECT * FROM rastreamento WHERE status_processamento = 'entregue';
-- Explicação: rastreios finalizados.

-- 9. Suporte por cidade
SELECT cidade, COUNT(*) qtd
FROM suporte
GROUP BY cidade;
-- Explicação: número de chamados por cidade.

-- 10. Insumos com estoque crítico
SELECT i.*, e.status_estoque
FROM insumo i
JOIN estoque e ON i.fk_estoque_id_estoque = e.id_estoque
WHERE e.status_estoque = 'critico';
-- Explicação: insumos com estoque crítico.

-- 11. Quantidade de solicitações por agricultor
SELECT a.nome_completo, COUNT(*) AS total
FROM solicitacao s
JOIN agricultor a ON s.fk_agricultor_id_agricultor = a.id_agricultor
GROUP BY a.id_agricultor;
-- Explicação: ranking de solicitações.

-- 12. Endereços de propriedade por agricultor
SELECT a.nome_completo, e.logradouro, e.bairro
FROM agricultor a
JOIN endereco_propriedade e ON e.fk_agricultor_id_agricultor = a.id_agricultor;
-- Explicação: local onde fica a propriedade.

-- 13. Solicitações cujo insumo pertence a estoque "esgotado"
SELECT s.id_solicitacao, i.tipo_insumo
FROM solicitacao s
JOIN insumo i ON s.fk_insumo_id_insumo = i.id_insumo
JOIN estoque e ON e.id_estoque = i.fk_estoque_id_estoque
WHERE e.status_estoque = 'esgotado';
-- Explicação: pedidos impossíveis de enviar.

-- 14. Agricultores sem solicitações
SELECT * FROM agricultor a
LEFT JOIN solicitacao s ON s.fk_agricultor_id_agricultor = a.id_agricultor
WHERE s.id_solicitacao IS NULL;
-- Explicação: quem ainda não solicitou nada.

-- 15. Tempo médio entre solicitação e plantio ideal
SELECT AVG(DATEDIFF(data_plantio_ideal, data_solicitacao)) AS tempo_medio
FROM solicitacao;
-- Explicação: diferença média (dias).

-- 16. Quantos rastreamentos cada logística possui
SELECT fk_logistica_id_logistica, COUNT(*)
FROM rastreamento
GROUP BY fk_logistica_id_logistica;
-- Explicação: rastreios por logística.

-- 17. Todas as solicitações e seus status de rastreio
SELECT s.id_solicitacao, r.status_processamento
FROM solicitacao s
LEFT JOIN rastreamento r ON r.fk_solicitacao_id_solicitacao = s.id_solicitacao;
-- Explicação: alguns podem não ter rastreio ainda.

-- 18. Suporte enviados este mês
SELECT * FROM suporte WHERE MONTH(data_envio) = MONTH(NOW());
-- Explicação: chamados recentes.

-- 19. Solicitações ordenadas por tamanho da área
SELECT * FROM solicitacao ORDER BY area_plantio DESC;
-- Explicação: do maior para o menor.

-- 20. Verificar qual agricultor recebeu entregas por cidade
SELECT a.nome_completo, l.cidade
FROM agricultor a
JOIN solicitacao s ON s.fk_agricultor_id_agricultor = a.id_agricultor
JOIN logistica l ON l.fk_solicitacao_id_solicitacao = s.id_solicitacao;
-- Explicação: quem recebeu e onde.
