import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/settings_screen.dart';
import 'package:test_project_github/state/home_news_state.dart';
import 'package:test_project_github/ui_component/news_by_category.dart';
import 'package:test_project_github/ui_component/notification_screen.dart';
import 'package:test_project_github/ui_component/search_screen.dart';

import '../event/home_news_event.dart';


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

  @override
  void initState() {
    super.initState();
    // Fetch categories when the screen initializes
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.fetchCategories();
    });

  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Show loading indicator while categories are being fetched
    if (categoryProvider.categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return DefaultTabController(
      length: categoryProvider.selectedCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo_box.png', width: 170, height: 50),
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

            IconButton (
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context)=>
                    const SearchScreen()
                  )
                );
              } ,
              icon: Center(
                child: Icon (
                    Icons.search , size: 25,
                    color: Theme.of(context).textTheme.bodyMedium!.color
                ),
              ) ,
            ),


            IconButton (
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
              } ,
              icon: Center(
                child: Icon (
                    Icons.notifications_none_outlined , size: 25,
                    color: Theme.of(context).textTheme.bodyMedium!.color
                ),
              ) ,
            ),
          ],

          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: categoryProvider.selectedCategories.map((categoryId) {
              // Find the category in the loaded categories list
              final category = categoryProvider.categories.firstWhere(
                    (cat) => cat.categoryId == categoryId,
                orElse: () => CategoryListModel(
                  categoryId: categoryId,
                  categoryName: 'Loading...',
                ),
              );

              return Tab(
                text: '${category.categoryName ?? 'Loading...'} ($categoryId)',
              );
            }).toList(),
          ),
        ),

        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(height: 50,),
              Container(
                height: 100,
                child: Image.asset('assets/images/logo_box.png', width: 200, height: 70),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: menuItems.length,
                itemBuilder: (context, index) {

                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                        minTileHeight: 10.0,
                        trailing: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.grey[800]
                        ),
                        title: Text(
                          menuItems[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsByCategoryScreen(
                                  title: menuItems[index]
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        indent: 15.0,
                        endIndent: 15.0,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),


              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('News',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //     // style: GoogleFonts.mont(
              //     //     fontWeight: FontWeight.bold,
              //     //     fontSize: 18)
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              //
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Opinion',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              //
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Lifestyle',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Sport',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Business',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              //
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Technology',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              //
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Woman',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Guardian Life',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Guardian Arts',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),
              //
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   minTileHeight: 10.0,
              //   trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[800],),
              //   title: const Text('Newsletter',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              //   onTap: () {},
              // ),
              //
              // const Divider(indent: 15.0, endIndent: 15.0, color: Colors.grey,),

            ],
          ),
        ),


        body: TabBarView(
          children: categoryProvider.selectedCategories.map((categoryId) {
            return NewsListScreen(categoryId: categoryId);
          }).toList(),
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
            child: ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final newsItem = state.news[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      newsItem.title!.rendered!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(newsItem.categoriesString![0]),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}


// class NewsListScreen extends StatelessWidget {
//   final String categoryId;
//
//   const NewsListScreen({Key? key, required this.categoryId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsBloc, NewsState>(
//       builder: (context, state) {
//         if (state is NewsLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (state is NewsError) {
//           return Center(child: Text(state.message));
//         }
//         if (state is NewsLoaded) {
//           print("news list: " + state.news.length.toString());
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: state.news.length,
//             itemBuilder: (context, index) {
//               final newsItem = state.news[index];
//               return ListTile(
//                 title: Text(newsItem.title!.rendered!),
//                 subtitle: Text(newsItem.date!),
//               );
//             },
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }