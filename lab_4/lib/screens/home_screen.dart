import "package:flutter/material.dart";
import "package:lab_4/shared/header/header.dart";
import "package:lab_4/shared/search_input.dart";
import "package:lab_4/features/most_recomended/presentation/most_recommended.dart";
import "package:lab_4/features/nearest_barbershop/presentation/nearest_barbershop.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Header(),
            SearchInput(),
            NearestBarbershop(),
            MostRecommended()
          ],
        ),
      ),
    ));
  }
}
