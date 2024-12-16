import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const NoteItem(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: 3,
    );
  }
}
