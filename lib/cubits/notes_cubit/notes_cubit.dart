import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  List<Note>? notes;

  void getNotes() {
    Hive.box<Note>(kNotesBox).clear();
    notes = Hive.box<Note>(kNotesBox).values.toList();
    emit(NotesSuccess());
  }
}
