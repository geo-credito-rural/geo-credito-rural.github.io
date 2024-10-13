BEGIN;

--
-- Criação de chaves primárias
--
ALTER TABLE ifssicor ADD CONSTRAINT ifssicor_pkey PRIMARY KEY (cnpj_if);

ALTER TABLE instrumentocredito ADD CONSTRAINT instrumentocredito_pkey PRIMARY KEY (cd_inst_credito);

ALTER TABLE categoriaemitente ADD CONSTRAINT categoriaemitente_pkey PRIMARY KEY (cd_categ_emitente);

ALTER TABLE fonterecursos ADD CONSTRAINT fonterecursos_pkey PRIMARY KEY (cd_fonte_recurso);

ALTER TABLE fonterecursospublicos ADD CONSTRAINT fonterecursospublicos_pkey PRIMARY KEY (cd_fonte_recurso);

ALTER TABLE tipogarantiaempreendimento ADD CONSTRAINT tipogarantiaempreendimento_pkey PRIMARY KEY (cd_tipo_seguro);

ALTER TABLE empreendimento ADD CONSTRAINT empreendimento_pkey PRIMARY KEY (cd_empreendimento);

ALTER TABLE programa ADD CONSTRAINT programa_pkey PRIMARY KEY (cd_programa);

ALTER TABLE subprograma ADD CONSTRAINT subprograma_pkey PRIMARY KEY (cd_subprograma);

ALTER TABLE encargosfinanceiroscomplementares ADD CONSTRAINT encargosfinanceiroscomplementares_pkey PRIMARY KEY (cd_tipo_encarg_financ);

ALTER TABLE tipoirrigacao ADD CONSTRAINT tipoirrigacao_pkey PRIMARY KEY (cd_tipo_irrigacao);

ALTER TABLE tipoagropecuaria ADD CONSTRAINT tipoagropecuaria_pkey PRIMARY KEY (cd_tipo_agricultura);

ALTER TABLE fasecicloproducao ADD CONSTRAINT fasecicloproducao_pkey PRIMARY KEY (cd_fase_ciclo_producao);

ALTER TABLE tipocultivo ADD CONSTRAINT tipocultivo_pkey PRIMARY KEY (cd_tipo_cultivo);

ALTER TABLE tipointegracao ADD CONSTRAINT tipointegracao_pkey PRIMARY KEY (cd_tipo_intgr_consor);

ALTER TABLE graosemente ADD CONSTRAINT graosemente_pkey PRIMARY KEY (cd_tipo_grao_semente);

ALTER TABLE ciclocultivarproagro ADD CONSTRAINT ciclocultivarproagro_pkey PRIMARY KEY (cd_ciclo_cultivar);

ALTER TABLE tiposoloproagro ADD CONSTRAINT tiposoloproagro_pkey PRIMARY KEY (cd_tipo_solo);

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_pkey PRIMARY KEY (ref_bacen, nu_ordem);

ALTER TABLE situacaooperacao ADD CONSTRAINT situacaooperacao_pkey PRIMARY KEY (cd_situacao_operacao);

ALTER TABLE sicor_saldos ADD CONSTRAINT sicor_saldos_pkey PRIMARY KEY (ref_bacen, nu_ordem, ano_base, mes_base);

ALTER TABLE sicor_liberacao_recursos ADD CONSTRAINT sicor_liberacao_recursos_pkey PRIMARY KEY (ref_bacen, nu_ordem, dt_liberacao);

ALTER TABLE eventoproagro ADD CONSTRAINT eventoproagro_pkey PRIMARY KEY (cd_evento);

ALTER TABLE statuscopproagro ADD CONSTRAINT statuscopproagro_pkey PRIMARY KEY (cd_status);

ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_pkey PRIMARY KEY (ref_bacen, nu_ordem, cd_evento);

ALTER TABLE sicor_rcp_basico ADD CONSTRAINT sicor_rcp_basico_pkey PRIMARY KEY (ref_bacen, nu_ordem);

