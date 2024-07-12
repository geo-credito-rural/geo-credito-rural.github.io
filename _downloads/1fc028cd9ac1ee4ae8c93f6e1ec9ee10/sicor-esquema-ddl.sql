BEGIN;


--
-- Install PostGIS extension if it is not installed yet.
--
CREATE EXTENSION IF NOT EXISTS postgis;


--
-- Tabela: Instituições financeiras (IFs) do Sicor
--
CREATE TABLE ifssicor
(
  cnpj_if      CHAR(8), 
  nome_if      TEXT NOT NULL,
  segmento_if  TEXT NULL
);

COMMENT ON TABLE ifssicor IS 'Instituições financeiras (IFs) do Sicor';

COMMENT ON COLUMN ifssicor.cnpj_if IS 'CNPJ';
COMMENT ON COLUMN ifssicor.nome_if IS 'Nome';
COMMENT ON COLUMN ifssicor.segmento_if IS 'Segmento';


--
-- Tabela: Tipo de instrumento de crédito
--
CREATE TABLE instrumentocredito
(
  cd_inst_credito  INTEGER,  
  descricao        TEXT NOT NULL,
  sigla            TEXT NOT NULL
);

COMMENT ON TABLE instrumentocredito IS 'Tipo de instrumento de crédito';

COMMENT ON COLUMN instrumentocredito.cd_inst_credito IS 'Código';
COMMENT ON COLUMN instrumentocredito.descricao IS 'Descrição';
COMMENT ON COLUMN instrumentocredito.sigla IS 'Sigla';


--
-- Tabela: Categoria de emitente
--
CREATE TABLE categoriaemitente
(
  cd_categ_emitente  CHAR(4),
  descricao          VARCHAR(100) NOT NULL,
  data_inicio        DATE NOT NULL,
  data_fim           DATE NULL,
  valor_limite       NUMERIC NOT NULL,
  area_maxima        NUMERIC NOT NULL
);

COMMENT ON TABLE categoriaemitente IS 'Categoria de emitente';

COMMENT ON COLUMN categoriaemitente.cd_categ_emitente IS 'Código da categoria do emitente';
COMMENT ON COLUMN categoriaemitente.descricao IS 'Descrição do emitente';
COMMENT ON COLUMN categoriaemitente.data_inicio IS 'Início de validade da categoria do emitente';
COMMENT ON COLUMN categoriaemitente.data_fim IS 'Fim de validade da categoria do emitente';
COMMENT ON COLUMN categoriaemitente.valor_limite IS 'Valor limite para o emitente';
COMMENT ON COLUMN categoriaemitente.area_maxima IS 'Área máxima permissível ao beneficiário';


--
-- Tabela: Fontes de recursos do crédito rural
--
CREATE TABLE fonterecursos
(
  cd_fonte_recurso  CHAR(4), 
  descricao         TEXT NOT NULL,
  data_inicio       DATE NOT NULL,
  data_fim          DATE NOT NULL
);

COMMENT ON TABLE fonterecursos IS 'Fontes de recursos';

COMMENT ON COLUMN fonterecursos.cd_fonte_recurso IS 'Código da fonte de recursos';
COMMENT ON COLUMN fonterecursos.descricao IS 'Descrição da fonte de recursos';
COMMENT ON COLUMN fonterecursos.data_inicio IS 'Início de validade da fonte de recursos';
COMMENT ON COLUMN fonterecursos.data_fim IS 'Fim de validade da fonte de recursos';


--
-- Tabela: Tipo de garantia do empreendimento (seguro)
--
CREATE TABLE tipogarantiaempreendimento
(
  cd_tipo_seguro  CHAR(1),
  descricao       TEXT NOT NULL
);

COMMENT ON TABLE tipogarantiaempreendimento IS 'Tipo de garantia do empreendimento (seguro)';

COMMENT ON COLUMN tipogarantiaempreendimento.cd_tipo_seguro IS 'Código do tipo de seguro';
COMMENT ON COLUMN tipogarantiaempreendimento.descricao IS 'Descrição do tipo de seguro';


--
-- Tabela: Empreendimento (atividade financiável)
--
CREATE TABLE empreendimento
(
  cd_empreendimento        CHAR(14),
  data_inicio              DATE NOT NULL,  -- na documentação a descrição está trocada
  data_fim                 DATE NULL,
  finalidade               TEXT NULL,
  atividade                TEXT NULL,
  modalidade               TEXT NOT NULL,
  produto                  TEXT NOT NULL,
  variedade                TEXT NOT NULL,
  cesta                    TEXT NOT NULL,
  zoneamento               TEXT NULL,
  unidade_medida           TEXT NOT NULL,
  unidade_medida_previsao  TEXT NOT NULL,
  consorcio                TEXT NOT NULL,
  cedula_mae               INTEGER NOT NULL,
  cd_tipo_cultura          INTEGER NULL       -- REVER se é chave estrangeira
);

COMMENT ON TABLE empreendimento IS 'Empreendimento';

