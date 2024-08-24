import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/screens/car_rental_screen/services/car_rental_services.dart';

class CarRentalScreenViewModel extends ChangeNotifier {
  CarRentalScreenViewModel() {
    getCars();
  }
  final CarRentalServices _services = CarRentalServices();
  bool loading = false;

  List<Vehicle> vehicles = [];

  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  Future<void> getCars({String? keyword}) async {
    try {
      setLoading(true);

      Map<String, dynamic> param = {};

      if (keyword != null) {
        param.addAll({
          'search': keyword,
        });
      }

      vehicles = await _services.getVehicles(param: param);
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
