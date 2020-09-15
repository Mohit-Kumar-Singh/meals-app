import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/mealdetail';
  Widget buildSectionTitle(context, title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget buildContainer(
    Widget child,
  ) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      width: 300,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeals.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeals.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedmeals.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(selectedmeals.ingredients[index])),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('# ${(index + 1)}'),
                ),
                title: Text(selectedmeals.steps[index]),
              ),
              itemCount: selectedmeals.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
