import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../models/note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  double redValue = const Color(0xff7FB7BE).r;
  double greenValue = const Color(0xff7FB7BE).g;
  double blueValue = const Color(0xff7FB7BE).b;

  Future<void> addNote(Note note) async {
    note.colorRedValue = redValue;
    note.colorGreenValue = greenValue;
    note.colorBlueValue = blueValue;

    emit(AddNoteLoading());
    try {
      await Hive.box<Note>(kNotesBox).add(note);
      emit(AddNoteSuccess(note));
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
