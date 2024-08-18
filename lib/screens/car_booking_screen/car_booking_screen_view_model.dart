// ignore_for_file: use_build_context_synchronously

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/models/car_rental.dart';
import 'package:ski_sub/models/screen_arguements.dart';
import 'package:ski_sub/models/user.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_booking_screen/services/car_booking_services.dart';
import 'package:ski_sub/screens/car_rental_preview_screen.dart/car_rental_preview_screen.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/view_model_services.dart';

class CarBookingScreenViewModel extends ChangeNotifier {
  CarBookingScreenViewModel(this.vehicle);
  final CarBookingServices _services = CarBookingServices();
  final _auth = AppServices.locate<ViewModelServices>().auth;

  Vehicle vehicle;
  User? get user => _auth.user;
  bool loading = false;
  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  Future<void> bookVehicle({
    required String startDate,
    required String endDate,
    required String pickUpTime,
    required String dropOffTime,
    required String pickupLocation,
    required String dropOffLocation,
    required String age,
    required BuildContext context,
  }) async {
    try {
      setLoading(true);

      Map<String, dynamic> data = {
        'user': user?.id,
        'car': vehicle.id,
        'start_date': startDate,
        'end_date': endDate,
        'pickup_time': pickUpTime,
        'dropoff_time': dropOffTime,
        'age': age,
        'pickup_location': pickupLocation,
        'dropoff_location': dropOffLocation,
      };

      final response = await _services.bookVehicle(data);
      _showPreview(response, context);
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }

  void _showPreview(
    CarRental rental,
    BuildContext context,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          CarRentalPreviewScreen(
        carRentalPreviewScreenArguements: CarRentalPreviewScreenArguements(
          rental: rental,
          vehicle: vehicle,
        ),
      ),
    );
  }
}
