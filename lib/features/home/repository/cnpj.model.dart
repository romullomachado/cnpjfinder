import 'dart:convert';

import 'package:flutter/foundation.dart';

class CnpjResponse {
  CnpjResponse({
    required this.status,
    required this.ultimaAtualizacao,
    required this.cnpj,
    required this.tipo,
    required this.porte,
    required this.nome,
    required this.fantasia,
    required this.abertura,
    required this.atividadePrincipal,
    required this.atividadesSecundarias,
    required this.naturezaJuridica,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.cep,
    required this.bairro,
    required this.municipio,
    required this.uf,
    required this.email,
    required this.telefone,
    required this.efr,
    required this.situacao,
    required this.dataSituacao,
    required this.motivoSituacao,
    required this.situacaoEspecial,
    required this.dataSituacaoEspecial,
    required this.capitalSocial,
    required this.qsa,
    required this.billing,
  });

  final String status;
  final DateTime ultimaAtualizacao;
  final String cnpj;
  final String tipo;
  final String porte;
  final String nome;
  final String fantasia;
  final String abertura;
  final Atividade atividadePrincipal;
  final List<Atividade> atividadesSecundarias;
  final String naturezaJuridica;
  final String logradouro;
  final String numero;
  final String complemento;
  final String cep;
  final String bairro;
  final String municipio;
  final String uf;
  final String email;
  final String telefone;
  final String efr;
  final String situacao;
  final String dataSituacao;
  final String motivoSituacao;
  final String situacaoEspecial;
  final String dataSituacaoEspecial;
  final String capitalSocial;
  final List<Qsa> qsa;
  final Billing billing;

  CnpjResponse copyWith({
    String? status,
    DateTime? ultimaAtualizacao,
    String? cnpj,
    String? tipo,
    String? porte,
    String? nome,
    String? fantasia,
    String? abertura,
    Atividade? atividadePrincipal,
    List<Atividade>? atividadesSecundarias,
    String? naturezaJuridica,
    String? logradouro,
    String? numero,
    String? complemento,
    String? cep,
    String? bairro,
    String? municipio,
    String? uf,
    String? email,
    String? telefone,
    String? efr,
    String? situacao,
    String? dataSituacao,
    String? motivoSituacao,
    String? situacaoEspecial,
    String? dataSituacaoEspecial,
    String? capitalSocial,
    List<Qsa>? qsa,
    Billing? billing,
  }) {
    return CnpjResponse(
      status: status ?? this.status,
      ultimaAtualizacao: ultimaAtualizacao ?? this.ultimaAtualizacao,
      cnpj: cnpj ?? this.cnpj,
      tipo: tipo ?? this.tipo,
      porte: porte ?? this.porte,
      nome: nome ?? this.nome,
      fantasia: fantasia ?? this.fantasia,
      abertura: abertura ?? this.abertura,
      atividadePrincipal: atividadePrincipal ?? this.atividadePrincipal,
      atividadesSecundarias: atividadesSecundarias ?? this.atividadesSecundarias,
      naturezaJuridica: naturezaJuridica ?? this.naturezaJuridica,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      cep: cep ?? this.cep,
      bairro: bairro ?? this.bairro,
      municipio: municipio ?? this.municipio,
      uf: uf ?? this.uf,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      efr: efr ?? this.efr,
      situacao: situacao ?? this.situacao,
      dataSituacao: dataSituacao ?? this.dataSituacao,
      motivoSituacao: motivoSituacao ?? this.motivoSituacao,
      situacaoEspecial: situacaoEspecial ?? this.situacaoEspecial,
      dataSituacaoEspecial: dataSituacaoEspecial ?? this.dataSituacaoEspecial,
      capitalSocial: capitalSocial ?? this.capitalSocial,
      qsa: qsa ?? this.qsa,
      billing: billing ?? this.billing,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'ultimaAtualizacao': ultimaAtualizacao.millisecondsSinceEpoch});
    result.addAll({'cnpj': cnpj});
    result.addAll({'tipo': tipo});
    result.addAll({'porte': porte});
    result.addAll({'nome': nome});
    result.addAll({'fantasia': fantasia});
    result.addAll({'abertura': abertura});
    result.addAll({'atividadePrincipal': atividadePrincipal.toMap()});
    result.addAll({'atividadesSecundarias': atividadesSecundarias.map((x) => x.toMap()).toList()});
    result.addAll({'naturezaJuridica': naturezaJuridica});
    result.addAll({'logradouro': logradouro});
    result.addAll({'numero': numero});
    result.addAll({'complemento': complemento});
    result.addAll({'cep': cep});
    result.addAll({'bairro': bairro});
    result.addAll({'municipio': municipio});
    result.addAll({'uf': uf});
    result.addAll({'email': email});
    result.addAll({'telefone': telefone});
    result.addAll({'efr': efr});
    result.addAll({'situacao': situacao});
    result.addAll({'dataSituacao': dataSituacao});
    result.addAll({'motivoSituacao': motivoSituacao});
    result.addAll({'situacaoEspecial': situacaoEspecial});
    result.addAll({'dataSituacaoEspecial': dataSituacaoEspecial});
    result.addAll({'capitalSocial': capitalSocial});
    result.addAll({'qsa': qsa.map((x) => x.toMap()).toList()});
    result.addAll({'billing': billing.toMap()});

