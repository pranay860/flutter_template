import 'package:flutter/material.dart';
import 'package:my_app/app/routes/app_routes.dart';
import 'package:themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: [
        ThemeData(
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontFamily: 'Poppins'),
              bodyMedium: TextStyle(fontFamily: 'Poppins'),
              bodySmall: TextStyle(fontFamily: 'Poppins'),
              displayLarge: TextStyle(fontFamily: 'Poppins'),
              displayMedium: TextStyle(fontFamily: 'Poppins'),
              displaySmall: TextStyle(fontFamily: 'Poppins'),
              titleLarge: TextStyle(fontFamily: 'Poppins'),
              titleMedium: TextStyle(fontFamily: 'Poppins'),
              titleSmall: TextStyle(fontFamily: 'Poppins'),
              labelLarge: TextStyle(fontFamily: 'Poppins'),
              labelMedium: TextStyle(fontFamily: 'Poppins'),
              labelSmall: TextStyle(fontFamily: 'Poppins'),
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Color.fromARGB(255, 10, 1, 52),
              brightness: Brightness.light,
            )),
      ],
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.blue[700],
          secondary: Color.fromARGB(255, 9, 4, 104),
          brightness: Brightness.dark,
        ),
      ),
      lightTheme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            background: Color.fromARGB(255, 1, 50, 90),
            secondary: Color.fromARGB(255, 73, 11, 197),
            brightness: Brightness.light,
          ),
          appBarTheme:const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black))),
      builder: (context, themeData, darkTheme, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData,
          darkTheme: darkTheme,
          themeMode: themeMode,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
