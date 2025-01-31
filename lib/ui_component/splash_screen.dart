// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:test_project_github/category_provider.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkFirstTimeUser();
//   }
//
//   // Check if it's the first time the user has opened the app
//   Future<void> _checkFirstTimeUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
//
//     // If it's the first time user, navigate to the category selection screen
//     if (isFirstTimeUser) {
//       // Set first-time user flag to false
//       await prefs.setBool('isFirstTimeUser', false);
//       Navigator.pushReplacementNamed(context, '/select-categories');
//     } else {
//       // Load selected categories
//       await Provider.of<CategoryProvider>(context, listen: false).loadSelectedCategories();
//       if (Provider.of<CategoryProvider>(context, listen: false).selectedCategories.isEmpty) {
//         Navigator.pushReplacementNamed(context, '/select-categories');
//       } else {
//         Navigator.pushReplacementNamed(context, '/home');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Column(
//         children: [
//           FlutterLogo(),
//           Text("Splash screen")
//         ],
//       )),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../category_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  // Check if it's the first time user or if they've selected categories
  Future<void> _checkFirstTimeUser() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash duration

    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

    // Load preferences and navigate based on the status
    await categoryProvider.loadPreferences();

    // If it's the first-time user, navigate to category selection screen
    if (categoryProvider.isFirstTimeUser) {
      Navigator.pushReplacementNamed(context, '/select-categories');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center the image
          Center(
            child: SizedBox(
              width: 400.0,
              height: 200.0,
              child: Image.asset('assets/images/guardian_logo.png'),
            ),
          ),
          // Align the date text at the bottom
          Positioned(
            bottom: 20.0, // Set distance from the bottom
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(Jiffy.parseFromDateTime(DateTime.now()).yMMMMEEEEd,
                    style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
