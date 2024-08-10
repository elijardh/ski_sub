import 'package:flutter/material.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarSpecSection extends StatelessWidget {
  const CarSpecSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Car Specs',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          20.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => const CarSpecCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class CarSpecCard extends StatelessWidget {
  const CarSpecCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.black.withAlpha(100),
            width: 0.8,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Max. Power',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          5.vSpace,
          const Text(
            '320',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          5.vSpace,
          const Text(
            'hp',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
