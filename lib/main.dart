import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              fontFamily: "Lato",
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.yellow, primary: Colors.yellow),
              textTheme: const TextTheme(
                  titleLarge: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  titleMedium: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  titleSmall: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              inputDecorationTheme: const InputDecorationTheme(
                  prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
