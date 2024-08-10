import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ski_sub/screens/car_rental_screen/car_rental_screen.dart';
import 'package:ski_sub/utils/extensions.dart';

class QuickActionSection extends StatelessWidget {
  const QuickActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Quick Action',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          20.vSpace,
          Row(
            children: [
              QuickActionSectionButton(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CarRentalScreen(),
                )),
                icon: 'car_rental_icon',
                title: 'Car Rentals',
              ),
              20.hSpace,
              QuickActionSectionButton(
                onTap: () {},
                icon: 'hotel_booking_icon',
                title: 'Book Hotel',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickActionSectionButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const QuickActionSectionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon.toSVG()),
            15.vSpace,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            )
          ],
        ),
      ),
    );
  }
}
