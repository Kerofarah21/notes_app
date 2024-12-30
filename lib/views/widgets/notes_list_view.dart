import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return SliverList.separated(
          itemBuilder: (context, index) =>
              NoteItem(note: NotesCubit.get(context).notes![index]),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: NotesCubit.get(context).notes!.length,
        );
      },
    );
  }
}
