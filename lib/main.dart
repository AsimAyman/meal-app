import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled9/ui/screen/category_screen.dart';
import 'package:untitled9/ui/screen/tab_screen.dart';


var colorScreen = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals',
        theme: ThemeData(
            colorScheme: colorScreen,
            useMaterial3: true,
            appBarTheme: AppBarTheme.of(context).copyWith(
              color: colorScreen.primary,
            )),
        home:const TabScreen(),
      ),
    );
  }
}