COMMENT ON COLUMN empreendimento.cd_empreendimento IS 'Código do empreendimento';
COMMENT ON COLUMN empreendimento.data_inicio IS 'Início de validade do empreendimento';
COMMENT ON COLUMN empreendimento.data_fim IS 'Fim de validade do empreendimento';
COMMENT ON COLUMN empreendimento.finalidade IS 'Finalidade do empreendimento';
COMMENT ON COLUMN empreendimento.atividade IS 'Atividade do empreendimento';
COMMENT ON COLUMN empreendimento.modalidade IS 'Modalidade do empreendimento';
COMMENT ON COLUMN empreendimento.produto IS 'Produto do empreendimento';
COMMENT ON COLUMN empreendimento.variedade IS 'Variedade do empreendimento';
COMMENT ON COLUMN empreendimento.cesta IS 'Cesta de safras do empreendimento';
COMMENT ON COLUMN empreendimento.zoneamento IS 'Zoneamento do empreendimento';
COMMENT ON COLUMN empreendimento.unidade_medida IS 'Unidade de medida do empreendimento ';
COMMENT ON COLUMN empreendimento.unidade_medida_previsao IS 'Unidade de medida de previsão de produção';
COMMENT ON COLUMN empreendimento.consorcio IS 'Consórcio do empreendimento';
COMMENT ON COLUMN empreendimento.cedula_mae IS 'Indica se o empreendimento refere-se a uma cédula mãe';
COMMENT ON COLUMN empreendimento.cd_tipo_cultura IS 'Código do tipo de cultura do empreendimento';


--
-- Tabela: Programa ou linha de crédito
--
CREATE TABLE programa
(
  cd_programa    CHAR(4),
  descricao      TEXT NOT NULL,
  data_inicio    DATE NOT NULL,
  data_fim       DATE NULL,
  financiamento  TEXT NOT NULL
);

COMMENT ON TABLE programa IS 'Programa';

COMMENT ON COLUMN programa.cd_programa IS 'Código do Programa';
COMMENT ON COLUMN programa.DESCRICAO IS 'Descrição do programa';
COMMENT ON COLUMN programa.DATA_INICIO IS 'Início de validade do programa';
COMMENT ON COLUMN programa.DATA_FIM IS 'Fim de validade do programa';
COMMENT ON COLUMN programa.FINANCIAMENTO IS 'Financiamento do Programa';


--
-- Tabela: Subprogramas
--
CREATE TABLE subprograma
(
  cd_subprograma         CHAR(4),
  descricao_subprograma  TEXT NOT NULL,
  vl_taxa_juros          NUMERIC NOT NULL,
  codigo_programa        CHAR(4) NOT NULL
);

COMMENT ON TABLE subprograma IS 'Subprogramas';

COMMENT ON COLUMN subprograma.cd_subprograma IS 'Código do subprograma';
COMMENT ON COLUMN subprograma.descricao_subprograma IS 'Descrição do subprograma';
COMMENT ON COLUMN subprograma.vl_taxa_juros IS 'Juros do subprograma';
COMMENT ON COLUMN subprograma.codigo_programa IS 'Código do programa';


--
-- Tabela:Encargos financeiros
--
CREATE TABLE encargosfinanceiroscomplementares
(
  cd_tipo_encarg_financ  INTEGER,
  descricao              TEXT NOT NULL
);

COMMENT ON TABLE encargosfinanceiroscomplementares IS 'Encargos financeiros';

COMMENT ON COLUMN encargosfinanceiroscomplementares.cd_tipo_encarg_financ IS 'Código do encargo financeiro complementar';
COMMENT ON COLUMN encargosfinanceiroscomplementares.descricao IS 'Descrição do encargo financeiro complementar';

--
-- Tabela: Tipo de irrigação
--
CREATE TABLE tipoirrigacao
(
  cd_tipo_irrigacao  CHAR(2),
  descricao          TEXT NOT NULL
);

COMMENT ON TABLE tipoirrigacao IS 'Tipo de irrigação';

COMMENT ON COLUMN tipoirrigacao.cd_tipo_irrigacao IS 'Código do tipo de irrigação';
COMMENT ON COLUMN tipoirrigacao.DESCRICAO IS 'Descrição do tipo de irrigação';


--
-- Tabela: Tipo de Agricultura/Agropecuária
--
CREATE TABLE tipoagropecuaria
(
  cd_tipo_agricultura  CHAR(1),
  descricao            TEXT NOT NULL
);

COMMENT ON TABLE tipoagropecuaria IS 'Tipo de Agricultura/Agropecuária';

COMMENT ON COLUMN tipoagropecuaria.cd_tipo_agricultura IS 'Código do tipo de agricultura';
COMMENT ON COLUMN tipoagropecuaria.descricao IS 'Descrição do tipo de agricultura';


--
-- Tabela: Fase/Ciclo de produção
--
CREATE TABLE fasecicloproducao
(
  cd_fase_ciclo_producao   CHAR(2),
  descricao                TEXT NOT NULL
);

COMMENT ON TABLE fasecicloproducao IS 'Fase/Ciclo de produção';

COMMENT ON COLUMN fasecicloproducao.cd_fase_ciclo_producao IS 'Código';
COMMENT ON COLUMN fasecicloproducao.descricao IS 'Descrição';


--
-- Tabela: Tipo de cultivo
--
CREATE TABLE tipocultivo
(
  cd_tipo_cultivo  CHAR(2),
  descricao        TEXT NOT NULL
);

COMMENT ON TABLE tipocultivo IS 'Tipo de cultivo';

COMMENT ON COLUMN tipocultivo.cd_tipo_cultivo IS 'Código do tipo de cultivo';
COMMENT ON COLUMN tipocultivo.descricao IS 'Descrição do tipo de cultivo';


