# 🌾 IPA SAFRA — Banco de Dados (PI – ADS)

> **Projeto Integrador** do curso de Análise e Desenvolvimento de Sistemas – SENAC.

Este repositório contém toda a modelagem e implementação do banco de dados desenvolvido para o sistema **IPA SAFRA**. O projeto tem como objetivo apoiar agricultores beneficiados na solicitação e rastreamento de insumos agrícolas, oferecendo transparência logística, suporte técnico e geração de perfis sustentáveis.

---

## 📌 Conteúdo do Repositório

O projeto inclui:

- Tabelas normalizadas para garantir integridade e clareza dos dados.
- 20 INSERTs por módulo (Solicitação, Logística, Rastreamento e Suporte).
- 20 SELECTs explicados para consulta e estudo.
- 10 Views para consultas otimizadas.
- Procedures e Funções SQL para automatizar rotinas do sistema.
- Triggers para validações e atualizações automáticas com scripts de teste.

### ✔️ 1. Minimundo do Projeto
🌾 SAFRA — Sistema de Apoio ao Fluxo Rural e Abastecimento
Descrição do Projeto

O SAFRA é um sistema desenvolvido para melhorar a gestão do fluxo de produtos agrícolas — desde a solicitação até a entrega final — garantindo organização, rastreamento e suporte dentro da cadeia de abastecimento rural.

O objetivo é otimizar processos, reduzir perdas, organizar comunicações e garantir que produtores, transportadores e instituições consigam operar de forma simples, rápida e eficiente.

O sistema oferece quatro pilares principais:

✔ Solicitações

Registro de pedidos feitos por instituições, produtores ou distribuidores, contendo tipo de produto, quantidade, prioridade e status.
Permite acompanhamento completo do ciclo do pedido.

✔ Logística

Gerencia coletas, entregas, motoristas, datas e rotas.
Garante que cada movimento dentro da cadeia agrícola seja registrado e monitorado.

✔ Rastreamento

Monitora o andamento de cada solicitação em tempo real, atualizando status como:
“em separação”, “em transporte”, “entregue”, “cancelado”.

✔ Suporte

Canal direto para registro e resolução de dúvidas, problemas operacionais ou inconsistências no processo.

### ✔️ 2. Modelos do Banco de Dados
Artefatos de modelagem criados durante o planejamento:
* **Modelo Conceitual:** Diagrama Entidade-Relacionamento (MER).
* **Modelo Lógico:** Modelo Relacional (MR).
* **Modelo Físico:** Definição de tabelas, tipos de dados, chaves (PK/FK) e relacionamentos.

### ✔️ 3. Scripts SQL
Os scripts estão organizados nas seguintes pastas para facilitar a execução:

* **📁 `/DDL` – Criação de Estruturas**
    * Script contendo todos os comandos `CREATE TABLE`, definições de *constraints* e relacionamentos.
* **📁 `/DML` – Inserção de Dados**
    * Scripts com todos os `INSERTS` obrigatórios para popular o banco (mínimo de 20 registros por tabela principal).
* **📁 `/DQL` – Consultas e Relatórios**
    * Arquivo com **20 SELECTs** complexos (utilizando `JOINs` e/ou `Subqueries`), documentados com a descrição do objetivo de cada consulta.
* **📁 `/VIEWS`**
    * Script de criação de **10 Views** que representam relatórios e consultas recorrentes do sistema.
* **📁 `/Procedures-Funcoes`**
    * Implementação de **14 Stored Procedures e Funções** utilizando SP/SQL.
    * *Inclui arquivo adicional com comandos de execução e testes.*
* **📁 `/Triggers`**
    * Implementação de **12 Triggers** para automação e integridade.
    * *Inclui arquivo completo com testes automatizados para validação das triggers.*

---

## 🧩 Entidades Principais

O banco de dados foi modelado para cobrir todo o ciclo de uso do sistema, composto pelas seguintes entidades principais:

* **Agricultor** (Beneficiário)
* **Endereço da Propriedade**
* **Solicitação** (Pedidos de Insumos)
* **Insumo** (Sementes e Mudas)
* **Estoque**
* **Logística**
* **Rastreamento**
* **Suporte**
* **Perfil de Sustentabilidade**

---

## 🚀 Tecnologias Utilizadas

* ![MySQL](https://img.shields.io/badge/MySQL-005C84?style=flat-square&logo=mysql&logoColor=white) **MySQL / MariaDB**
* ![Workbench](https://img.shields.io/badge/MySQL_Workbench-005C84?style=flat-square&logo=mysql&logoColor=white) **MySQL Workbench**
* **BrModelo** (Modelagem Conceitual)
* **SQL ANSI** (DDL, DML, DQL, SP/SQL)

---

## 📢 Como Executar

Para garantir o funcionamento correto do banco de dados, siga rigorosamente a ordem de execução dos arquivos abaixo:

1.  **`create table.sql`**: Cria o banco de dados e a estrutura das tabelas.
2.  **`insert.sql`**: Popula as tabelas com os dados iniciais.
3.  **`select.sql`**: Realiza consultas para validar se os dados foram inseridos corretamente.
4.  **`view.sql`**: Cria as visualizações (views) para relatórios.
5.  **`procedure e funcoes.sql`**: Implementa as funções e procedimentos armazenados.
6.  **`trigger.sql`**: Ativa os gatilhos (triggers) de automação. Execute os comandos de teste em seguida.

---

## 📝 Autora

<div align="center">

| **Maria Vitória Barboza** |
| :---: |
| **Curso:** Análise e Desenvolvimento de Sistemas |
| **Instituição:** SENAC |

</div>
