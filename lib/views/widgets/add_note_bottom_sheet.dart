import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hintText: 'Title',
            hintColor: kPrimaryColor,
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: titleController,
          ),
        ],
      ),
    );
  }
}
