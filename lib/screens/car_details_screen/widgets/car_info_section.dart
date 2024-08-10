import 'package:flutter/material.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarInfoSection extends StatelessWidget {
  const CarInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hyundia Santafe',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 35,
              ),
            ],
          ),
          5.vSpace,
          const Text(
            'Year: 2015',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          5.vSpace,
          Text.rich(
            TextSpan(
              text: '75,000 NGN',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: SkiColors.primaryColor,
              ),
              children: const [
                TextSpan(
                  text: ' / Day',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Text(
            'Car Info',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          20.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CarInfoTile(
                    icon: 'user_icon',
                    title: '3 Passengers',
                  ),
                  10.vSpace,
                  const CarInfoTile(
                    icon: 'air_con_icon',
                    title: 'Air Conditioning',
                  ),
                  10.vSpace,
                  const CarInfoTile(
                    icon: 'gear_icon',
                    title: 'Automatic',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CarInfoTile(
                    icon: 'door_icon',
                    title: '4 Doors',
                  ),
                  10.vSpace,
                  const CarInfoTile(
                    icon: 'fuel_icon',
                    title: 'Fuel Into: Full to Full',
                  ),
                ],
              ),
            ],
          ),
          20.vSpace,
        ],
      ),
    );
  }
}

class CarInfoTile extends StatelessWidget {
  final String icon;
  final String title;
  const CarInfoTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon.toPNG(),
          height: 15,
          width: 15,
        ),
        20.hSpace,
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
