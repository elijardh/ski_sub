import 'package:flutter/material.dart';
import 'package:ski_sub/models/car.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarModelSection extends StatelessWidget {
  CarModelSection({super.key});

  final List<Car> carModels = [
    Car(
      icon: 'automobile_icon',
      name: 'SUV',
    ),
    Car(
      icon: 'sedan_icon',
      name: 'SEDAN',
    ),
    Car(
      icon: 'pickup_icon',
      name: 'HILLUX',
    ),
    Car(
      icon: 'bus_icon',
      name: 'BUS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Model',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        20.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: carModels
              .map(
                (e) => CarModelButton(car: e),
              )
              .toList(),
        ),
      ],
    );
  }
}

class CarModelButton extends StatelessWidget {
  final Car car;
  const CarModelButton({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            car.icon.toPNG(),
            height: 38,
            width: 38,
          ),
          5.vSpace,
          Text(
            car.name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
