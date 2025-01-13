// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_project_github/ui_component/home_news_screen.dart';
// import 'category_provider.dart';
// import 'splash_screen.dart';
// import 'category_selection_screen.dart';
// import 'home_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CategoryProvider(),
//       child: MaterialApp(
//         title: 'Flutter App',
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/',
//         routes: {
//           '/': (context) => SplashScreen(),
//           '/select-categories': (context) => CategorySelectionScreen(),
//           '/home': (context) => HomeScreen(),
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/ui_component/home_news_screen.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/splash_screen.dart';
import 'package:test_project_github/category_selection_screen.dart';
import 'package:test_project_github/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Keep existing CategoryProvider
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        // Add BlocProvider for NewsBloc
        BlocProvider(
          create: (_) => NewsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/select-categories': (context) => CategorySelectionScreen(),
          '/home': (context) => HomeNewsScreen(),
        },
      ),
    );
  }
}

// BlocObserver for debugging (optional)
class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Bloc Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Bloc Error: $error');
    super.onError(bloc, error, stackTrace);
  }
}