--
-- Tabela: Tipo de Integração/Consórcio
--
CREATE TABLE tipointegracao
(
  cd_tipo_intgr_consor  CHAR(1),
  descricao             TEXT NOT NULL
);

COMMENT ON TABLE tipointegracao IS 'Tipo de Integração/Consórcio';

COMMENT ON COLUMN tipointegracao.cd_tipo_intgr_consor IS 'Código do tipo de integração/consórcio';
COMMENT ON COLUMN tipointegracao.descricao IS 'Descrição do tipo de integração/consórcio';


--
-- Tabela: Tipos de grão/semente
--
CREATE TABLE graosemente
(
  cd_tipo_grao_semente  CHAR(1),
  descricao             TEXT NOT NULL
);

COMMENT ON TABLE graosemente IS 'Tipos de grão/semente';

COMMENT ON COLUMN graosemente.cd_tipo_grao_semente IS 'Código do tipo de grão/semente';
COMMENT ON COLUMN graosemente.descricao IS 'Descrição do tipo de grão/semente';


--
-- Tabela: Ciclo do Cultivar
--
CREATE TABLE ciclocultivarproagro
(
  cd_ciclo_cultivar  INTEGER,
  descricao_ciclo    TEXT NOT NULL
);

COMMENT ON TABLE ciclocultivarproagro IS 'Ciclo do Cultivar';

COMMENT ON COLUMN ciclocultivarproagro.cd_ciclo_cultivar IS 'Código do ciclo do cultivar';
COMMENT ON COLUMN ciclocultivarproagro.descricao_ciclo IS 'Descrição do ciclo do cultivar';


--
-- Tabela: Tipo de solo
--
CREATE TABLE tiposoloproagro
(
  cd_tipo_solo         INTEGER,
  descricao_tipo_solo  TEXT NOT NULL
);

COMMENT ON TABLE tiposoloproagro IS 'Tipo de solo';

COMMENT ON COLUMN tiposoloproagro.cd_tipo_solo IS 'Código do tipo de solo ';
COMMENT ON COLUMN tiposoloproagro.descricao_tipo_solo IS 'Descrição do tipo de solo';


--
-- Tabela: Operações contratadas (Financiamentos)
--
CREATE TABLE sicor_operacao_basica_estado
(
  ref_bacen                           INTEGER NOT NULL,
  nu_ordem                            INTEGER NOT NULL,
  cnpj_if                             CHAR(8) NOT NULL,
  dt_emissao                          DATE NOT NULL,
  dt_vencimento                       DATE NOT NULL,
--  cd_inst_credito                     CHAR(2) NOT NULL,
  cd_inst_credito                     INTEGER NOT NULL,
  cd_categ_emitente                   CHAR(4) NOT NULL,
  cd_fonte_recurso                    CHAR(4) NOT NULL,
  cnpj_agente_invest                  CHAR(8) NULL,
  cd_estado                           CHAR(2) NOT NULL,
  cd_ref_bacen_investimento           CHAR(11) NULL,
  cd_tipo_seguro                      CHAR(1) NOT NULL,
  cd_empreendimento                   CHAR(14) NOT NULL,
  cd_programa                         CHAR(4) NOT NULL,
  cd_tipo_encarg_financ               INTEGER NOT NULL,
  cd_tipo_irrigacao                   CHAR(2) NOT NULL,
  cd_tipo_agricultura                 CHAR(1) NOT NULL,
  cd_fase_ciclo_producao              CHAR(2) NOT NULL,
  cd_tipo_cultivo                     CHAR(2) NOT NULL,
  cd_tipo_intgr_consor                CHAR(1) NOT NULL,
  cd_tipo_grao_semente                CHAR(1) NOT NULL,
  vl_aliq_proagro                     NUMERIC NULL,
  vl_juros                            NUMERIC NOT NULL,
  vl_prestacao_investimento           NUMERIC NULL,
  vl_prev_prod                        NUMERIC NULL,
  vl_quantidade                       NUMERIC NULL,
  vl_receita_bruta_esperada           NUMERIC NULL,
  vl_parc_credito                     NUMERIC NOT NULL,
  vl_rec_proprio                      NUMERIC NULL,
  vl_perc_risco_stn                   NUMERIC NULL,
  vl_perc_risco_fundo_const           NUMERIC NULL,
  vl_rec_proprio_srv                  NUMERIC NULL,
  vl_area_financ                      NUMERIC NULL,
  cd_subprograma                      CHAR(4) NULL,
  vl_produtiv_obtida                  NUMERIC NULL,
  dt_fim_colheita                     DATE NULL,
  dt_fim_plantio                      DATE NULL,
  dt_inic_colheita                    DATE NULL,
  dt_inic_plantio                     DATE NULL,
  vl_juros_enc_finan_posfix           NUMERIC NULL,
  vl_perc_custo_efet_total            NUMERIC NULL,
  cd_contrato_stn                     CHAR(13) NULL, -- REVER se é FK
  cd_cnpj_cadastrante                 CHAR(8) NULL,  -- REVER se é FK
  vl_area_informada                   NUMERIC NULL,
  cd_ciclo_cultivar                   INTEGER NOT NULL,
  cd_tipo_solo                        INTEGER NOT NULL
);

