import 'package:flutter/material.dart';

import 'constants.dart';
import 'views/notes_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: kPrimaryColor,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),
    );
  }
}
