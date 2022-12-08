import 'dart:convert';

import 'package:cnpj_finder/features/home/models/company.model.dart';
import 'package:cnpj_finder/features/home/repository/cnpj.model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

//https://maps.googleapis.com/maps/api/geocode/json?address=74650140&key=AIzaSyDzzQokf2PHwi_Z1manSutf1nBHhgqGe7Q
class CompanyRepository {
  final FlutterSecureStorage secureStorage;
  static const String baseUrl = 'receitaws.com.br';
  static const String googleMapsApiKey = 'AIzaSyDzzQokf2PHwi_Z1manSutf1nBHhgqGe7Q';

  CompanyRepository(this.secureStorage);

  Future<CompanyModel?> getCompanyFromAPI(String document) async {
    CompanyModel? result;

    var url = Uri.https(
      baseUrl,
      'v1/cnpj/$document',
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var cnpjResponse = CnpjResponse.fromJson(response.body);
      if (cnpjResponse != null) {
        var company = CompanyModel(
          name: cnpjResponse.nome,
          document: cnpjResponse.cnpj,
          address:
              '${cnpjResponse.logradouro}, ${cnpjResponse.bairro}, ${cnpjResponse.municipio}, ${cnpjResponse.uf}, BR',
        );
        await saveCompany(company);
        return company;
      } else {
        return null;
      }
    }

    return result;
  }

  Future<void> saveCompany(CompanyModel company) async {
    var companies = <CompanyModel>[company];
    var strCompanies = json.encode(companies);
    await secureStorage.write(key: 'companies', value: strCompanies);
  }

  Future<List<CompanyModel>> getCompanies() async {
    var source = await secureStorage.read(key: 'companies');
    if (source == null) return <CompanyModel>[];

    var jsonCompanies = json.decode(source);
    var companies = List<CompanyModel>.from(
      jsonCompanies.map(
        (x) => CompanyModel.fromJson('$x'),
      ),
    );
    return companies;
  }
}
