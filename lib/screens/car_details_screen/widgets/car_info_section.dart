import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarInfoSection extends StatelessWidget {
  final Vehicle vehicle;

  const CarInfoSection({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${vehicle.model?.make?.name} ${vehicle.model?.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 35,
              ),
            ],
          ),
          5.vSpace,
          Text(
            'Year: ${vehicle.year}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          5.vSpace,
          Text.rich(
            TextSpan(
              text: '${vehicle.pricePerDay} NGN',
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
                  CarInfoTile(
                    icon: 'user_icon',
                    title: '${vehicle.numberOfPassengers} Passengers',
                  ),
                  10.vSpace,
                  CarInfoTile(
                    icon: 'air_con_icon',
                    title: vehicle.airConditioning!
                        ? 'Air Conditioning'
                        : 'No Air Conditioning',
                  ),
                  10.vSpace,
                  CarInfoTile(
                    icon: 'gear_icon',
                    title: '${vehicle.transmission}',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarInfoTile(
                    icon: 'door_icon',
                    title: '${vehicle.numberOfDoors} Doors',
                  ),
                  10.vSpace,
                  CarInfoTile(
                    icon: 'fuel_icon',
                    title: '${vehicle.fuelType}',
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
