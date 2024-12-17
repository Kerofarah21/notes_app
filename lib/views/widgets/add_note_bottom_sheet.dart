import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
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
                  const Spacer(),
                  CustomButton(
                    text: 'Add',
                    buttonColor: kPrimaryColor,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
