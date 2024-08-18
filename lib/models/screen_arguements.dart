import 'package:ski_sub/models/car_rental.dart';
import 'package:ski_sub/models/vehicle.dart';

class CarRentalPreviewScreenArguements {
  final Vehicle vehicle;
  final CarRental rental;

  CarRentalPreviewScreenArguements({
    required this.rental,
    required this.vehicle,
  });
}
