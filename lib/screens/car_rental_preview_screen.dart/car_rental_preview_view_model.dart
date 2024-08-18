import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/models/car_rental.dart';
import 'package:ski_sub/screens/car_rental_preview_screen.dart/services/car_rental_preview_services.dart';

class CarRentalPreviewViewModel extends ChangeNotifier {
  CarRentalPreviewViewModel(this.carRental);
  final CarRental carRental;
  final CarRentalPreviewServices _services = CarRentalPreviewServices();
  bool loading = false;

  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  Future<void> placeBooking(VoidCallback onSuccess) async {
    try {
      setLoading(true);
      final data = {
        'user': carRental.user,
        'booking': carRental.id,
        'status': 'confirmed'
      };
      await _services.placeBooking(data);

      onSuccess();
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
