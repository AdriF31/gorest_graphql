import 'package:flutter/material.dart';
import 'package:gorest_graphql/bindings/global_bindings.dart';
import 'package:gorest_graphql/gorest_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const GorestApp());
}



