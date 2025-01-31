import 'package:flutter/material.dart';
import 'package:test_project_github/ui_component/bookmark_screen.dart';
import 'package:test_project_github/ui_component/categories_screen.dart';
import 'package:test_project_github/ui_component/guardian_tv.dart';
import 'package:test_project_github/ui_component/home_news_screen.dart';
import 'package:test_project_github/ui_component/more_screen.dart';
import 'package:test_project_github/ui_component/search_screen.dart';
import 'package:test_project_github/ui_component/notification_screen.dart';
import 'package:test_project_github/utility/colors.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // int _currentIndex = 0;

  // final List<Widget> _screens = [
  //   const HomeNewsScreen(),
  //   const SearchScreen(),
  //   const NotificationScreen(),
  //   const MoreScreen(),
  // ];

  int _page = 0;

  final List<Widget> _children = [
    const HomeNewsScreen(),
    const CategoriesScreen(selectedCategories: ["Sports", "Education", "Politics", "Business"]),
    const GuardianTVScreen(),
    const SavedNewsScreen(),
    const MoreScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _page ,
          children:[
            _children[0],
            _children[1],
            _children[2],
            _children[3],
            _children[4],
          ]),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background!,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: ("Discover"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_outlined),
            label: ("Videos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label:("Bookmark"),
          ),
          BottomNavigationBarItem(icon: Icon( Icons.more_vert),
          label: ("More"))

        ],
        onTap: onTabTapped,
        currentIndex: _page,
      ),
    );


    // return Scaffold(
    //   body: _screens[_currentIndex],
    //   bottomNavigationBar: NavigationBar(
    //
    //     selectedIndex: _currentIndex,
    //     onDestinationSelected: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //     destinations: const [
    //       NavigationDestination(
    //         icon: Icon(Icons.home_outlined),
    //         selectedIcon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       NavigationDestination(
    //         icon: Icon(Icons.search_outlined),
    //         selectedIcon: Icon(Icons.search),
    //         label: 'Search',
    //       ),
    //       NavigationDestination(
    //         icon: Icon(Icons.notifications_outlined),
    //         selectedIcon: Icon(Icons.notifications),
    //         label: 'Notifications',
    //       ),
    //       NavigationDestination(
    //         icon: Icon(Icons.settings_outlined),
    //         selectedIcon: Icon(Icons.settings),
    //         label: 'Settings',
    //       ),
    //     ],
    //   ),
    // );


  }
}