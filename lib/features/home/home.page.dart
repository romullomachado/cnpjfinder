// ignore_for_file: use_build_context_synchronously

import 'package:cnpj_finder/core/cnpj_finder_colors.dart';
import 'package:cnpj_finder/core/cnpj_validator.dart';
import 'package:cnpj_finder/features/home/providers/company.provider.dart';
import 'package:cnpj_finder/features/home/repository/company.repository.dart';
import 'package:cnpj_finder/features/map/repository/map.repository.dart';
import 'package:cnpj_finder/widgets/empty_state.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'models/company.model.dart';
import 'widgets/company_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CompanyRepository companyRepository;

  @override
  void initState() {
    super.initState();

    var provider = Provider.of<CompanyProvider>(context, listen: false);
    companyRepository = CompanyRepository(const FlutterSecureStorage());
    companyRepository
        .getCompanies()
        .then((storagedCompanies) => provider.addCompanies(storagedCompanies));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CompanyProvider>(context);
    var mapRespository = MapRepository();
    // provider.setCnpjToSearch('01.543.032/0104-01');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business,
              size: 32,
              color: CnpjFinderColors.Primary,
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: CnpjFinderColors.Primary,
                  ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: CnpjFinderColors.White,
      ),
      body: Column(
        children: [
          Container(
            color: CnpjFinderColors.White,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      provider.setCnpjToSearch(value);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: CnpjFinderColors.Primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    if (!CNPJValidator.isValid(provider.cnpjToSearch)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('O CNPJ digitado é inválido'),
                        ),
                      );
                      return;
                    }

                    if (!provider.hasCompany(provider.cnpjToSearch)) {
                      var company = await companyRepository
                          .getCompanyFromAPI(provider.cnpjToSearch)
                          .then((value) async => value != null
                              ? await mapRespository
                                  .getLocationFromAddress(value)
                              : value);

                      if (company != null) {
                        provider.addCompany(company);
                        await companyRepository.getCompanies();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('CNPJ não encontrado'),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('O CNPJ já está na lista.'),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      return CnpjFinderColors.Primary;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: CnpjFinderColors.Primary),
                    )),
                  ),
                  child: const Text('Localizar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    CnpjFinderColors.GradientStart,
                    CnpjFinderColors.GradientEnd,
                  ],
                ),
              ),
              child: provider.companies.isEmpty
                  ? const EmptyState(
                      text: 'Localize acima a primeira empresa',
                      imagePath: 'assets/images/illustrations/search.png',
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: provider.companies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CompanyCard(
                          company: provider.companies[index],
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
