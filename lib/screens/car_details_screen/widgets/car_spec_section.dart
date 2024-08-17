import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarSpecSection extends StatelessWidget {
  final Vehicle vehicle;
  const CarSpecSection({
    super.key,
    required this.vehicle,
  });

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
            children: [
              CarSpecCard(
                metric: 'hp',
                subTitle: '${vehicle.maxPowerHp}',
                title: 'Max. Power',
              ),
              CarSpecCard(
                metric: 'mph',
                subTitle: '${vehicle.topSpeedMph}',
                title: 'Max. Speed',
              ),
              CarSpecCard(
                metric: 'mph',
                subTitle: '${vehicle.topSpeedMph}',
                title: 'Max. Speed',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CarSpecCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String metric;
  const CarSpecCard({
    super.key,
    required this.metric,
    required this.subTitle,
    required this.title,
  });

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
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          5.vSpace,
          Text(
            subTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          5.vSpace,
          Text(
            metric,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
