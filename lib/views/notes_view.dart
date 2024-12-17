import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: NotesViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) => AddNoteBottomSheet(),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
