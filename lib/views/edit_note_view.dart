import 'package:flutter/material.dart';

import '../models/note.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
