import 'package:shared_preferences/shared_preferences.dart';
import 'package:ski_sub/models/user.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/dio_services.dart';

class SignInServices {
  final _dio = AppServices.locate<DioServices>().dio;

  Future<User> signIn(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        'account/login/',
        data: data,
      );

      if (response.statusCode != 200) {
        throw response.data['message'];
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String token = response.data['token'];
      preferences.setString('bearerToken', token);
      return User.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
