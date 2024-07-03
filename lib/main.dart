import 'package:flutter/material.dart';
import 'package:flutter_painting_game/providers/color_provider.dart';
import 'package:flutter_painting_game/screens/painting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorProvider(),
      child: MaterialApp(
        title: 'Painting Game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PaintingScreen(
          imagePath: 'assets/astranout.png',
        ),
      ),
    );
  }
}
