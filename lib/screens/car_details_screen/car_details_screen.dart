import 'package:flutter/material.dart';
import 'package:ski_sub/screens/car_details_screen/widgets/widgets.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

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
            const CarImageSection(),
            20.vSpace,
            const CarInfoSection(),
            20.vSpace,
            const CarSpecSection(),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Button(
                buttonName: 'Continue',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
