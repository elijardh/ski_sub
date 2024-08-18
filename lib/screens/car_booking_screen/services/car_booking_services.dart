import 'package:ski_sub/models/car_rental.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/dio_services.dart';

class CarBookingServices {
  final _dio = AppServices.locate<DioServices>().dio;

  Future<CarRental> bookVehicle(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        'car/api/bookings/',
        data: data,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw response.data['message'];
      }

      return CarRental.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
