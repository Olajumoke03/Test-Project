import 'package:flutter/material.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

const String baseUrl="https://guardian.ng/wp-json/wp/v2/";
const String singleNews ="${baseUrl}posts?slug=";

// const String latestNews ="${baseUrl}posts?per_page=20&page=1";
const String latestNews ="${baseUrl}posts?per_page=20&page=1&categories_exclude=208968";

const String moreLatestNews ="${baseUrl}posts?per_page=20&page=";

const String newsByCategory ="${baseUrl}posts?per_page=20&page=1&categories=";
const String moreNewsByCategory ="${baseUrl}posts?per_page=20&categories=";

const String newsTag ="${baseUrl}posts?per_page=5&tags=";

const String searchResult ="${baseUrl}search?per_page=20&search=";
const String moreSearchResult ="search?per_page=20&search=&page=";

const String privacyPolicy ="${baseUrl}pages/778714";
const String aboutUs ="${baseUrl}pages/164902";
const String categoryList ="https://punchng.com/category-payload/?v2";

const String featuredNews ="${baseUrl}posts?categories=";

const String liveVideo ="https://punchng.com/mobile-app-streaming/";

const String netCoreUrl ="https://api.netcoresmartech.com/apiv2?type=contact&activity=add&apikey=28b46bfdfd06f61d3a5b1d266e0b30d8";


String readNewTimestamp(String timestamp) {
  final DateTime date = DateTime.parse(timestamp);

  var time = timeago.format(date);
  return time;
}

class Constants {

  static String readTimestamp(String timestamp) {
    final DateTime date = DateTime.parse(timestamp);

    var time = timeago.format(date);
    return time;
  }


  static String latestNewsCacheKey ="latest";
  static String featuredNewsCacheKey ="featured";

  static String appName = "The Guardian";

  static String appAbout =
      "<h1>Reach out to us:</h1>"
      "<p>Email: guardian@guardian.ng </p>"
      "<p>Address: 109 Apapa-Oshodi Express Way, Lagos </p>";

  //THEME
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = mainColor;
  static Color darkAccent = mainColor;
  static Color lightBG = const Color(0xFFFAFAFA);
  static Color darkBG = Colors.grey.shade900;

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: mainColor,
    primaryColorLight: greenColor,
    cardColor: Colors.grey[50],
    scaffoldBackgroundColor: lightBG,
    primaryColorDark: whiteColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: whiteColor,
    ),
    textTheme:  TextTheme(
        bodyMedium: const TextStyle(color: blackColor, fontSize: 15, ),
        bodySmall:  const TextStyle(color: blackColor, fontSize: 15),
        labelSmall: TextStyle(color: Colors.grey[200]),
        labelMedium: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      displaySmall: const TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(background: lightBG )
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: whiteColor,
    scaffoldBackgroundColor: darkBG,
    cardColor: Colors.black12,
    primaryColorDark: blackColor,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor:blackColor,
    ),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(color: whiteColor, fontSize: 17),
        bodySmall: const TextStyle(color: Colors.black87,),
        labelSmall: TextStyle(color: Colors.grey[800]),
        labelMedium: const TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
      displaySmall: const TextStyle(color: Colors.grey),


    ),
    colorScheme: ColorScheme.dark(background: darkBG)

  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

}
