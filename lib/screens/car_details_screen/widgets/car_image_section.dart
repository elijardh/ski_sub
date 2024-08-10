import 'package:flutter/material.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarImageSection extends StatefulWidget {
  const CarImageSection({super.key});

  @override
  State<CarImageSection> createState() => _CarImageSectionState();
}

class _CarImageSectionState extends State<CarImageSection> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 250,
          child: PageView(
            onPageChanged: (value) => setState(
              () {
                currentIndex = value;
              },
            ),
            children: List.generate(
              3,
              (index) => Image.asset(
                'vehicle_place_holder_two'.toPNG(),
              ),
            ),
          ),
        ),
        5.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              height: 7,
              width: 7,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? SkiColors.primaryColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