COMMENT ON TABLE sicor_operacao_basica_estado IS 'Operações do Sicor';

COMMENT ON COLUMN sicor_operacao_basica_estado.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_operacao_basica_estado.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_operacao_basica_estado.cnpj_if IS 'Concedente do crédito';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_emissao IS 'Data de emissão da operação';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_vencimento IS 'Data de vencimento da operação';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_inst_credito IS 'Código do instrumento de crédito ';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_categ_emitente IS 'Código da categoria do emitente';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_fonte_recurso IS 'Código da fonte de recursos';
COMMENT ON COLUMN sicor_operacao_basica_estado.cnpj_agente_invest IS 'Concedente da operação de investimento';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_estado IS 'Unidade da federação';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_ref_bacen_investimento IS 'Código do refbacen de investimento';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_seguro IS 'Código do tipo de seguro';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_empreendimento IS 'Código do empreendimento';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_programa IS 'Código do programa';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_encarg_financ IS 'Código do tipo de encargos financeiros';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_irrigacao IS 'Código de tipo de irrigação';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_agricultura IS 'Código do tipo de agricultura';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_fase_ciclo_producao IS 'Código da fase ciclo de produção';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_cultivo IS 'Código do tipo de cultivo';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_intgr_consor IS 'Código do tipo de integração/consórcio';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_grao_semente IS 'Código do tipo de grão/semente';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_aliq_proagro IS 'Alíquota do Proagro';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_juros IS 'Juros';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_prestacao_investimento IS 'Valor da prestação de investimento';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_prev_prod IS 'Previsão de produção';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_quantidade IS 'Quantidade';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_receita_bruta_esperada IS 'Receita bruta esperada';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_parc_credito IS 'Valor da parcela de crédito';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_rec_proprio IS 'Valor do recurso próprio';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_perc_risco_stn IS 'Risco da STN';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_perc_risco_fundo_const IS 'Risco do fundo constitucional';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_rec_proprio_srv IS 'Garantia de renda mínima';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_area_financ IS 'VL_AREA_INFORMADA * VL_PARC_CREDITO / (VL_PARC_CREDITO+ VL_REC_PROPRIO)';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_subprograma IS 'Código do subprograma';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_produtiv_obtida IS 'Produtividade obtida';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_fim_colheita IS 'Fim de colheita ';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_fim_plantio IS 'Fim de plantio';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_inic_colheita IS 'Início de colheita ';
COMMENT ON COLUMN sicor_operacao_basica_estado.dt_inic_plantio IS 'Início de plantio';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_juros_enc_finan_posfix IS 'Juros do encargo financeiro ';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_perc_custo_efet_total IS 'Custo efetivo total';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_contrato_stn IS 'Código da Secretaria do Tesouro Nacional';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_cnpj_cadastrante IS 'IF cadastrante da operação';
COMMENT ON COLUMN sicor_operacao_basica_estado.vl_area_informada IS 'Área empreendimento informada';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_ciclo_cultivar IS 'Código do ciclo do cultivar';
COMMENT ON COLUMN sicor_operacao_basica_estado.cd_tipo_solo IS 'Código do tipo do solo';


--
-- Tabela: Situação da operação
--
CREATE TABLE situacaooperacao
(
  cd_situacao_operacao   INTEGER,
  descricao              TEXT NOT NULL
);

COMMENT ON TABLE situacaooperacao IS 'Situação da operação';

COMMENT ON COLUMN situacaooperacao.cd_situacao_operacao IS 'Código da situação da operação';
COMMENT ON COLUMN situacaooperacao.descricao IS 'Descrição da situação da operação';


--
-- Tabela: Saldos de operações contratadas
--
CREATE TABLE sicor_saldos
(
  ref_bacen                 INTEGER NOT NULL,
  nu_ordem                  INTEGER NOT NULL,
  ano_base                  INTEGER NOT NULL,
  mes_base                  INTEGER NOT NULL,
  vl_medio_diario_vincendo  NUMERIC NOT NULL,
  vl_ultimo_dia             NUMERIC NOT NULL,
  vl_medio_diario           NUMERIC NOT NULL,
  cd_situacao_operacao      INTEGER NOT NULL
);

COMMENT ON TABLE sicor_saldos IS 'Saldos';

COMMENT ON COLUMN sicor_saldos.ano_base IS 'Ano base do solado';
COMMENT ON COLUMN sicor_saldos.cd_situacao_operacao IS 'Situação da operação';
COMMENT ON COLUMN sicor_saldos.mes_base IS 'Mês base';
COMMENT ON COLUMN sicor_saldos.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_saldos.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_saldos.vl_medio_diario IS 'Saldo médio diário';
COMMENT ON COLUMN sicor_saldos.vl_medio_diario_vincendo IS 'Saldo médio diário vincendo';
COMMENT ON COLUMN sicor_saldos.vl_ultimo_dia IS 'Saldo do último dia';


--
-- Tabela: Liberação de recursos
--
CREATE TABLE sicor_liberacao_recursos
(
  dt_liberacao DATE NOT NULL,
  vl_liberado  NUMERIC NOT NULL,
  ref_bacen    INTEGER NOT NULL,
  nu_ordem     INTEGER NOT NULL
);

COMMENT ON TABLE sicor_liberacao_recursos IS 'Liberação de recursos';

