import 'package:flutter/material.dart';
import 'package:ski_sub/screens/home_screen/view/home_view/home_view.dart';
import 'package:ski_sub/screens/home_screen/widget/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 249, 249, 1),
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          _pageController.jumpToPage(currentIndex);
        }),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() {
            currentIndex = value;
          }),
          children: [
            const HomeView(),
            Container(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