ALTER TABLE sicor_parcelas_desembolso ADD CONSTRAINT sicor_parcelas_desembolso_pkey PRIMARY KEY (ref_bacen, nu_ordem, dt_prev_pagamento);

ALTER TABLE statusparcelaproagro ADD CONSTRAINT statusparcelaproagro_pkey PRIMARY KEY (cd_status);

ALTER TABLE naturezaproagro ADD CONSTRAINT naturezaproagro_pkey PRIMARY KEY (cd_natureza_parcela);

ALTER TABLE instanciaproagro ADD CONSTRAINT instanciaproagro_pkey PRIMARY KEY (cd_instancia);

ALTER TABLE sicor_parcelas_proagro ADD CONSTRAINT sicor_parcelas_proagro_pkey PRIMARY KEY (ref_bacen, nu_ordem, cd_natureza_parcela, vl_base, dt_remessa);

ALTER TABLE sicor_sumula_julgamento_basico ADD CONSTRAINT sicor_sumula_julgamento_basico_pkey PRIMARY KEY (ref_bacen, nu_ordem);

ALTER TABLE motivodesclassificacao ADD CONSTRAINT motivodesclassificacao_pkey PRIMARY KEY (cd_motivo_desc);

ALTER TABLE sicor_desclassificacao ADD CONSTRAINT sicor_desclassificacao_pkey PRIMARY KEY (ref_bacen, nu_ordem, dt_desc, cd_motivo_desc, tipo_desc);

ALTER TABLE sicor_complemento_operacao_basica ADD CONSTRAINT sicor_complemento_operacao_basica_pkey  PRIMARY KEY (ref_bacen, nu_ordem);

ALTER TABLE sicor_glebas_wkt ADD CONSTRAINT sicor_glebas_wkt_pkey  PRIMARY KEY (ref_bacen, nu_ordem, nu_indice);

ALTER TABLE sicor_propriedades ADD CONSTRAINT sicor_propriedades_pkey  PRIMARY KEY (ref_bacen, nu_ordem, cd_cnpj_cpf, cd_sncr, cd_nirf, cd_car);

ALTER TABLE tipobeneficiario ADD CONSTRAINT tipobeneficiario_pkey PRIMARY KEY (cd_tipo_beneficiario);

ALTER TABLE sicor_mutuarios ADD CONSTRAINT sicor_mutuarios_pkey PRIMARY KEY (ref_bacen, cd_cpf_cnpj);

ALTER TABLE sicor_lista_cooperados ADD CONSTRAINT sicor_lista_cooperados_pkey PRIMARY KEY (ref_bacen, nu_ordem, cpf_cnpj);

ALTER TABLE sicor_rcp_glebas ADD CONSTRAINT sicor_rcp_glebas_pkey  PRIMARY KEY (ref_bacen, nu_ordem, nu_indice);

-- ALTER TABLE sicor_complemento_cop ADD CONSTRAINT sicor_complemento_cop_pkey  PRIMARY KEY (ref_bacen, nu_ordem, cd_evento);

ALTER TABLE sicor_complemento_rcp ADD CONSTRAINT sicor_complemento_rcp_pkey  PRIMARY KEY (ref_bacen, nu_ordem);


