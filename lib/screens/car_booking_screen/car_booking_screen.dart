import 'package:flutter/material.dart';
import 'package:ski_sub/shared/shared.dart';

class CarBookingScreen extends StatefulWidget {
  const CarBookingScreen({super.key});

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
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
    );
  }
}