COMMENT ON COLUMN sicor_liberacao_recursos.dt_liberacao IS 'Data de liberação de recursos';
COMMENT ON COLUMN sicor_liberacao_recursos.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_liberacao_recursos.ref_bacen IS 'Número do refbacen';
COMMENT ON COLUMN sicor_liberacao_recursos.vl_liberado IS 'Valor liberado';


--
-- Tabela: Eventos do Proagro
--
CREATE TABLE eventoproagro
(
  cd_evento     INTEGER NOT NULL,
  nome_evento   TEXT NOT NULL
);

COMMENT ON TABLE eventoproagro IS 'Eventos do Proagro';

COMMENT ON COLUMN eventoproagro.cd_evento IS 'Código do evento do proagro';
COMMENT ON COLUMN eventoproagro.nome_evento IS 'Descrição do evento do proagro';


--
-- Tabela: Status dos pedidos de cobertura do Proagro (COP)
--
CREATE TABLE statuscopproagro
(
  cd_status   INTEGER NOT NULL,
  descricao   TEXT NOT NULL
);

COMMENT ON TABLE statuscopproagro IS 'Status da COP';

COMMENT ON COLUMN statuscopproagro.cd_status IS 'Código do status da COP';
COMMENT ON COLUMN statuscopproagro.descricao IS 'Descrição do status da COP';


--
-- Tabela: Pedidos de cobertura do Proagro (COP)
--
CREATE TABLE sicor_cop_basico
(
  ref_bacen           INTEGER NOT NULL,
  nu_ordem            INTEGER NOT NULL,
  dt_comunicacao      DATE NOT NULL,
  dt_fim_colheita     DATE NOT NULL,
  dt_fim_plantio      DATE NOT NULL,
  dt_inicio_colheita  DATE NOT NULL,
  dt_inicio_plantio   DATE NOT NULL,
  cd_status           INTEGER NOT NULL,
  cd_ciclo_cultivar   INTEGER NOT NULL,
  cd_tipo_solo        INTEGER NOT NULL,
  cd_evento           INTEGER NOT NULL
);

COMMENT ON TABLE sicor_cop_basico IS 'Pedidos de cobertura do Proagro (COP)';

COMMENT ON COLUMN sicor_cop_basico.cd_ciclo_cultivar IS 'Código do ciclo do cultivar';
COMMENT ON COLUMN sicor_cop_basico.cd_evento IS 'Código do evento da cop';
COMMENT ON COLUMN sicor_cop_basico.cd_status IS 'Código do status da cop';
COMMENT ON COLUMN sicor_cop_basico.cd_tipo_solo IS 'Código do tipo de solo';
COMMENT ON COLUMN sicor_cop_basico.dt_comunicacao IS 'Data de comunicação da cop';
COMMENT ON COLUMN sicor_cop_basico.dt_fim_colheita IS 'Fim de colheita';
COMMENT ON COLUMN sicor_cop_basico.dt_fim_plantio IS 'Fim de plantio';
COMMENT ON COLUMN sicor_cop_basico.dt_inicio_colheita IS 'Início de colheita';
COMMENT ON COLUMN sicor_cop_basico.dt_inicio_plantio IS 'Início de plantio';
COMMENT ON COLUMN sicor_cop_basico.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_cop_basico.ref_bacen IS 'Número do refbacen';


--
-- Tabela: Relatórios de comprovação de perdas do Proagro
--
CREATE TABLE sicor_rcp_basico
(
  ref_bacen               INTEGER NOT NULL,
  nu_ordem                INTEGER NOT NULL,
  dt_entrega              DATE NOT NULL,
  dt_fim_colheita         DATE NOT NULL,
  dt_fim_evento           DATE NOT NULL,
  dt_fim_plantio          DATE NOT NULL,
  dt_inicio_colheita      DATE NOT NULL,
  dt_inicio_evento        DATE NOT NULL,
  dt_inicio_plantio       DATE NOT NULL,
  vl_area                 NUMERIC NULL,
  vl_prev_prod            NUMERIC NOT NULL,
  vl_rec_prev             NUMERIC NOT NULL,
  cd_status               INTEGER NOT NULL,
  cd_tipo                 INTEGER NOT NULL,
  cd_evento               INTEGER NOT NULL,
  dt_visita               DATE NOT NULL,
  nu_dias_ciclo_cultivar  INTEGER NULL
);

COMMENT ON TABLE sicor_rcp_basico IS 'Relatório de comprovação de perdas do Proagro';

COMMENT ON COLUMN sicor_rcp_basico.cd_evento IS ' Evento do RCP';
COMMENT ON COLUMN sicor_rcp_basico.cd_status IS 'Status do RCP';
COMMENT ON COLUMN sicor_rcp_basico.cd_tipo IS 'Tipo do RCP';
COMMENT ON COLUMN sicor_rcp_basico.dt_entrega IS 'Data de entrega do RCP';
COMMENT ON COLUMN sicor_rcp_basico.dt_fim_colheita IS 'Fim de colheita';
COMMENT ON COLUMN sicor_rcp_basico.dt_fim_evento IS 'Fim de evento';
COMMENT ON COLUMN sicor_rcp_basico.dt_fim_plantio IS 'Fim de plantio';
COMMENT ON COLUMN sicor_rcp_basico.dt_inicio_colheita IS 'Início de colheita';
COMMENT ON COLUMN sicor_rcp_basico.dt_inicio_evento IS 'Início de evento';
COMMENT ON COLUMN sicor_rcp_basico.dt_inicio_plantio IS 'Início de plantio';
COMMENT ON COLUMN sicor_rcp_basico.dt_visita IS 'Data de visita do perito';
COMMENT ON COLUMN sicor_rcp_basico.nu_dias_ciclo_cultivar IS 'Número de ciclos do cultivar';
COMMENT ON COLUMN sicor_rcp_basico.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_rcp_basico.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_rcp_basico.vl_area IS 'Área';
COMMENT ON COLUMN sicor_rcp_basico.vl_prev_prod IS 'Previsão de produção';
COMMENT ON COLUMN sicor_rcp_basico.vl_rec_prev IS 'Valor da receita prevista correspondente';


