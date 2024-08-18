import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? bearerToken = preferences.getString('bearerToken');
    options.headers = {
      'Content-Type': 'application/json',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept': '*/*, application/json',
      'Connection': 'keep-alive',
      // 'Accept': 'application/json',
      if (bearerToken != null) 'Authorization': 'Token $bearerToken',
    };
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
