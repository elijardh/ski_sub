import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ski_sub/screens/home_screen/home_screen.dart';
import 'package:ski_sub/screens/sign_up_screen/sign_up_view_model.dart';
import 'package:ski_sub/shared/button.dart';
import 'package:ski_sub/shared/custom_back_button.dart';
import 'package:ski_sub/shared/input_field.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  bool obscure = true;
  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _confirmPassword.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            leadingWidth: 70,
            leading: const CustomBackButton(),
            title: const Text(
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Text.rich(
              TextSpan(
                text: 'Have an account? ',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: 'Log in here',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pop();
                      },
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: SkiColors.primaryColor,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  20.vSpace,
                  const Text(
                    'Get Started 👋',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  20.vSpace,
                  const Text(
                    'Create an account so you can pay your bills and purchase top-ups faster',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  40.vSpace,
                  InputField(
                    textEditingController: _fullName,
                    label: 'Full Name',
                    hint: 'John Doe',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a valid Full Name';
                      }
                      return null;
                    },
                  ),
                  20.vSpace,
                  InputField(
                    textEditingController: _email,
                    label: 'Email',
                    hint: 'johndoe@email.com',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a valid Email';
                      }
                      return null;
                    },
                  ),
                  20.vSpace,
                  InputField(
                    textEditingController: _phoneNumber,
                    label: 'Phone Number',
                    hint: '123456789',
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a valid PhoneNumber';
                      }
                      return null;
                    },
                  ),
                  20.vSpace,
                  InputField(
                    textEditingController: _password,
                    label: 'Password',
                    hint: '********',
                    obscure: obscure,
                    suffixWidget: GestureDetector(
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                      child: const Icon(
                        Icons.visibility_off_outlined,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a valid Password';
                      }
                      return null;
                    },
                  ),
                  20.vSpace,
                  InputField(
                    textEditingController: _confirmPassword,
                    label: 'Comfirm Password',
                    hint: '******',
                    obscure: obscure,
                    suffixWidget: GestureDetector(
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                      child: const Icon(
                        Icons.visibility_off_outlined,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a valid Password';
                      }
                      if (value != _password.text) {
                        return "Password doesn't macth";
                      }
                      return null;
                    },
                  ),
                  40.vSpace,
                  Button(
                    buttonName: 'Sign Up',
                    loading: value.loading,
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        List<String> names = _fullName.text.split(' ');
                        String firstName = names.first;
                        String lastName = names.length > 1 ? names.last : '';
                        value.signUp(
                          () => Navigator.of(context).pop(),
                          email: _email.text,
                          password: _password.text,
                          confirmPassword: _confirmPassword.text,
                          firstName: firstName,
                          lastName: lastName,
                          phoneNumber: _phoneNumber.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
