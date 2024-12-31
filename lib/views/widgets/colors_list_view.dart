import 'package:flutter/material.dart';

import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> colors = [
    const Color(0xff7FB7BE),
    const Color(0xffD3F3EE),
    const Color(0xffDACC3E),
    const Color(0xff2f4858),
    const Color(0xffBC2C1A),
    const Color(0xff7D1538),
    const Color(0xff33658a),
    const Color(0xfff26419),
  ];

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
            });
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: colors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: colors.length,
      ),
    );
  }
}
