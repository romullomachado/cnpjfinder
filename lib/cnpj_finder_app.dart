import 'package:cnpj_finder/features/home/providers/company.provider.dart';
import 'package:cnpj_finder/features/map/map.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/home.page.dart';

class CnpjFinderApp extends StatelessWidget {
  const CnpjFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CompanyProvider()),
      ],
      child: MaterialApp(
        title: 'Localizador de Empresas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) => const HomePage(title: 'Localizador de Empresas'),
          MapPage.routeName: (_) => const MapPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