--
-- Definição de relacionamentos de integridade referencial/chave estrangeira
--
ALTER TABLE subprograma ADD CONSTRAINT subprograma_codigo_programa_fkey
    FOREIGN KEY(codigo_programa) REFERENCES programa(cd_programa)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;
                                              
ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cnpj_if_fkey
    FOREIGN KEY(cnpj_if) REFERENCES ifssicor(cnpj_if)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_inst_credito_fkey
    FOREIGN KEY(cd_inst_credito) REFERENCES instrumentocredito(cd_inst_credito)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_categ_emitente_fkey
    FOREIGN KEY(cd_categ_emitente) REFERENCES categoriaemitente(cd_categ_emitente)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_fonte_recurso_fkey
    FOREIGN KEY(cd_fonte_recurso) REFERENCES fonterecursos(cd_fonte_recurso)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_seguro_fkey
    FOREIGN KEY(cd_tipo_seguro) REFERENCES tipogarantiaempreendimento(cd_tipo_seguro)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_empreendimento_fkey
    FOREIGN KEY(cd_empreendimento) REFERENCES empreendimento(cd_empreendimento)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_programa_fkey
    FOREIGN KEY(cd_programa) REFERENCES programa(cd_programa)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_encarg_financ_fkey
    FOREIGN KEY(cd_tipo_encarg_financ) REFERENCES encargosfinanceiroscomplementares(cd_tipo_encarg_financ)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_irrigacao_fkey
    FOREIGN KEY(cd_tipo_irrigacao) REFERENCES tipoirrigacao(cd_tipo_irrigacao)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_agricultura_fkey
    FOREIGN KEY(cd_tipo_agricultura) REFERENCES tipoagropecuaria(cd_tipo_agricultura)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_fase_ciclo_producao_fkey
    FOREIGN KEY(cd_fase_ciclo_producao) REFERENCES fasecicloproducao(cd_fase_ciclo_producao)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_cultivo_fkey
    FOREIGN KEY(cd_tipo_cultivo) REFERENCES tipocultivo(cd_tipo_cultivo)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_intgr_consor_fkey
    FOREIGN KEY(cd_tipo_intgr_consor) REFERENCES tipointegracao(cd_tipo_intgr_consor)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_grao_semente_fkey
    FOREIGN KEY(cd_tipo_grao_semente) REFERENCES graosemente(cd_tipo_grao_semente)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_subprograma_fkey
    FOREIGN KEY(cd_subprograma) REFERENCES subprograma(cd_subprograma)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_ciclo_cultivar_fkey
--    FOREIGN KEY(cd_ciclo_cultivar) REFERENCES ciclocultivarproagro(cd_ciclo_cultivar)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_operacao_basica_estado ADD CONSTRAINT sicor_operacao_basica_estado_cd_tipo_solo_fkey
--    FOREIGN KEY(cd_tipo_solo) REFERENCES tiposoloproagro(cd_tipo_solo)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

ALTER TABLE sicor_saldos ADD CONSTRAINT sicor_saldos_cd_situacao_operacao_fkey
    FOREIGN KEY(cd_situacao_operacao) REFERENCES situacaooperacao(cd_situacao_operacao)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_saldos ADD CONSTRAINT sicor_saldos_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_liberacao_recursos ADD CONSTRAINT sicor_liberacao_recursos_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;


ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_cd_status_fkey
    FOREIGN KEY(cd_status) REFERENCES statuscopproagro(cd_status)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_cd_ciclo_cultivar_fkey
    FOREIGN KEY(cd_ciclo_cultivar) REFERENCES ciclocultivarproagro(cd_ciclo_cultivar)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_cd_tipo_solo_fkey
    FOREIGN KEY(cd_tipo_solo) REFERENCES tiposoloproagro(cd_tipo_solo)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_cop_basico ADD CONSTRAINT sicor_cop_basico_cd_evento_fkey
    FOREIGN KEY(cd_evento) REFERENCES eventoproagro(cd_evento)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_rcp_basico ADD CONSTRAINT sicor_rcp_basico_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_rcp_basico ADD CONSTRAINT sicor_rcp_basico_cd_status_fkey
    FOREIGN KEY(cd_status) REFERENCES statuscopproagro(cd_status)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_rcp_basico ADD CONSTRAINT sicor_rcp_basico_cd_tipo_solo_fkey
    FOREIGN KEY(cd_tipo) REFERENCES tiposoloproagro(cd_tipo_solo)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_rcp_basico ADD CONSTRAINT sicor_rcp_basico_cd_evento_fkey
    FOREIGN KEY(cd_evento) REFERENCES eventoproagro(cd_evento)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_parcelas_desembolso ADD CONSTRAINT sicor_parcelas_desembolso_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_parcelas_proagro ADD CONSTRAINT sicor_parcelas_proagro_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