--
-- Tabela: Parcelas do cronograma de desembolso
--
CREATE TABLE sicor_parcelas_desembolso
(
  ref_bacen          INTEGER NOT NULL,
  nu_ordem           INTEGER NOT NULL,
  dt_prev_pagamento  DATE NOT NULL,
  valor_parcela      NUMERIC NOT NULL
);

COMMENT ON TABLE sicor_parcelas_desembolso IS 'Parcelas do cronograma de desembolso';

COMMENT ON COLUMN sicor_parcelas_desembolso.ref_bacen IS 'Número do refbacen';
COMMENT ON COLUMN sicor_parcelas_desembolso.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_parcelas_desembolso.dt_prev_pagamento IS 'Data previsão pagamento';
COMMENT ON COLUMN sicor_parcelas_desembolso.valor_parcela IS 'Valor da parcela';


--
-- Tabela: Status da parcela do Proagro
--
CREATE TABLE statusparcelaproagro
(
  cd_status   INTEGER NOT NULL,
  descricao   TEXT NOT NULL
);

COMMENT ON TABLE statusparcelaproagro IS 'Status da parcela do Proagro';

COMMENT ON COLUMN statusparcelaproagro.cd_status IS 'Código do status da parcela do Proagro';
COMMENT ON COLUMN statusparcelaproagro.descricao IS 'Descrição do status da parcela do Proagro';


--
-- Tabela: Natureza das parcelas do Proagro
--
CREATE TABLE naturezaproagro
(
  cd_natureza_parcela   CHAR(3) NOT NULL,
  descricao             TEXT NOT NULL
);

COMMENT ON TABLE naturezaproagro IS 'Natureza do Proagro';

COMMENT ON COLUMN naturezaproagro.cd_natureza_parcela IS 'Código da natureza da parcela do proagro';
COMMENT ON COLUMN naturezaproagro.descricao IS 'Descrição da natureza da parcela do proagro';


--
-- Tabela: Instância do proagro
--
CREATE TABLE instanciaproagro
(
  cd_instancia   INTEGER NOT NULL,
  descricao      TEXT NULL
);

COMMENT ON TABLE instanciaproagro IS 'Instância do proagro';

COMMENT ON COLUMN instanciaproagro.cd_instancia IS 'Código de instância do Proagro';
COMMENT ON COLUMN instanciaproagro.descricao IS 'Descrição de instância do Proagro';


--
-- Tabela: Parcelas do Proagro
--
CREATE TABLE sicor_parcelas_proagro
(
  ref_bacen            INTEGER NOT NULL,
  nu_ordem             INTEGER NOT NULL,
  dt_base              DATE NOT NULL,
  dt_pagamento         DATE NULL,
  cd_instancia         INTEGER NOT NULL,
  cd_status            INTEGER NOT NULL,
  cd_natureza_parcela  CHAR(3) NOT NULL,
  dt_atualizacao       DATE NULL,
  vl_atual             NUMERIC NULL,
  vl_base              NUMERIC NOT NULL,
  vl_pago              NUMERIC NULL,
  vl_imposto           NUMERIC NULL,
  dt_remessa           DATE NOT NULL
);

COMMENT ON TABLE sicor_parcelas_proagro IS 'Parcelas do Proagro';

COMMENT ON COLUMN sicor_parcelas_proagro.cd_instancia IS 'Instância de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.cd_natureza_parcela IS 'Natureza de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.cd_status IS 'Status de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.dt_atualizacao IS 'Data de atualização de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.dt_base IS 'Data base de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.dt_pagamento IS 'Data de pagamento de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.dt_remessa IS 'Data de remessa de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_parcelas_proagro.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_parcelas_proagro.vl_atual IS 'Valor atual de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.vl_base IS 'Valor base de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.vl_imposto IS 'Valor do imposto de parcela do Proagro';
COMMENT ON COLUMN sicor_parcelas_proagro.vl_pago IS 'Valor pago de parcela do Proagro';


