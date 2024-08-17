import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_rental_screen/services/car_rental_services.dart';

class CarRentalScreenViewModel extends ChangeNotifier {
  CarRentalScreenViewModel() {
    _getCars();
  }
  final CarRentalServices _services = CarRentalServices();
  bool loading = false;

  List<Vehicle> vehicles = [];

  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  Future<void> _getCars() async {
    try {
      setLoading(true);

      vehicles = await _services.getVehicles();
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
