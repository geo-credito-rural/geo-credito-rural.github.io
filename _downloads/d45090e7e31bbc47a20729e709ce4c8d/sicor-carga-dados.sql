\copy ifssicor FROM '/shared-data/TCU/SICOR_LISTA_IFS.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy instrumentocredito FROM '/shared-data/TCU/InstrumentoCredito.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy categoriaemitente FROM '/shared-data/TCU/CategoriaEmitente.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252', QUOTE '"', ESCAPE '"');

SET DATESTYLE TO European;
\copy fonterecursos FROM '/shared-data/TCU/FonteRecursos.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');
--\copy fonterecursospublicos FROM '/shared-data/TCU/FonteRecursosPublicos.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipogarantiaempreendimento FROM '/shared-data/TCU/TipoGarantiaEmpreendimento.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy empreendimento FROM '/shared-data/TCU/Empreendimento.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy programa FROM '/shared-data/TCU/Programa.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy subprograma FROM '/shared-data/TCU/Subprogramas.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy encargosfinanceiroscomplementares FROM PROGRAM 'iconv -c -f WINDOWS-1252 -t UTF8 /shared-data/TCU/EncargosFinanceirosComplementares.csv | sed -r ''s/(\"|)([0-9]+),(\"\"|“|”|\")(.*)(\"\"\"|”)/\2,\"\4\"/'' ' WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'UTF8', QUOTE '"');

\copy tipoirrigacao FROM '/shared-data/TCU/TipoIrrigacao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipoagropecuaria FROM '/shared-data/TCU/TipoAgropecuaria.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy fasecicloproducao FROM '/shared-data/TCU/FaseCicloProducao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipocultivo FROM '/shared-data/TCU/TipoCultivo.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipointegracao FROM '/shared-data/TCU/TipoIntegracao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy graosemente FROM '/shared-data/TCU/GraoSemente.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy ciclocultivarproagro FROM '/shared-data/TCU/CicloCultivarProagro.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tiposoloproagro FROM '/shared-data/TCU/TipoSoloProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2013.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2014.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2015.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2016.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2017.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2018.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2019.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2020.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2021.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2022.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2023.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_operacao_basica_estado FROM '/shared-data/TCU/SICOR_OPERACAO_BASICA_ESTADO_2024.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy situacaooperacao FROM PROGRAM 'iconv -c -f WINDOWS-1252 -t UTF8 /shared-data/TCU/SituacaoOperacao.csv | sed -r ''s/^\"([0-9]+),\"\"(.*)\"\"\"/\1,\"\2\"/'' '  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'UTF8');

-- \copy sicor_saldos FROM '/shared-data/TCU/SICOR_SALDOS_atual.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
-- \copy sicor_saldos FROM '/shared-data/TCU/SICOR_SALDOS_2023.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_liberacao_recursos FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /shared-data/TCU/SICOR_LIBERACAO_RECURSOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy eventoproagro FROM '/shared-data/TCU/EventoProagro.csv' WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy statuscopproagro FROM '/shared-data/TCU/StatusCOPProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
-- circumvent the backreference limit in sed
\copy sicor_cop_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7$9$11/'' /shared-data/TCU/SICOR_COP_BASICO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_rcp_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7$9$11$13$15$17/'' /shared-data/TCU/SICOR_RCP_BASICO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_parcelas_desembolso FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /shared-data/TCU/SICOR_PARCELAS_DESEMBOLSO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy statusparcelaproagro FROM '/shared-data/TCU/StatusParcelaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy naturezaproagro FROM '/shared-data/TCU/NaturezaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy instanciaproagro FROM PROGRAM 'sed ''/^[[:space:]]*$/d'' /shared-data/TCU/InstanciaProagro.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_parcelas_proagro FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])/$1$3$5$7/'' /shared-data/TCU/SICOR_PARCELAS_PROAGRO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO European;
\copy sicor_sumula_julgamento_basico FROM PROGRAM 'perl -pe ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/$1$3$5$7/'' /shared-data/TCU/SICOR_SUMULA_JULGAMENTO.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy motivodesclassificacao FROM PROGRAM 'sed ''/^[[:space:]]*$/d'' /shared-data/TCU/motivoDesclassificacao.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

SET DATESTYLE TO ISO, US;
\copy sicor_desclassificacao FROM PROGRAM 'sed -r ''s/(.*)([[:space:]][0-9][0-9]:[0-9][0-9]:[0-9][0-9])(.*)/\1\3/'' /shared-data/TCU/sicor_desclassificacao.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_operacao_basica FROM '/shared-data/TCU/SICOR_COMPLEMENTO_OPERACAO_BASICA.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2013.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2014.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2015.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2016.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2017.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2018.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2019.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2020.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2021.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2022.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2023.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_glebas_wkt FROM '/shared-data/TCU/sicor_glebas_wkt_2024.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_propriedades FROM '/shared-data/TCU/SICOR_PROPRIEDADES.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy tipobeneficiario FROM '/shared-data/TCU/tipoBeneficiario.csv'  WITH (DELIMITER ',', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_mutuarios FROM '/shared-data/TCU/SICOR_MUTUARIOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_lista_cooperados FROM '/shared-data/TCU/SICOR_LISTA_COOPERADOS.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_rcp_glebas_wkt FROM '/shared-data/TCU/SICOR_RCP_GLEBAS_2015_2020.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
\copy sicor_rcp_glebas_wkt FROM '/shared-data/TCU/SICOR_RCP_GLEBAS_2021.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_cop FROM '/shared-data/TCU/SICOR_COMPLEMENTO_COP.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');

\copy sicor_complemento_rcp FROM '/shared-data/TCU/SICOR_COMPLEMENTO_RCP.csv'  WITH (DELIMITER ';', FORMAT CSV, HEADER, ENCODING 'WIN1252');