--
-- Tabela: Súmula de julgamento do Proagro
--
CREATE TABLE sicor_sumula_julgamento_basico
(
  ref_bacen                               INTEGER NOT NULL,
  nu_ordem                                INTEGER NOT NULL,
  vl_cob_ant_parcela_invest_proagro_mais  NUMERIC NOT NULL,
  vl_remu_encarr_comprov_perdas           NUMERIC NOT NULL,
  cd_status                               INTEGER NOT NULL,
  vl_receitas_consideradas                NUMERIC NOT NULL,
  vl_cobertura_ant_rec_proprios           NUMERIC NOT NULL,
  vl_demais_despesas_comprov_perd         NUMERIC NOT NULL,
  vl_cred_custeio_usado                   NUMERIC NOT NULL,
  vl_demais_desp_ant_comp_per             NUMERIC NOT NULL,
  vl_rec_prop_usado                       NUMERIC NOT NULL,
  vl_cob_ant_garantia_renda_min           NUMERIC NOT NULL,
  cd_instancia                            INTEGER NOT NULL,
  vl_perdas_nao_amparadas                 NUMERIC NOT NULL,
  vl_encargos_sob_credito                 NUMERIC NOT NULL,
  dt_inclusao                             DATE NOT NULL,
  vl_perc_redutor_cobertura               NUMERIC NOT NULL,
  vl_remu_ant_encarg_comp_perdas          NUMERIC NOT NULL,
  cd_decisao                              INTEGER NOT NULL,
  dt_decisao                              DATE NOT NULL,
  dt_base                                 DATE NOT NULL,
  vl_cobertura_ant_credito_custeio        NUMERIC NOT NULL,

-- colunas que não existem no modelo
  vl_bonus_pgaf                           NUMERIC NOT NULL,
  vl_deducoes_legais                      NUMERIC NOT NULL,
  vl_orcamento_enquadrado                 NUMERIC NOT NULL,
  nu_dias_uteis_atraso_perito             INTEGER NOT NULL,
  ib_segunda_vistoria                     INTEGER NOT NULL
);

COMMENT ON TABLE sicor_sumula_julgamento_basico IS 'Súmula de julgamento do Proagro';

COMMENT ON COLUMN sicor_sumula_julgamento_basico.cd_decisao IS 'Data da decisão na súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.cd_instancia IS 'Instância da súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.cd_status IS 'Status da súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.dt_base IS 'Data base da súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.dt_decisao IS 'Data da decisão na súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.dt_inclusao IS 'Data de inclusão da súmula de julgamento';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_cob_ant_garantia_renda_min IS 'Cobertura da Garantia de Renda Mínima do Proagro Mais';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_cob_ant_parcela_invest_proagro_mais IS 'Cobertura da Parcela de Investimento do Proagro Mais';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_cobertura_ant_credito_custeio IS 'Cobertura anterior do Crédito de Custeio';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_cobertura_ant_rec_proprios IS 'Cobertura anterior dos recursos próprios';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_cred_custeio_usado IS 'Crédito de custeio utilizado';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_demais_desp_ant_comp_per IS 'Demais Despesas Anteriores da Comprovação de Perdas';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_demais_despesas_comprov_perd IS 'Demais Despesas da Comprovação de Perdas';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_encargos_sob_credito IS 'Encargos financeiros sobre o crédito utilizado';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_perc_redutor_cobertura IS 'Percentual do redutor de cobertura';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_perdas_nao_amparadas IS 'Perdas não amparadas';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_rec_prop_usado IS ' Recursos próprios utilizados';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_receitas_consideradas IS 'Receitas consideradas';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_remu_ant_encarg_comp_perdas IS 'Remuneração Anterior do Encarregado da Comprovação de Perdas';
COMMENT ON COLUMN sicor_sumula_julgamento_basico.vl_remu_encarr_comprov_perdas IS 'Remuneração do encarregado da comprovação de perdas';


--
-- Tabela: Motivo da desclassificação da operação
--
CREATE TABLE motivodesclassificacao
(
  cd_motivo_desc  INTEGER NOT NULL,
  descricao       TEXT NULL
);

COMMENT ON TABLE motivodesclassificacao IS 'Motivo da desclassificação da operação';

COMMENT ON COLUMN motivodesclassificacao.cd_motivo_desc IS 'Código do Motivo da desclassificação';
COMMENT ON COLUMN motivodesclassificacao.descricao IS 'Descrição do Motivo da desclassificação';


--
-- Tabela: Desclassificações de operações
--
CREATE TABLE sicor_desclassificacao
(
  ref_bacen       INTEGER NOT NULL,
  nu_ordem        INTEGER NOT NULL,
  dt_desc         DATE NOT NULL,
  cd_motivo_desc  INTEGER NOT NULL,
  vl_desc         NUMERIC NOT NULL,
  tipo_desc       TEXT NOT NULL
);

COMMENT ON TABLE sicor_desclassificacao IS 'Desclassificações de operações';

COMMENT ON COLUMN sicor_desclassificacao.ref_bacen IS 'Número do refbacen';
COMMENT ON COLUMN sicor_desclassificacao.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_desclassificacao.dt_desc IS 'Data da desclassificacao';
COMMENT ON COLUMN sicor_desclassificacao.cd_motivo_desc IS 'Código do Motivo da desclassificacao';
COMMENT ON COLUMN sicor_desclassificacao.vl_desc IS 'Valor desclassificado';
COMMENT ON COLUMN sicor_desclassificacao.tipo_desc IS 'Tipo da desclassificação';


--
-- Tabela: Complemento às Operações contratadas
--
CREATE TABLE sicor_complemento_operacao_basica
(
  ref_bacen          INTEGER NOT NULL,
  nu_ordem           INTEGER NOT NULL,
  ref_bacen_efetivo  TEXT NOT NULL,
  agencia_if         TEXT NOT NULL,
  cd_ibge_municipio  INTEGER NULL,
  num_cedula_if      TEXT NOT NULL
);


