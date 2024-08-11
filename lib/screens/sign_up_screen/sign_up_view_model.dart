import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/screens/sign_up_screen/services/sign_up_services.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/view_model_services.dart';

class SignUpViewModel extends ChangeNotifier {
  final SignUpServices _services = SignUpServices();
  final _auth = AppServices.locate<ViewModelServices>().auth;

  bool loading = false;

  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  Future<void> signUp(
    VoidCallback onSuccess, {
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      setLoading(true);
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'password2': confirmPassword,
        'username': email,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
      };
      final newUser = await _services.signUpUser(data);
      _auth.setUser(newUser);
      BotToast.showSimpleNotification(
        title: 'Account has been created, please sign in',
        duration: const Duration(seconds: 3),
      );
      onSuccess();
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