ALTER TABLE sicor_parcelas_proagro ADD CONSTRAINT sicor_parcelas_proagro_cd_instancia_fkey
    FOREIGN KEY(cd_instancia) REFERENCES instanciaproagro(cd_instancia)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_parcelas_proagro ADD CONSTRAINT sicor_parcelas_proagro_cd_status_fkey
    FOREIGN KEY(cd_status) REFERENCES statusparcelaproagro(cd_status)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_parcelas_proagro ADD CONSTRAINT sicor_parcelas_proagro_cd_natureza_parcela_fkey
    FOREIGN KEY(cd_natureza_parcela) REFERENCES naturezaproagro(cd_natureza_parcela)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_sumula_julgamento_basico ADD CONSTRAINT sicor_sumula_julgamento_basico_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_sumula_julgamento_basico ADD CONSTRAINT sicor_sumula_julgamento_basico_cd_instancia_fkey
    FOREIGN KEY(cd_instancia) REFERENCES instanciaproagro(cd_instancia)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_desclassificacao ADD CONSTRAINT sicor_desclassificacao_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_desclassificacao ADD CONSTRAINT sicor_desclassificacao_cd_motivo_desc_fkey
--    FOREIGN KEY(cd_motivo_desc) REFERENCES motivodesclassificacao(cd_motivo_desc)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_complemento_operacao_basica ADD CONSTRAINT sicor_complemento_operacao_basica_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

ALTER TABLE sicor_glebas_wkt ADD CONSTRAINT sicor_glebas_wkt_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_propriedades ADD CONSTRAINT sicor_propriedades_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_mutuarios ADD CONSTRAINT sicor_mutuarios_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen) REFERENCES sicor_operacao_basica_estado(ref_bacen)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

ALTER TABLE sicor_mutuarios ADD CONSTRAINT sicor_mutuarios_cd_tipo_beneficiario_fkey
    FOREIGN KEY(cd_tipo_beneficiario) REFERENCES tipobeneficiario(cd_tipo_beneficiario)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

ALTER TABLE sicor_lista_cooperados ADD CONSTRAINT sicor_lista_cooperados_ref_bacen_fkey
    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_operacao_basica_estado(ref_bacen, nu_ordem)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;

--ALTER TABLE sicor_lista_cooperados ADD CONSTRAINT sicor_lista_cooperados_cd_programa_fkey
--    FOREIGN KEY(cd_programa) REFERENCES programa(cd_programa)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_rcp_glebas ADD CONSTRAINT sicor_rcp_glebas_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_rcp_basico(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_complemento_cop ADD CONSTRAINT sicor_complemento_cop_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem, cd_evento) REFERENCES sicor_cop_basico(ref_bacen, nu_ordem, cd_evento)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;

--ALTER TABLE sicor_complemento_rcp ADD CONSTRAINT sicor_complemento_rcp_ref_bacen_fkey
--    FOREIGN KEY(ref_bacen, nu_ordem) REFERENCES sicor_rcp_basico(ref_bacen, nu_ordem)
--        ON UPDATE CASCADE
--        ON DELETE NO ACTION;


--
-- Criação de índices
--
CREATE INDEX sicor_operacao_basica_estado_dt_emissao ON sicor_operacao_basica_estado(Extract(YEAR FROM dt_emissao));

CREATE INDEX sicor_operacao_basica_estado_cd_empreendimento ON sicor_operacao_basica_estado(cd_empreendimento);

CREATE INDEX sicor_cop_basico_dt_emissao ON sicor_cop_basico(extract(YEAR FROM dt_comunicacao));

CREATE INDEX sicor_complemento_cop_idx ON sicor_complemento_cop(ref_bacen, nu_ordem, cd_evento);

END;
