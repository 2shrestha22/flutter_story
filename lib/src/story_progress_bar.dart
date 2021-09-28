import 'package:flutter/material.dart';

class StoryProgressBar extends StatelessWidget {
  const StoryProgressBar({
    Key? key,
    required this.progress,
    required this.gap,
    required this.activeBar,
    required this.length,
  }) : super(key: key);

  final double progress;
  final double gap;
  final int activeBar;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(length, (index) {
          double widthFactor;
          if (activeBar < index) {
            widthFactor = 0.0;
          } else if (activeBar == index) {
            widthFactor = progress;
          } else {
            widthFactor = 1.0;
          }

          return Expanded(
            child: Container(
              height: 2.0,
              margin: EdgeInsets.symmetric(horizontal: gap / 2),
              decoration: BoxDecoration(
                color: const Color(0x80ffffff),
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: widthFactor,
                child: Container(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
