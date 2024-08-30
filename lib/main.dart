import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart'; //hive is a key value(no sql) type database to store data locally
import 'package:todo_application/Pages/home_page.dart';

void main() async {
  //initialize hive for flutter
  await Hive.initFlutter();

  //open the hive box(databox)
  await Hive.openBox('dataBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const HomePage(),
    );
  }
}
