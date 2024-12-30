import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note.dart';
import 'services/bloc_observer.dart';
import 'views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(kNotesBox);

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..getNotes(),
      child: MaterialApp(
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
      ),
    );
  }
}
