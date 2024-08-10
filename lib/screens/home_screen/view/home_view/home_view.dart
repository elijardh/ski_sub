import 'package:flutter/material.dart';
import 'package:ski_sub/screens/home_screen/view/home_view/widgets/widgets.dart';
import 'package:ski_sub/utils/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeViewHeader(),
            40.vSpace,
            const QuickActionSection(),
            40.vSpace,
            const RecentActivitySection(
              isNotEmpty: true,
            ),
          ],
        ),
      ),
    );
  }
}