COMMENT ON TABLE sicor_complemento_operacao_basica IS 'Complemento à tabela sicor_operacao_basica_estado';

COMMENT ON COLUMN sicor_complemento_operacao_basica.agencia_if IS 'Código da agência da Instituição Financeira';
COMMENT ON COLUMN sicor_complemento_operacao_basica.cd_ibge_municipio IS 'Código IBGE do município';
COMMENT ON COLUMN sicor_complemento_operacao_basica.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_complemento_operacao_basica.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_complemento_operacao_basica.ref_bacen_efetivo IS 'Número do refbacen explícito';


--
-- Tabela: Glebas de operações em formato WKT
--
CREATE TABLE sicor_glebas_wkt
(
  ref_bacen     INTEGER NOT NULL,
  nu_ordem      INTEGER NOT NULL,
  nu_indice     INTEGER NOT NULL,
  gt_geometria  TEXT NOT NULL
);

COMMENT ON TABLE sicor_glebas_wkt IS 'Glebas de operações em formato WKT';

COMMENT ON COLUMN sicor_glebas_wkt.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_glebas_wkt.nu_ordem IS 'Número de ordem';
COMMENT ON COLUMN sicor_glebas_wkt.nu_indice IS 'Identificador da gleba';
COMMENT ON COLUMN sicor_glebas_wkt.gt_geometria IS 'Polígono no formato WKT';


--
-- Tabela: Propriedades rurais
--
CREATE TABLE sicor_propriedades
(
  ref_bacen          INTEGER NOT NULL,
  nu_ordem           INTEGER NOT NULL,
  cd_cnpj_cpf        TEXT NOT NULL,
  cd_sncr            TEXT NOT NULL,
  cd_nirf            TEXT NOT NULL,
  cd_car             TEXT NOT NULL
);

COMMENT ON TABLE sicor_propriedades IS 'Propriedades rurais';


--
-- Tabela: Tipo de beneficiário
--
CREATE TABLE tipobeneficiario
(
  cd_tipo_beneficiario   INTEGER NOT NULL,
  descricao              TEXT NOT NULL
);

COMMENT ON TABLE tipobeneficiario IS 'Tipo de beneficiário';

COMMENT ON COLUMN tipobeneficiario.cd_tipo_beneficiario IS 'Código';
COMMENT ON COLUMN tipobeneficiario.descricao IS 'Descrição';


--
-- Tabela:  Mutuários ou beneficiários de operações
--
CREATE TABLE sicor_mutuarios
(
  cd_sexo               INTEGER NULL,
  cd_cpf_cnpj           TEXT NOT NULL,
  cd_tipo_beneficiario  INTEGER NULL,
  cd_dap                TEXT NULL,
  ref_bacen             INTEGER NOT NULL,
  cd_primeiro           CHAR(1) NOT NULL
);

COMMENT ON TABLE sicor_mutuarios IS 'Mutuários ou beneficiários de operações';

COMMENT ON COLUMN sicor_mutuarios.cd_cpf_cnpj IS 'Cpf/Cnpj do mutuário';
COMMENT ON COLUMN sicor_mutuarios.cd_dap IS 'Código da DAP';
COMMENT ON COLUMN sicor_mutuarios.cd_sexo IS 'Sexo do mutuário (1: Mulher; 2: Homem)';
COMMENT ON COLUMN sicor_mutuarios.cd_tipo_beneficiario IS 'Código do tipo de beneficiário';
COMMENT ON COLUMN sicor_mutuarios.ref_bacen IS 'Número do refbacen mascarado';
COMMENT ON COLUMN sicor_mutuarios.cd_primeiro IS 'Primeiro mutuário informado';


--
-- Tabela: Lista de Cooperados
--
CREATE TABLE sicor_lista_cooperados
(
  ref_bacen      INTEGER NOT NULL,
  nu_ordem       INTEGER NOT NULL,
  cpf_cnpj       TEXT NOT NULL,
  tipo_pessoa    CHAR(1) NOT NULL,
  valor_parcela  NUMERIC NOT NULL,
  cd_programa    CHAR(4) NULL
);


--
-- Tabela: Glebas da Comprovação de Perdas de operações contratadas
--
CREATE TABLE sicor_rcp_glebas_wkt
(
  ref_bacen     INTEGER NOT NULL,
  nu_ordem      INTEGER NOT NULL,
  nu_indice     INTEGER NOT NULL,
  gt_geometria  TEXT NOT NULL
);


--
-- Tabela: Complemento ao Pedido de Cobertura
--
CREATE TABLE sicor_complemento_cop
(
  ref_bacen                INTEGER NOT NULL,
  nu_ordem                 INTEGER NOT NULL,
  cd_cpf_cnpj_periciadora  TEXT NOT NULL,
  cd_evento                INTEGER NOT NULL,
  cd_cpf_perito            TEXT NULL
);


--
-- Tabela: Complemento ao Relatório de Comprovação de Perdas
--
CREATE TABLE sicor_complemento_rcp
(
  ref_bacen                INTEGER NOT NULL,
  nu_ordem                 INTEGER NOT NULL,
  cd_cpf_cnpj_periciadora  TEXT NOT NULL,
  cd_cpf_perito            TEXT NULL
);


END;