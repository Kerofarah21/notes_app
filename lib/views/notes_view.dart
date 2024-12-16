import 'package:flutter/material.dart';

import 'widgets/custom_search_button.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
        ),
        actions: const [
          CustomSearchButton(),
        ],
      ),
      body: const NotesViewBody(),
    );
  }
}
