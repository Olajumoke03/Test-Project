// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:test_project_github/bloc/home_news_bloc.dart';
// import 'package:test_project_github/category_provider.dart';
// import 'package:test_project_github/model/catgegory_model.dart';
// import 'package:test_project_github/settings_screen.dart';
// import 'package:test_project_github/state/home_news_state.dart';
// import 'package:test_project_github/ui_component/news_by_category.dart';
// import 'package:test_project_github/ui_component/notification_screen.dart';
// import 'package:test_project_github/ui_component/search_screen.dart';
//
// import '../event/home_news_event.dart';
//
//
// class HomeNewsScreen extends StatefulWidget {
//   const HomeNewsScreen({super.key});
//
//   @override
//   _HomeNewsScreenState createState() => _HomeNewsScreenState();
// }
//
// class _HomeNewsScreenState extends State<HomeNewsScreen> {
//
//   final List<String> menuItems = [
//     'News',
//     'Opinion',
//     'Lifestyle',
//     'Sport',
//     'Business',
//     'Technology',
//     'Woman',
//     'Guardian Life',
//     'Guardian Arts',
//     'Newsletter'
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when the screen initializes
//     Future.delayed(Duration.zero, () {
//       final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
//       categoryProvider.fetchCategories();
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     // // Show loading indicator while categories are being fetched
//     // if (categoryProvider.categories.isEmpty) {
//     //   return Scaffold(
//     //     appBar: AppBar(title: const Text('Home')),
//     //     body: const Center(child: CircularProgressIndicator()),
//     //   );
//     // }
//
//
//
//     return DefaultTabController(
//       length: categoryProvider.selectedCategories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Image.asset('assets/images/logo_box.png', width: 170, height: 50),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsScreen()),
//                 );
//               },
//               icon: const Icon(Icons.settings),
//             ),
//
//             IconButton (
//               onPressed: () {
//                 Navigator.push( context, MaterialPageRoute(builder: (context)=>
//                     const SearchScreen()
//                   )
//                 );
//               } ,
//               icon: Center(
//                 child: Icon (
//                     Icons.search , size: 25,
//                     color: Theme.of(context).textTheme.bodyMedium!.color
//                 ),
//               ) ,
//             ),
//
//
//             IconButton (
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
//               } ,
//               icon: Center(
//                 child: Icon (
//                     Icons.notifications_none_outlined , size: 25,
//                     color: Theme.of(context).textTheme.bodyMedium!.color
//                 ),
//               ) ,
//             ),
//           ],
//
//           bottom: TabBar(
//             indicatorSize: TabBarIndicatorSize.tab,
//             isScrollable: true,
//             tabAlignment: TabAlignment.start,
//             tabs: categoryProvider.selectedCategories.map((categoryId) {
//               // Find the category in the loaded categories list
//               final category = categoryProvider.categories.firstWhere(
//                     (cat) => cat.categoryId == categoryId,
//                 orElse: () => CategoryListModel(
//                   categoryId: categoryId,
//                   categoryName: 'Loading...',
//                 ),
//               );
//
//               return Tab(
//                 text: '${category.categoryName ?? 'Loading...'} ($categoryId)',
//               );
//             }).toList(),
//           ),
//         ),
//
//         drawer: Drawer(
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           child: Column(
//             // padding: EdgeInsets.zero,
//             children: <Widget>[
//               const SizedBox(height: 50,),
//               Container(
//                 height: 100,
//                 child: Image.asset('assets/images/logo_box.png', width: 200, height: 70),
//               ),
//               ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: menuItems.length,
//                 itemBuilder: (context, index) {
//
//                   return Column(
//                     children: [
//                       ListTile(
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//                         minTileHeight: 10.0,
//                         trailing: Icon(
//                             Icons.keyboard_arrow_down_sharp,
//                             color: Colors.grey[800]
//                         ),
//                         title: Text(
//                           menuItems[index],
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => NewsByCategoryScreen(
//                                   title: menuItems[index]
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       const Divider(
//                         indent: 15.0,
//                         endIndent: 15.0,
//                         color: Colors.grey,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//
//
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('News',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //     // style: GoogleFonts.mont(
//               //     //     fontWeight: FontWeight.bold,
//               //     //     fontSize: 18)
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               //
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Opinion',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               //
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Lifestyle',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Sport',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Business',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               //
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Technology',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               //
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Woman',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Guardian Life',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Guardian Arts',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//               //
//               // ListTile(
//               //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//               //   minTileHeight: 10.0,
//               //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
//               //   title: const Text('Newsletter',
//               //     style: TextStyle(
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 18,
//               //     ),
//               //   ),
//               //   onTap: () {},
//               // ),
//               //
//               // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
//
//             ],
//           ),
//         ),
//
//
//         body: TabBarView(
//           children: categoryProvider.selectedCategories.map((categoryId) {
//             return NewsListScreen(categoryId: categoryId);
//           }).toList(),
//         ),
//       ),
//     );
//
//
//   }
// }
//
//
// // Modified NewsListScreen
// class NewsListScreen extends StatefulWidget {
//   final String categoryId;
//
//   const NewsListScreen({Key? key, required this.categoryId}) : super(key: key);
//
//   @override
//   State<NewsListScreen> createState() => _NewsListScreenState();
// }
//
// class _NewsListScreenState extends State<NewsListScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _loadNews();
//   }
//
//   void _loadNews() {
//     context.read<NewsBloc>().add(FetchNewsForCategory(widget.categoryId));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsBloc, NewsState>(
//       builder: (context, state) {
//         if (state is NewsLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (state is NewsError) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(state.message),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _loadNews,
//                   child: const Text('Retry'),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         if (state is NewsEmpty) {
//           return const Center(
//             child: Text('No news available for this category'),
//           );
//         }
//
//         if (state is NewsLoaded) {
//           return RefreshIndicator(
//             onRefresh: () async => _loadNews(),
//             child: ListView.builder(
//               itemCount: state.news.length,
//               itemBuilder: (context, index) {
//                 final newsItem = state.news[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       newsItem.title!.rendered!,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 4),
//                         Text(newsItem.categoriesString![0]),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//
//         return const SizedBox();
//       },
//     );
//   }
// }
//
//
// // class NewsListScreen extends StatelessWidget {
// //   final String categoryId;
// //
// //   const NewsListScreen({Key? key, required this.categoryId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<NewsBloc, NewsState>(
// //       builder: (context, state) {
// //         if (state is NewsLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //         if (state is NewsError) {
// //           return Center(child: Text(state.message));
// //         }
// //         if (state is NewsLoaded) {
// //           print("news list: " + state.news.length.toString());
// //           return ListView.builder(
// //             shrinkWrap: true,
// //             physics: NeverScrollableScrollPhysics(),
// //             itemCount: state.news.length,
// //             itemBuilder: (context, index) {
// //               final newsItem = state.news[index];
// //               return ListTile(
// //                 title: Text(newsItem.title!.rendered!),
// //                 subtitle: Text(newsItem.date!),
// //               );
// //             },
// //           );
// //         }
// //         return const SizedBox();
// //       },
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/bloc/featured_news_bloc.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/event/featured_news_event.dart';
import 'package:test_project_github/event/home_news_event.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/ui_component/settings_screen.dart';
import 'package:test_project_github/state/featured_news_state.dart';
import 'package:test_project_github/state/home_news_state.dart';
import 'package:test_project_github/ui_component/news_by_category.dart';
import 'package:test_project_github/ui_component/news_details_screen.dart';
import 'package:test_project_github/ui_component/notification_screen.dart';
import 'package:test_project_github/ui_component/search_screen.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/widgets/build_error_ui.dart';
import 'package:test_project_github/widgets/build_loading_widget.dart';
import 'package:html/parser.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({super.key});

  @override
  _HomeNewsScreenState createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  final List<String> menuItems = [
    'News',
    'Opinion',
    'Lifestyle',
    'Sport',
    'Business',
    'Technology',
    'Woman',
    'Guardian Life',
    'Guardian Arts',
    'Newsletter'
  ];

  List<HomeNewsModel> allFeaturedNews =[];


  @override
  void initState() {
    super.initState();
    // Fetch categories when the screen initializes
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.fetchCategories();
    });

  }

  String _parseHtmlString(String? htmlString) {
    if (htmlString == null) return '';
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return DefaultTabController(
      length: categoryProvider.selectedCategories.length,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Image.asset('assets/images/guardian_logo.png', width: 170, height: 50),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: Icon(
                Icons.search,
                size: 25,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 25,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<TopNewsBloc>().add(RefreshTopNewsEvent());
              },
            ),
          ],
        ),

        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              SizedBox(height: 50),
              Container(
                height: 100,
                child: Image.asset('assets/images/logo_box.png', width: 200, height: 70),
              ),
              ...menuItems.map((item) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                      minVerticalPadding: 10.0,
                      trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800]),
                      title: Text(
                        item,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsByCategoryScreen(title: item)),
                        );
                      },
                    ),
                    const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey),
                  ],
                );
              }).toList(),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Stories',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsByCategoryScreen(title: "Top Stories",)));
                      },
                      child: const Text('Show All', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 230,
                child: BlocBuilder<TopNewsBloc, TopNewsState>(
                  builder: (context, state) {
                    if (state is TopNewsInitialState) {
                      return const Center(child: Text('Pull to refresh news'));
                    }

                    if (state is TopNewsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is TopNewsErrorState) {
                      return Center(child: Text(state.message));
                    }

                    if (state is TopNewsLoadedState) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<TopNewsBloc>().add(RefreshTopNewsEvent());
                        },
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            child: InkWell(
                              onTap: (){},
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                final newsItem = state.news[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailScreen(
                                            imageUrl: 'https://picsum.photos/150/150?random=$index',
                                            title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
                                            author: 'Andy Corbley',
                                            timeAgo: '1hr ago',
                                            comments: 8,
                                            likes: 34,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 230,
                                          width: 350,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          margin: const EdgeInsets.only(left: 10.0),

                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                            child:
                                            Image.network(
                                              newsItem.xFeaturedMediaLarge!,
                                              height: 200,
                                              width: 200,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return  Image.asset("assets/images/logo_box.png", height: 200);
                                              },
                                            ),
                                            // Image.asset(
                                            //   'assets/images/image.jpg',
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                        ),

                                        Positioned(
                                          // bottom: 0.0,
                                          top: 118.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 8.0, right: 0.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              gradient: LinearGradient(
                                                colors: [Colors.black.withOpacity(0.8),Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.5),Colors.black.withOpacity(0.0)],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(3.0),
                                                  margin:const EdgeInsets.only(left: 8.0),
                                                  decoration: BoxDecoration(
                                                      color: mainColor.withOpacity(0.8),
                                                      borderRadius: BorderRadius.circular(5.0)
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child:  IntrinsicWidth(
                                                      child: Text(
                                                        newsItem.categoriesString![0],
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(
                                                    _parseHtmlString(newsItem.title?.rendered ?? ''),
                                                    style: GoogleFonts.merriweather(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,

                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0 ),
                                                  child:
                                                  Text(Jiffy.parse('${newsItem.date}').fromNow(),
                                                    style: GoogleFonts.montserrat(
                                                        fontSize: 15,
                                                        color: Colors.white
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                        ),

                        // ListView.builder(
                        //   itemCount: state.news.length,
                        //   scrollDirection: Axis.horizontal,
                        //   itemBuilder: (context, index) {
                        //     final newsItem = state.news[index];
                        //     return Card(
                        //       margin: const EdgeInsets.all(8),
                        //       child: Stack(
                        //         // crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //             Image.network(
                        //               newsItem.xFeaturedMediaLarge!,
                        //               height: 200,
                        //               width: 200,
                        //               fit: BoxFit.cover,
                        //               errorBuilder: (context, error, stackTrace) {
                        //                 return  Image.asset("assets/images/logo_box.png", height: 200);
                        //               },
                        //             ),
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(horizontal: 10),
                        //             child: Text(
                        //               _parseHtmlString(newsItem.title?.rendered ?? ''),
                        //               style: Theme.of(context).textTheme.titleLarge,
                        //               maxLines: 2,
                        //               overflow: TextOverflow.ellipsis,
                        //
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // ),
                      );
                    }

                    return Container();
                  },
                ),
              ),

              // const SizedBox(height: 10,),
              Divider(color: Colors.grey[400], indent: 10.0, endIndent: 10.0,),


              // TabBar and list content
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 200, // Subtracting the red container's height
                ),
                child: Column(
                  children: [
                    TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
                      // isScrollable: true,
                      // tabAlignment: TabAlignment.start,
                      // dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 9, vertical: 0),
                      indicator: BoxDecoration(
                        color: mainColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),

                      tabs: categoryProvider.selectedCategories.map((categoryId) {
                        final category = categoryProvider.categories.firstWhere(
                              (cat) => cat.categoryId == categoryId,
                          orElse: () => CategoryListModel(
                            categoryId: categoryId,
                            categoryName: 'Loading...',
                          ),
                        );
                        return Row(
                          children: [
                     Image.asset("assets/images/marie_claire-logo.png", height: 200),

                            Tab(
                              text: category.categoryName ?? 'Loading...',
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: categoryProvider.selectedCategories.map((categoryId) {
                          return NewsListScreen(categoryId: categoryId);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Modified NewsListScreen
class NewsListScreen extends StatefulWidget {
  final String categoryId;

  const NewsListScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() {
    context.read<NewsBloc>().add(FetchNewsForCategory(widget.categoryId));
  }

  String _parseHtmlString(String? htmlString) {
    if (htmlString == null) return '';
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadNews,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is NewsEmpty) {
          return const Center(
            child: Text('No news available for this category'),
          );
        }

        if (state is NewsLoaded) {
          return RefreshIndicator(
            onRefresh: () async => _loadNews(),
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 7,),
                scrollDirection: Axis.vertical,
                itemCount: state.news.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                final newsItem = state.news[index];

                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsDetailScreen(
                                  imageUrl: 'https://picsum.photos/150/150?random=',
                                  title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
                                  author: 'Andy Corbley',
                                  timeAgo: '1hr ago',
                                  comments: 8,
                                  likes: 34,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () { },
                                      child: Text(
                                        newsItem.categoriesString![0],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Text( _parseHtmlString(newsItem.title?.rendered ?? ''),
                                        style: GoogleFonts.merriweather(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Theme.of(context).textTheme.bodyMedium!.color,
                                        ),
                                      )
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          Jiffy.parse('${newsItem.date}').fromNow()  ,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(' |  4 min read',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 10),

                              Card(

                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                                elevation: 0,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                                  child: Image.asset('assets/images/image.jpg', height: 100, width: 100,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Divider(color: Colors.grey[300],),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  if (index % 5 == 0) {
                    return  Container(
                        height: 270,
                        margin: const EdgeInsets.only(top: 10.0) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Advertisement', style: TextStyle(color: Colors.grey[700]),),
                            // getAd(),
                          ],
                        ));
                  } else {
                    return Container();
                  }
                }
            ),

            // ListView.builder(
            //   itemCount: state.news.length,
            //   itemBuilder: (context, index) {
            //     final newsItem = state.news[index];
            //     return Row(
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               _parseHtmlString(newsItem.title?.rendered ?? ''),
            //               style: const TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(newsItem.categoriesString![0]),
            //           ],
            //         ),
            //
            //       ],
            //     );
            //   },
            // ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
