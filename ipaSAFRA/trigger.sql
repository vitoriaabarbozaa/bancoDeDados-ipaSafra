/* ==========================================================
1. TRIGGER - Atualiza data_atualizacao ao mudar status do rastreamento
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_update_rastreamento_timestamp
BEFORE UPDATE ON rastreamento
FOR EACH ROW
BEGIN
SET NEW.data_atualizacao = NOW();
END $$
DELIMITER ;


/* ==========================================================
2. TRIGGER - Ajusta status do estoque quando quantidade chega a zero
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_estoque_zero
BEFORE UPDATE ON estoque
FOR EACH ROW
BEGIN
IF NEW.quantidade_estoque = 0 THEN
SET NEW.status_estoque = 'esgotado';
END IF;
END $$
DELIMITER ;


/* ==========================================================
3. TRIGGER - Status crítico quando estoque < 10
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_estoque_critico
BEFORE UPDATE ON estoque
FOR EACH ROW
BEGIN
IF NEW.quantidade_estoque < 10 AND NEW.quantidade_estoque > 0 THEN
SET NEW.status_estoque = 'critico';
END IF;
END $$
DELIMITER ;


/* ==========================================================
4. TRIGGER - Impede inserção de agricultor com CPF duplicado
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_block_duplicate_cpf
BEFORE INSERT ON agricultor
FOR EACH ROW
BEGIN
IF (SELECT COUNT(*) FROM agricultor WHERE cpf = NEW.cpf) > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF já cadastrado!';
END IF;
END $$
DELIMITER ;


/* ==========================================================
5. TRIGGER - Gera um movimento de estoque ao inserir insumo
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_insumo_movimento
AFTER INSERT ON insumo
FOR EACH ROW
BEGIN
UPDATE estoque
SET quantidade_estoque = quantidade_estoque - NEW.quantidade_solicitada
WHERE id_estoque = NEW.fk_estoque_id_estoque;
END $$
DELIMITER ;


/* ==========================================================
6. TRIGGER - Log de criação de solicitação
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_log_solicitacao
AFTER INSERT ON solicitacao
FOR EACH ROW
BEGIN
INSERT INTO suporte (nome,email,cidade,telefone,estado,assunto,mensagem,data_envio)
VALUES ('Sistema','sistema@ipa.com','Recife','00000000','PE','Nova Solicitação',
CONCAT('Solicitação criada ID: ', NEW.id_solicitacao), NOW());
END $$
DELIMITER ;


/* ==========================================================
7. TRIGGER - Bloqueia alteração de área de plantio após criação
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_block_area_update
BEFORE UPDATE ON solicitacao
FOR EACH ROW
BEGIN
IF OLD.area_plantio <> NEW.area_plantio THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A área de plantio não pode ser alterada!';
END IF;
END $$
DELIMITER ;


/* ==========================================================
8. TRIGGER - Impede atualização de CPF
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_block_cpf_update
BEFORE UPDATE ON agricultor
FOR EACH ROW
BEGIN
IF OLD.cpf <> NEW.cpf THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF não pode ser alterado!';
END IF;
END $$
DELIMITER ;


/* ==========================================================
9. TRIGGER - Define status de rastreamento como pendente ao criar logística
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_default_rastreamento
AFTER INSERT ON logistica
FOR EACH ROW
BEGIN
INSERT INTO rastreamento (numero_rastreio, status_processamento, data_atualizacao,
fk_solicitacao_id_solicitacao, fk_logistica_id_logistica)
VALUES (CONCAT('RT', NEW.id_logistica, FLOOR(RAND() * 9999)),
'pendente', NOW(), NEW.fk_solicitacao_id_solicitacao, NEW.id_logistica);
END $$
DELIMITER ;


/* ==========================================================
10. TRIGGER - Sempre deixar nome com letras iniciais maiúsculas
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_format_nome_agricultor
BEFORE INSERT ON agricultor
FOR EACH ROW
BEGIN
SET NEW.nome_completo = CONCAT(UCASE(LEFT(NEW.nome_completo,1)),
SUBSTRING(NEW.nome_completo,2));
END $$
DELIMITER ;


/* ==========================================================
11. TRIGGER - Preenche automaticamente previsão de despacho caso não informada
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_auto_previsao_logistica
BEFORE INSERT ON logistica
FOR EACH ROW
BEGIN
IF NEW.previsao_despacho IS NULL THEN
SET NEW.previsao_despacho = DATE_ADD(CURDATE(), INTERVAL 3 DAY);
END IF;
END $$
DELIMITER ;


/* ==========================================================
12. TRIGGER - Impede insumo sem estoque associado
========================================================== */
DELIMITER $$
CREATE TRIGGER tg_block_insumo_sem_estoque
BEFORE INSERT ON insumo
FOR EACH ROW
BEGIN
IF NEW.fk_estoque_id_estoque IS NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insumo deve estar vinculado a um estoque!';
END IF;
END $$
DELIMITER ;