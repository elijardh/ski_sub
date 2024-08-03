import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ski_sub/screens/sign_up_screen/sign_up_screen.dart';
import 'package:ski_sub/shared/shared.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: const CustomBackButton(),
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text.rich(
          TextSpan(
            text: 'Don’t have an account? ',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: 'Sign Up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }),
                    );
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            30.vSpace,
            const Text(
              'Sign In 👋',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            20.vSpace,
            const Text(
              'Welcome back, Log in to your account ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            60.vSpace,
            InputField(
              textEditingController: _emailController,
              label: 'Email',
              hint: 'johnDoe@gmail.com',
            ),
            20.vSpace,
            InputField(
              textEditingController: _passwordController,
              label: 'Password',
              hint: '******',
              obscure: true,
            ),
            30.vSpace,
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: SkiColors.primaryColor,
              ),
            ),
            30.vSpace,
            Button(
              buttonName: 'Sign In',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
