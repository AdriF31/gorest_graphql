import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gorest_graphql/ui/home/home_page.dart';

class GorestApp extends StatelessWidget {
  const GorestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}