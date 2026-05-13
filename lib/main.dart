import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'جمعية عشاق المستقبل',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff1e3a8a),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff1e3a8a),
          secondary: Color(0xfff59e0b),
        ),
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}
