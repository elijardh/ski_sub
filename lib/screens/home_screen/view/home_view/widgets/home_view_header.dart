import 'package:flutter/material.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: SkiColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Image.asset(
                'profile_image'.toPNG(),
                height: 48,
                width: 48,
              ),
              20.hSpace,
              const Text(
                'Hello,\nAbdullah!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ],
          ),
          15.vSpace,
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(23, 2, 81, 1),
                  Color.fromRGBO(23, 14, 128, 0.9),
                  Color.fromRGBO(23, 20, 155, 0.84),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Main Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                10.vSpace,
                const Text(
                  'NGN 2000.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                10.vSpace,
                const Icon(
                  Icons.file_download_outlined,
                  color: Colors.white,
                ),
                10.vSpace,
                const Text(
                  'Fund Wallet',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
