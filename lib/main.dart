
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_github/bloc/featured_news_bloc.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/event/featured_news_event.dart';
import 'package:test_project_github/repository/news_repository.dart';
import 'package:test_project_github/ui_component/home_news_screen.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/ui_component/home_page.dart';
import 'package:test_project_github/ui_component/splash_screen.dart';
import 'package:test_project_github/category_selection_screen.dart';
import 'package:test_project_github/utility/app_provider.dart';
import 'package:test_project_github/utility/font_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Add this line
  await SharedPreferences.getInstance();
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

        BlocProvider(
          create: (context) => TopNewsBloc(
            repository: NewsRepository(),
          )..add(FetchTopNewsEvent()),
        ),

        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => FontSizeController()),
      ],
      child: Consumer<AppProvider>(
        builder: (context,  appProvider,  child) {
          return MaterialApp(
            title: 'Flutter App',
            debugShowCheckedModeBanner: false,
            theme: appProvider.theme,

            // theme: ThemeData(
            //   primarySwatch: Colors.blue,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            //
            // ),
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/select-categories': (context) => CategorySelectionScreen(),
              // '/home': (context) => MainNavigationScreen(),
              // '/home': (context) => HomeNewsScreen(),
              '/home': (context) => MainNavigationScreen(),
            },
          );
        }
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