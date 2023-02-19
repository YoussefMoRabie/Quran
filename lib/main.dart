import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quran/index.dart';
import 'package:quran/splash.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback(

            (_) async{
          await readJson();
          await getSettings();
        }

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
        ),      ),
      home: const Splash(),
    );
  }
}
