import 'package:cnpj_finder/core/cnpj_finder_colors.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String text;
  final String imagePath;
  const EmptyState({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: CnpjFinderColors.White,
                ),
          ),
        ],
      ),
    );
  }
}
