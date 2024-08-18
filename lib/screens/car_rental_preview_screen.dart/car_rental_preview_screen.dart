import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ski_sub/models/screen_arguements.dart';
import 'package:ski_sub/screens/car_rental_preview_screen.dart/car_rental_preview_view_model.dart';
import 'package:ski_sub/screens/car_rental_screen/car_rental_screen.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/utils/extensions.dart';

class CarRentalPreviewScreen extends StatelessWidget {
  final CarRentalPreviewScreenArguements carRentalPreviewScreenArguements;
  const CarRentalPreviewScreen({
    super.key,
    required this.carRentalPreviewScreenArguements,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CarRentalPreviewViewModel(carRentalPreviewScreenArguements.rental),
      child: Consumer<CarRentalPreviewViewModel>(
        builder: (context, value, child) => Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Overview',
                ),
                10.vSpace,
                Text(
                  '${carRentalPreviewScreenArguements.vehicle.model?.name} ${carRentalPreviewScreenArguements.vehicle.model?.make?.name}',
                ),
                10.vSpace,
                Text(
                  'Year: ${carRentalPreviewScreenArguements.vehicle.year}',
                ),
                10.vSpace,
                Row(
                  children: [
                    Expanded(
                      child: CardDetailsCard(
                        title: 'Start',
                        subtitle: DateFormat.MMMEd().format(
                          carRentalPreviewScreenArguements.rental.startDate!,
                        ),
                      ),
                    ),
                    20.hSpace,
                    Expanded(
                      child: CardDetailsCard(
                        title: 'End',
                        subtitle: DateFormat.MMMEd().format(
                          carRentalPreviewScreenArguements.rental.endDate!,
                        ),
                      ),
                    ),
                  ],
                ),
                20.vSpace,
                Button(
                  loading: value.loading,
                  buttonName:
                      '${carRentalPreviewScreenArguements.rental.totalAmount} NGN',
                  onTap: () => value.placeBooking(() {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const CarRentalScreen(),
                      ),
                      ModalRoute.withName('/'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDetailsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const CardDetailsCard({
    super.key,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          10.vSpace,
          Text(subtitle),
        ],
      ),
    );
  }
}
