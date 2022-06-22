import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../db/dummy_db.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (ctgData) => CategoryItem(ctgData.title, ctgData.color, ctgData.id),
          )
          .toList(),
    );
  }
}
