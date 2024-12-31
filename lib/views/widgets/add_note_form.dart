import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/note.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is Required';
              } else {
                return null;
              }
            },
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
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is Required';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading,
                text: 'Add',
                buttonColor: kPrimaryColor,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    AddNoteCubit.get(context).addNote(
                      Note(
                        title: titleController.text,
                        subTitle: contentController.text,
                        date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        colorRedValue: Colors.blue.r,
                        colorGreenValue: Colors.blue.g,
                        colorBlueValue: Colors.blue.b,
                      ),
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
