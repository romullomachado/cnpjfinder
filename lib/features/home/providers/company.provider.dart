import 'package:cnpj_finder/features/home/models/company.model.dart';
import 'package:flutter/material.dart';

class CompanyProvider extends ChangeNotifier {
  List<CompanyModel> companies = <CompanyModel>[];
  String cnpjToSearch = '';

  addCompany(CompanyModel company) {
    if (companies.any((e) => e.document == company.document)) return;
    companies.add(company);
    cnpjToSearch = '';
    notifyListeners();
  }

  addCompanies(List<CompanyModel> storagedCompanies) {
    companies.addAll(storagedCompanies);
    cnpjToSearch = '';
    notifyListeners();
  }

  void setCnpjToSearch(String value) {
    cnpjToSearch = value;
    notifyListeners();
  }

  bool hasCompany(String cnpjToSearch) {
    return companies.any((e) => e.document.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '') == cnpjToSearch);
  }
}
