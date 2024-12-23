import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'models/note.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteAdapter());

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
