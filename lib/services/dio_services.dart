import 'package:dio/dio.dart';
import 'package:ski_sub/services/dio_interceptor.dart';

class DioServices {
  Dio dio = Dio();

  void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://skis.eu-west-1.elasticbeanstalk.com/',
          connectTimeout: const Duration(milliseconds: 60000),
          receiveTimeout: const Duration(milliseconds: 60000)),
    )..interceptors.add(
        DioInterceptor(),
      );
  }
}
