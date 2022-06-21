import 'package:flutter/material.dart';
import 'package:recipe_app/components/meal_item.dart';
import '../db/dummy_db.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // MealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final ctgTitle = routeArgs['title'];
    final ctgId = routeArgs['id'];
    final ctgMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(ctgId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${ctgTitle} meals'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              title: ctgMeals[index].title,
              imageUrl: ctgMeals[index].imageUrl,
              duration: ctgMeals[index].duration,
              complexity: ctgMeals[index].complexity,
              affordability: ctgMeals[index].affordability);
        },
        itemCount: ctgMeals.length,
      ),
    );
  }
}
