import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: const NavScreen(),
    );
  }
}
