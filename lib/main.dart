import 'package:expense_tracer/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
// ignore: non_constant_identifier_names
var KDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: KDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
              color: KDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KDarkColorScheme.primaryContainer,
                  foregroundColor: KDarkColorScheme.onPrimaryContainer)),
        ),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 16))),
        //default  themeMode: ThemeMode.system
        home: const Expenses(),
      ),
    );
  }

