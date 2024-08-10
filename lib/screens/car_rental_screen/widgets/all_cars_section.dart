import 'package:flutter/material.dart';
import 'package:ski_sub/screens/car_details_screen/car_details_screen.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class AllCarsSection extends StatelessWidget {
  const AllCarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'All Cars',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        15.vSpace,
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.75,
          children: List.generate(
            10,
            (index) => const VehicleCard(),
          ),
        ),
      ],
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CarDetailsScreen(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'vehicle_place_holder'.toPNG(),
              height: 114,
              width: 149,
            ),
            10.vSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hyundia Santafe',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            10.vSpace,
            const Text(
              'Year: 2015',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
            10.vSpace,
            Text.rich(
              TextSpan(
                  text: '75,000 NGN',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: SkiColors.primaryColor,
                  ),
                  children: const [
                    TextSpan(
                        text: ' / Day',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
