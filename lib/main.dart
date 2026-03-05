import 'package:flutter/material.dart';
import 'package:student_info_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

// ===========================================
// MYAPP WIDGET - The root of our app
// StatelessWidget = This widget never changes (like your ID photo)
// ===========================================
class MyApp extends StatelessWidget {
  // Constructor - creates the widget
  const MyApp({super.key});
  // build = This method creates the user interface
  @override
  Widget build(BuildContext context) {
    // MaterialApp = Google-style wrapper for our entire app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title = Name shown when switching between apps
      title: 'Student Info App',
      // theme = Visual styling for the whole app
      theme: ThemeData(
        // primarySwatch = Main color scheme (like school uniform)
        primarySwatch: Colors.green,

        // APP BAR THEME - styles all app bars
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white, // Text/icon color
          centerTitle: true,
          elevation: 4, // Shadow depth
        ),
        // BUTTON THEME - styles all elevated buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // TEXT THEME - styles all text
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),

      // home = First screen users see when app opens
      home: const MyHomePage(),
    );
  }
}
