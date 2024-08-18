import 'dart:developer';
import 'package:ski_sub/models/vehicle.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/dio_services.dart';

class CarRentalServices {
  final _dio = AppServices.locate<DioServices>().dio;

  Future<List<Vehicle>> getVehicles() async {
    try {
      final response = await _dio.get('car/api/cars/');

      if (response.statusCode != 200) {
        throw response.data['message'];
      }

      return (response.data as List)
          .map(
            (e) => Vehicle.fromJson(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
