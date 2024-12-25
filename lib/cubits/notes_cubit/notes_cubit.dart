import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  void getNotes() {
    try {
      emit(NotesSuccess(Hive.box<Note>(kNotesBox).values.toList()));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
