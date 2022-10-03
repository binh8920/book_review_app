import 'package:flutter/material.dart';
import 'package:ez_book/app/ui/screens/home/widget/custom_app_bar.dart';
import 'package:ez_book/app/ui/screens/home/widget/movie_header.dart';
import 'package:ez_book/app/ui/screens/home/widget/category.dart';
import 'package:ez_book/app/ui/screens/home/widget/trending_movies.dart';
import 'package:ez_book/app/ui/screens/category/category.dart';
import 'package:ez_book/app/ui/screens/user/user.dart';
import 'package:ez_book/app/ui/settings/settings_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.settingsController})
      : super(key: key);
  final SettingsController settingsController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          onPageChanged: ((value) => setState(() {
                currentIndex = value;
              })),
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            Home(settingsController: widget.settingsController),
            const CategoriesScreen(),
            UserScreen(settingsController: widget.settingsController),
          ]),
      bottomNavigationBar: _buildBottonBar(),
    );
  }

  BottomNavigationBar _buildBottonBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
              currentIndex = index;
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            }),
        selectedItemColor: Color.fromARGB(255, 183, 99, 219),
        items: const [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              label: 'Person', icon: Icon(Icons.person_outline)),
        ]);
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.settingsController}) : super(key: key);
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomAppBar(settingsController: settingsController),
          MovieHeader(
            settingsController: settingsController,
          ),
          Category(settingsController: settingsController),
          TrendingMovies(
            settingsController: settingsController,
          ),
        ],
      ),
    );
  }
}
