import 'dart:io';

import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/categories_screen.dart';
import 'package:azkar_app/services/api_helper.dart';
import 'package:azkar_app/widgets/zekr_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Tajawal"),
      home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
