// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:test_project_github/home_news_model.dart';
// // import 'package:test_project_github/settings_screen.dart';
// // import 'category_provider.dart';
// // import 'package:http/http.dart' as http;
// //
// //
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final categoryProvider = Provider.of<CategoryProvider>(context);
// //
// //     return DefaultTabController(
// //       length: categoryProvider.selectedCategories.length,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Home'),
// //           actions: [
// //             IconButton(onPressed: (){
// //               Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));
// //             },
// //                 icon: Icon(Icons.settings)
// //             )
// //           ],
// //           bottom: TabBar(
// //             tabs: categoryProvider.selectedCategories
// //                 .map((categoryId) => Tab(text: categoryId))
// //                 .toList(),
// //           ),
// //         ),
// //         body: TabBarView(
// //           children: categoryProvider.selectedCategories.map((categoryId) {
// //             return NewsListScreen(categoryId: categoryId);
// //           }).toList(),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class NewsListScreen extends StatelessWidget {
// //   final String categoryId;
// //
// //   NewsListScreen({required this.categoryId});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Use the categoryId to fetch news
// //     return FutureBuilder(
// //       // Replace with your API call to fetch news by category
// //       future: fetchNewsForCategory(categoryId),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Center(child: CircularProgressIndicator());
// //         }
// //         if (snapshot.hasError) {
// //           return Center(child: Text('Error fetching news'));
// //         }
// //         final news = snapshot.data;
// //         return ListView.builder(
// //           itemCount: news!.length,
// //           itemBuilder: (context, index) {
// //             return ListTile(
// //               title: Text(news[index].title!.rendered!),
// //               subtitle: Text(news[index].date!),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// //
// //   Future<List<HomeNewsModel>> fetchNewsForCategory(String categoryId) async {
// //     // Fetch the news based on the category ID
// //     final response = await http.get(Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=3'));
// //     print("home list category id: " + categoryId.toString());
// //
// //     if (response.statusCode == 200) {
// //
// //       final List<dynamic> data = json.decode(response.body);
// //       print("home list data: " + data.toString());
// //
// //       return data.map((item) => HomeNewsModel.fromJson(item)).toList();
// //     } else {
// //       throw Exception('Failed to load news');
// //     }
// //   }
// // }
// //
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_project_github/category_provider.dart';
// import 'package:test_project_github/model/home_news_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:test_project_github/settings_screen.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     return DefaultTabController(
//       length: categoryProvider.selectedCategories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home'),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
//               },
//               icon: Icon(Icons.settings),
//             )
//           ],
//           bottom: TabBar(
//             indicatorSize: TabBarIndicatorSize.tab,
//             isScrollable: true,
//             tabAlignment: TabAlignment.start,
//             tabs: categoryProvider.selectedCategories.map((categoryId) {
//               // Find the category object using the categoryId
//               final category = categoryProvider.categories.firstWhere((cat) => cat.categoryId == categoryId);
//               return Tab(
//                 text: '${category.categoryName} (${category.categoryId})',  // Display name and ID
//               );
//             }).toList(),
//           ),
//         ),
//         body: TabBarView(
//           children: categoryProvider.selectedCategories.map((categoryId) {
//             return NewsListScreen(categoryId: categoryId);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
//
//
// class NewsListScreen extends StatelessWidget {
//   final String categoryId;
//
//   NewsListScreen({required this.categoryId});
//
//   @override
//   Widget build(BuildContext context) {
//     // Use the categoryId to fetch news
//     return FutureBuilder(
//       future: fetchNewsForCategory(categoryId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text('Error fetching news'));
//         }
//         final news = snapshot.data;
//         return ListView.builder(
//           itemCount: news!.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(news[index].title!.rendered!),
//               subtitle: Text(news[index].date!),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Future<List<HomeNewsModel>> fetchNewsForCategory(String categoryId) async {
//     final response = await http.get(Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=3'));
//     print("home list category id: " + categoryId.toString());
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print("home list data: " + data.toString());
//       return data.map((item) => HomeNewsModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }
