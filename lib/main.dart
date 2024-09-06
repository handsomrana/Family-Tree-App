import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/family_tree_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Family Tree App',
      home: FamilyTreeScreen(),
    );
  }
}