    return result;
  }

  static CnpjResponse? fromMap(Map<String, dynamic> map) {
    try {
      return CnpjResponse(
        status: map['status'] ?? '',
        ultimaAtualizacao: DateTime.now(),
        cnpj: map['cnpj'] ?? '',
        tipo: map['tipo'] ?? '',
        porte: map['porte'] ?? '',
        nome: map['nome'] ?? '',
        fantasia: map['fantasia'] ?? '',
        abertura: map['abertura'] ?? '',
        atividadePrincipal: Atividade(code: '', text: ''),
        atividadesSecundarias: <Atividade>[],
        naturezaJuridica: map['natureza_juridica'] ?? '',
        logradouro: map['logradouro'] ?? '',
        numero: map['numero'] ?? '',
        complemento: map['complemento'] ?? '',
        cep: map['cep'] ?? '',
        bairro: map['bairro'] ?? '',
        municipio: map['municipio'] ?? '',
        uf: map['uf'] ?? '',
        email: map['email'] ?? '',
        telefone: map['telefone'] ?? '',
        efr: map['efr'] ?? '',
        situacao: map['situacao'] ?? '',
        dataSituacao: map['data_situacao'] ?? '',
        motivoSituacao: map['motivo_situacao'] ?? '',
        situacaoEspecial: map['situacao_especial'] ?? '',
        dataSituacaoEspecial: map['data_situacao_especial'] ?? '',
        capitalSocial: map['capital_social'] ?? '',
        qsa: <Qsa>[],
        billing: Billing(free: false, database: false),
      );
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static CnpjResponse? fromJson(String source) {
    try {
      return CnpjResponse.fromMap(json.decode(source));
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return 'CnpjResponse(status: $status, ultimaAtualizacao: $ultimaAtualizacao, cnpj: $cnpj, tipo: $tipo, porte: $porte, nome: $nome, fantasia: $fantasia, abertura: $abertura, atividadePrincipal: $atividadePrincipal, atividadesSecundarias: $atividadesSecundarias, naturezaJuridica: $naturezaJuridica, logradouro: $logradouro, numero: $numero, complemento: $complemento, cep: $cep, bairro: $bairro, municipio: $municipio, uf: $uf, email: $email, telefone: $telefone, efr: $efr, situacao: $situacao, dataSituacao: $dataSituacao, motivoSituacao: $motivoSituacao, situacaoEspecial: $situacaoEspecial, dataSituacaoEspecial: $dataSituacaoEspecial, capitalSocial: $capitalSocial, qsa: $qsa, billing: $billing)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CnpjResponse &&
        other.status == status &&
        other.ultimaAtualizacao == ultimaAtualizacao &&
        other.cnpj == cnpj &&
        other.tipo == tipo &&
        other.porte == porte &&
        other.nome == nome &&
        other.fantasia == fantasia &&
        other.abertura == abertura &&
        other.atividadePrincipal == atividadePrincipal &&
        listEquals(other.atividadesSecundarias, atividadesSecundarias) &&
        other.naturezaJuridica == naturezaJuridica &&
        other.logradouro == logradouro &&
        other.numero == numero &&
        other.complemento == complemento &&
        other.cep == cep &&
        other.bairro == bairro &&
        other.municipio == municipio &&
        other.uf == uf &&
        other.email == email &&
        other.telefone == telefone &&
        other.efr == efr &&
        other.situacao == situacao &&
        other.dataSituacao == dataSituacao &&
        other.motivoSituacao == motivoSituacao &&
        other.situacaoEspecial == situacaoEspecial &&
        other.dataSituacaoEspecial == dataSituacaoEspecial &&
        other.capitalSocial == capitalSocial &&
        listEquals(other.qsa, qsa) &&
        other.billing == billing;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        ultimaAtualizacao.hashCode ^
        cnpj.hashCode ^
        tipo.hashCode ^
        porte.hashCode ^
        nome.hashCode ^
        fantasia.hashCode ^
        abertura.hashCode ^
        atividadePrincipal.hashCode ^
        atividadesSecundarias.hashCode ^
        naturezaJuridica.hashCode ^
        logradouro.hashCode ^
        numero.hashCode ^
        complemento.hashCode ^
        cep.hashCode ^
        bairro.hashCode ^
        municipio.hashCode ^
        uf.hashCode ^
        email.hashCode ^
        telefone.hashCode ^
        efr.hashCode ^
        situacao.hashCode ^
        dataSituacao.hashCode ^
        motivoSituacao.hashCode ^
        situacaoEspecial.hashCode ^
        dataSituacaoEspecial.hashCode ^
        capitalSocial.hashCode ^
        qsa.hashCode ^
        billing.hashCode;
  }
}

class Atividade {
  Atividade({
    required this.code,
    required this.text,
  });

  final String code;
  final String text;

  Atividade copyWith({
    String? code,
    String? text,
  }) {
    return Atividade(
      code: code ?? this.code,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'text': text});

    return result;
  }

  factory Atividade.fromMap(Map<String, dynamic> map) {
    return Atividade(
      code: map['code'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Atividade.fromJson(String source) => Atividade.fromMap(json.decode(source));

  @override
  String toString() => 'Atividade(code: $code, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Atividade && other.code == code && other.text == text;
  }

  @override
  int get hashCode => code.hashCode ^ text.hashCode;
}

class Billing {
  Billing({
    required this.free,
    required this.database,
  });

  final bool free;
  final bool database;

  Billing copyWith({
    bool? free,
    bool? database,
  }) {
    return Billing(
      free: free ?? this.free,
      database: database ?? this.database,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'free': free});
    result.addAll({'database': database});

    return result;
  }

  factory Billing.fromMap(Map<String, dynamic> map) {
    return Billing(
      free: map['free'] ?? false,
      database: map['database'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Billing.fromJson(String source) => Billing.fromMap(json.decode(source));

  @override
  String toString() => 'Billing(free: $free, database: $database)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Billing && other.free == free && other.database == database;
  }

  @override
  int get hashCode => free.hashCode ^ database.hashCode;
}

class Qsa {
  Qsa({
    required this.nome,
    required this.qual,
    required this.paisOrigem,
    required this.nomeRepLegal,
    required this.qualRepLegal,
  });

  final String nome;
  final String qual;
  final String paisOrigem;
  final String nomeRepLegal;
  final String qualRepLegal;

  Qsa copyWith({
    String? nome,
    String? qual,
    String? paisOrigem,
    String? nomeRepLegal,
    String? qualRepLegal,
  }) {
    return Qsa(
      nome: nome ?? this.nome,
      qual: qual ?? this.qual,
      paisOrigem: paisOrigem ?? this.paisOrigem,
      nomeRepLegal: nomeRepLegal ?? this.nomeRepLegal,
      qualRepLegal: qualRepLegal ?? this.qualRepLegal,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'qual': qual});
    result.addAll({'pais_origem': paisOrigem});
    result.addAll({'nome_rep_legal': nomeRepLegal});
    result.addAll({'qual_rep_legal': qualRepLegal});

    return result;
  }

  factory Qsa.fromMap(Map<String, dynamic> map) {
    return Qsa(
      nome: map['nome'] ?? '',
      qual: map['qual'] ?? '',
      paisOrigem: map['pais_origem'] ?? '',
      nomeRepLegal: map['nome_rep_legal'] ?? '',
      qualRepLegal: map['qual_rep_legal'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Qsa.fromJson(String source) => Qsa.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Qsa(nome: $nome, qual: $qual, paisOrigem: $paisOrigem, nomeRepLegal: $nomeRepLegal, qualRepLegal: $qualRepLegal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Qsa &&
        other.nome == nome &&
        other.qual == qual &&
        other.paisOrigem == paisOrigem &&
        other.nomeRepLegal == nomeRepLegal &&
        other.qualRepLegal == qualRepLegal;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ qual.hashCode ^ paisOrigem.hashCode ^ nomeRepLegal.hashCode ^ qualRepLegal.hashCode;
  }
}
