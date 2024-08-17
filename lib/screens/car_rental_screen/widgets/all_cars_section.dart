import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_details_screen/car_details_screen.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class AllCarsSection extends StatelessWidget {
  final List<Vehicle> vehicles;
  final bool loading;
  const AllCarsSection({
    super.key,
    required this.vehicles,
    required this.loading,
  });

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
        Builder(builder: (context) {
          if (loading) {
            return const Center(
                child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ));
          }
          return GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75,
            children: vehicles
                .map(
                  (vehicle) => VehicleCard(vehicle: vehicle),
                )
                .toList(),
          );
        }),
      ],
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    String tag = UniqueKey().toString();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CarDetailsScreen(
            tag: tag,
            vehicle: vehicle,
          ),
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
            Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  vehicle.image!.first.image!,
                  height: 114,
                  width: 149,
                ),
              ),
            ),
            10.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${vehicle.model?.make?.name} ${vehicle.model?.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            10.vSpace,
            Text(
              'Year: ${vehicle.year}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
            10.vSpace,
            Text.rich(
              TextSpan(
                  text: '${vehicle.pricePerDay} NGN',
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
