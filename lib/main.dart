import 'package:acres/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(1, 0, 106, 194)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansOldPersianTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          titleTextStyle: GoogleFonts.yeonSung(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          surfaceTintColor: Colors.white,
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: 8,
          title: const Text(
            'User Input',
          ),
          centerTitle: true,
        ),
        body: const LoginScreen(),
      ),
    );
  }
}
