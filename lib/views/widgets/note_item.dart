import 'package:flutter/material.dart';

import '../../models/note.dart';
import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ),
        );
      },
      child: Card(
        color: Color.from(
          alpha: 1.0,
          red: note.colorRedValue,
          green: note.colorGreenValue,
          blue: note.colorBlueValue,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 24,
            bottom: 24,
            start: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 16,
                    bottom: 16,
                    end: 16,
                  ),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  onPressed: () {
                    note.delete();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 24),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.4),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
