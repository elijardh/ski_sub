import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ski_sub/services/dio_services.dart';
import 'package:ski_sub/services/view_model_services.dart';

abstract class AppServices {
  static GetIt locate = GetIt.instance;

  static void initialize(DioServices dioServices) {
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
        GlobalKey<ScaffoldMessengerState>();
    ViewModelServices viewModelServices =
        ViewModelServices(scaffoldMessengerState);

    AppServices.locate.registerSingleton<GlobalKey<ScaffoldMessengerState>>(
      scaffoldMessengerState,
    );
    AppServices.locate.registerSingleton<ViewModelServices>(
      viewModelServices,
    );
    AppServices.locate.registerSingleton<DioServices>(
      dioServices,
    );
  }
}
