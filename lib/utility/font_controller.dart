import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeController with ChangeNotifier {

  double value = 2.6;

  FontSizeController(){
    checkFontSize();
  }

  void updateFontSize(value) {
    this.value =value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("fontSize", value.toString()).then((val) {

      });
    });
    notifyListeners();
  }

  Future checkFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fontSize= prefs.getString("fontSize") ?? "2.6";
    value = double.parse(fontSize);
    notifyListeners();

  }

}