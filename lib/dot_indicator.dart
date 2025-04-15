import 'package:flutter/material.dart';
import 'package:login/utils/theme/theme.dart';

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final double activeWidth;
  final double inactiveWidth;
  final int totalDots;

  const DotIndicator({
    super.key,
    required this.currentPage,
    this.totalDots = 3,
    this.activeWidth = 20,
    this.inactiveWidth = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        return Container(
          margin: EdgeInsets.all(4),
          width: currentPage == index ? activeWidth : inactiveWidth,
          height: 10,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : AppColors.buttonColor,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
