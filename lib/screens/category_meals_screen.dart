import 'package:flutter/material.dart';
import 'package:project/dummy_data.dart';
import 'package:project/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routename = '/category-meals';
  // final String categoryId;
  // final String categorytitle;
  // final Color categoryColor;
  // CategoryMealsScreen(this.categoryId, this.categorytitle, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routeArgs['title'];
    // final categoryColor = routeArgs['color'];
    final categorId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categorId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('$categorytitle'),
          // backgroundColor: '$categoryColor ' as Color,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
