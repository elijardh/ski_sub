import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/dio_services.dart';

class CarRentalPreviewServices {
  final _dio = AppServices.locate<DioServices>().dio;

  Future<void> placeBooking(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('car/api/orders/', data: data);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw response.data['messagee'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
