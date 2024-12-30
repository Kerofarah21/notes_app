import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            NotesCubit.get(context).getNotes();
            Navigator.of(context).pop();
          } else if (state is AddNoteFailure) {}
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading,
            child: Padding(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(
                  child: AddNoteForm(),
                )),
          );
        },
      ),
    );
  }
}
