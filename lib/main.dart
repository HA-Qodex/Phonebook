import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_db/views/home_page.dart';
import 'database/db_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SQLite',
        home: HomePage(),

    );
  }
}

