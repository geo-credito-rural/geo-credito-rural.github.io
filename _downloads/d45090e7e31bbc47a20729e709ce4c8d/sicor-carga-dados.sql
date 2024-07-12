\copy ifssicor FROM '/dados/SICOR_LISTA_IFS.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy instrumentocredito FROM '/dados/InstrumentoCredito.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy categoriaemitente FROM '/dados/CategoriaEmitente.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252', QUOTE '"', ESCAPE '"');

SET DATESTYLE TO European;
\copy fonterecursos FROM '/dados/FonteRecursos.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipogarantiaempreendimento FROM '/dados/TipoGarantiaEmpreendimento.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy empreendimento FROM '/dados/Empreendimento.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy programa FROM '/dados/Programa.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy subprograma FROM '/dados/Subprogramas.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy encargosfinanceiroscomplementares FROM PROGRAM 'iconv -c -f WINDOWS-1252 -t UTF8 /dados/EncargosFinanceirosComplementares.csv | sed -r ''s/(\"|)([0-9]+),(\"\"|“|”|\")(.*)(\"\"\"|”)/\2,\"\4\"/'' ' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'UTF8', QUOTE '"');

\copy tipoirrigacao FROM '/dados/TipoIrrigacao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipoagropecuaria FROM '/dados/TipoAgropecuaria.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy fasecicloproducao FROM '/dados/FaseCicloProducao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipocultivo FROM '/dados/TipoCultivo.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipointegracao FROM '/dados/TipoIntegracao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy graosemente FROM '/dados/GraoSemente.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy ciclocultivarproagro FROM '/dados/CicloCultivarProagro.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tiposoloproagro FROM '/dados/TipoSoloProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_operacao_basica_estado FROM '/dados/SICOR_OPERACAO_BASICA_ESTADO_2023.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy situacaooperacao FROM PROGRAM 'iconv -c -f WINDOWS-1252 -t UTF8 /dados/SituacaoOperacao.csv | sed -r ''s/^\"([0-9]+),\"\"(.*)\"\"\"/\1,\"\2\"/'' '  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'UTF8');

-- \copy sicor_saldos FROM '/dados/SICOR_SALDOS_atual.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_saldos FROM '/dados/SICOR_SALDOS_2023.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_liberacao_recursos FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /dados/SICOR_LIBERACAO_RECURSOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy eventoproagro FROM '/dados/EventoProagro.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy statuscopproagro FROM '/dados/StatusCOPProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
-- circumvent the backreference limit in sed
\copy sicor_cop_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7$9$11/'' /dados/SICOR_COP_BASICO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_rcp_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7$9$11$13$15$17/'' /dados/SICOR_RCP_BASICO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_parcelas_desembolso FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /dados/SICOR_PARCELAS_DESEMBOLSO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy statusparcelaproagro FROM '/dados/StatusParcelaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy naturezaproagro FROM '/dados/NaturezaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy instanciaproagro FROM PROGRAM 'sed ''/^[[:space:]]*$/d'' /dados/InstanciaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_parcelas_proagro FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])/$1$3$5$7/'' /dados/SICOR_PARCELAS_PROAGRO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_sumula_julgamento_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7/'' /dados/SICOR_SUMULA_JULGAMENTO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy motivodesclassificacao FROM PROGRAM 'sed ''/^[[:space:]]*$/d'' /dados/motivoDesclassificacao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_desclassificacao FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /dados/sicor_desclassificacao.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_operacao_basica FROM '/dados/SICOR_COMPLEMENTO_OPERACAO_BASICA.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_glebas_wkt FROM '/dados/sicor_glebas_wkt_2023.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_propriedades FROM '/dados/SICOR_PROPRIEDADES.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipobeneficiario FROM '/dados/tipoBeneficiario.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_mutuarios FROM '/dados/SICOR_MUTUARIOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_lista_cooperados FROM '/dados/SICOR_LISTA_COOPERADOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_rcp_glebas_wkt FROM '/dados/SICOR_RCP_GLEBAS_2021.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_cop FROM '/dados/SICOR_COMPLEMENTO_COP.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_rcp FROM '/dados/SICOR_COMPLEMENTO_RCP.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
