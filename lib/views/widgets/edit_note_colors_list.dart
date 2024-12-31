import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note.dart';
import 'color_item.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(
      Color.from(
        alpha: 1.0,
        red: widget.note.colorRedValue,
        green: widget.note.colorGreenValue,
        blue: widget.note.colorBlueValue,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              widget.note.colorRedValue = kColors[currentIndex].r;
              widget.note.colorGreenValue = kColors[currentIndex].g;
              widget.note.colorBlueValue = kColors[currentIndex].b;
            });
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: kColors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: kColors.length,
      ),
    );
  }
}
