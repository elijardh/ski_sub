import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_booking_screen/car_booking_screen.dart';
import 'package:ski_sub/screens/car_details_screen/widgets/widgets.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarDetailsScreen extends StatelessWidget {
  final Vehicle vehicle;
  final String tag;
  const CarDetailsScreen({
    super.key,
    required this.vehicle,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 249, 249, 1),
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(
          'Car Details',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarImageSection(
              tag: tag,
              carImages: vehicle.image ?? [],
            ),
            20.vSpace,
            CarInfoSection(
              vehicle: vehicle,
            ),
            20.vSpace,
            CarSpecSection(
              vehicle: vehicle,
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Button(
                buttonName: 'Continue',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CarBookingScreen(
                      vehicle: vehicle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
