import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación Productos',
      initialRoute: 'home',
      routes: {
        'login':   (_) => const LoginScreen(),
        'home':    (_) => const HomeScreen(),
        'product': (_) => const ProductScreen()
      },
      theme: ThemeData.light().copyWith( 
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo,

          titleTextStyle: TextStyle( 
            color: Colors.white,
            fontSize: 25,
            
          )
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData( 
          backgroundColor: Colors.indigo,
          
        )
      ),
    );
  }
}