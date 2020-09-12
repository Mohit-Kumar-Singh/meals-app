import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/mealdetail';
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body:  Container(
        child: Text('meals $mealid'),
      ),
    );
  }
}
