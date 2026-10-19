import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/HomeScreen.dart';
import 'package:todo_app/ui/login/LoginScreen.dart';
import 'package:todo_app/ui/registration/RegisterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5D9CEC),
          primary: Color(0xFF5D9CEC),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF5D9CEC),
          shape: StadiumBorder(side: BorderSide(color: Colors.white,width: 4))
        ),
        useMaterial3: false,
        cardTheme: CardThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )

        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 18,
            color: Colors.blue,
            fontWeight: FontWeight.w700
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.black
          )
        )
      ),
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        LoginScreen.routeName : (_) => LoginScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}


