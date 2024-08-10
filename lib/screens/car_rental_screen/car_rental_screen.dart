import 'package:flutter/material.dart';
import 'package:ski_sub/screens/car_rental_screen/widgets/widgets.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarRentalScreen extends StatefulWidget {
  const CarRentalScreen({super.key});

  @override
  State<CarRentalScreen> createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 249, 249, 1),
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(
          'Car Rentals',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Find your favourite \nvehicle.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            20.vSpace,
            InputField(
              textEditingController: _searchController,
              fillColor: Colors.white,
              prefixWidget: const Icon(
                Icons.search,
              ),
            ),
            20.vSpace,
            CarModelSection(),
            20.vSpace,
            const AllCarsSection(),
          ],
        ),
      ),
    );
  }
}
