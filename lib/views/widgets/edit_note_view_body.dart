import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({
    super.key,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Edit Note',
                  icon: Icons.check,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: 'Title',
                  hintColor: kPrimaryColor,
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: titleController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'Content',
                  hintColor: kPrimaryColor,
                  cursorColor: kPrimaryColor,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: contentController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
