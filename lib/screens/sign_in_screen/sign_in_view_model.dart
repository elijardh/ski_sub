import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/screens/sign_in_screen/services/sign_in_services.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/view_model_services.dart';

class SignInViewModel extends ChangeNotifier {
  final _auth = AppServices.locate<ViewModelServices>().auth;
  bool loading = false;
  void setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  final SignInServices _services = SignInServices();
  Future<void> signIn(
      String email, String password, VoidCallback onSuccess) async {
    try {
      setLoading(true);

      final newUser = await _services.signIn(
        {
          'username': email,
          'password': password,
        },
      );
      _auth.setUser(newUser);
      onSuccess();
    } catch (e) {
      BotToast.showText(text: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
