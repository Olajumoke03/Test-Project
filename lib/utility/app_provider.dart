import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_github/utility/constants.dart';


class AppProvider extends ChangeNotifier {
  AppProvider() {
    checkTheme();
  }

  String isNotificationOn = "1";
  ThemeData theme = Constants.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  void setTheme(ThemeData value, String c) async {
    theme = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", c);

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: c == "dark" ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: c == "dark" ? Brightness.light : Brightness.dark,
    ));

    notifyListeners();
  }

  void setNotificationEnabled(isEnabled) {
    isNotificationOn = isEnabled;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("isNotificationOn", isEnabled).then((val) {

      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;

  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ThemeData t;
    String? r = prefs.getString("theme") ?? "light";


    isNotificationOn = (prefs.getString("isNotificationOn") ?? "1");

    // isNotificationOn = (prefs.getString("isNotificationOn") ?? "1")!;


    if (r == "light") {
      t = Constants.lightTheme;
      setTheme(Constants.lightTheme, "light");
    } else {
      t = Constants.darkTheme;
      setTheme(Constants.darkTheme, "dark");
    }

    return t;
  }


}
