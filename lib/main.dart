import 'package:flutter/material.dart';
import 'Screens/HomePage.dart';
import 'package:hive/hive.dart';
import 'package:bankingassignmentenercent/Models/User.dart';
import 'package:path_provider/path_provider.dart' as provider;
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(Userdapter());
  await Hive.openBox<User>('user');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
