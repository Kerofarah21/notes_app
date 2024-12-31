import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
              AddNoteCubit.get(context).redValue = kColors[index].r;
              AddNoteCubit.get(context).greenValue = kColors[index].g;
              AddNoteCubit.get(context).blueValue = kColors[index].b;
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
