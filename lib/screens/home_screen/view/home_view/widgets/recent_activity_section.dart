import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/utils/extensions.dart';

class RecentActivitySection extends StatelessWidget {
  final bool isNotEmpty;
  const RecentActivitySection({
    super.key,
    required this.isNotEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Activity',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: SkiColors.primaryColor,
                ),
              ),
            ],
          ),
          30.vSpace,
          Builder(
            builder: (context) {
              if (isNotEmpty) {
                return Column(
                    children: List.generate(
                  10,
                  (index) => const RecentActivityTile(),
                ));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('empty_state_icon'.toSVG()),
                  20.vSpace,
                  const Text(
                    'Looks like there’s no recent activity to show \nhere. Get started by making a transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class RecentActivityTile extends StatelessWidget {
  const RecentActivityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          15.hSpace,
          RichText(
            text: const TextSpan(
              text: 'Shopping ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: '\n 15 March, 2024, 8:20PM',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            '-NGN 150',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          15.hSpace,
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
