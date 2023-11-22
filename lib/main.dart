import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notjusthack_app/pages/businesses.dart';
import 'package:notjusthack_app/pages/create_post.dart';
import 'package:notjusthack_app/pages/home.dart';
import 'package:notjusthack_app/pages/login.dart';
import 'package:notjusthack_app/pages/messages.dart';
import 'package:notjusthack_app/pages/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const initialRoute = '/login';

    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.raleway(
            fontSize: 48, // Adjusted font size to 48 points
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.raleway(
            fontSize: 24, // Adjusted font size to 24 points
            // fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.raleway(
            fontSize: 16,
          ),
          displaySmall: GoogleFonts.raleway(
            fontSize: 14,
          ),
        ),
      ),
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Login(),
        '/home': (BuildContext context) => Home(),
        '/profile': (BuildContext context) => Profile(),
        '/messages': (BuildContext context) => Messages(),
        '/businesses': (BuildContext context) => Businesses(),
        '/create-post': (BuildContext context) => CreatePost(),
      },
    );
  }
}
