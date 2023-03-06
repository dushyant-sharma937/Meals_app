import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.28,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
          mainAxisSpacing: MediaQuery.of(context).size.width * 0.04),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.color, catData.title, catData.id))
          .toList(),
    );
  }
}
