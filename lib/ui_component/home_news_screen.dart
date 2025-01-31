


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/bloc/featured_news_bloc.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/event/home_news_event.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/ui_component/dummy_news_details.dart';
import 'package:test_project_github/state/featured_news_state.dart';
import 'package:test_project_github/state/home_news_state.dart';
import 'package:test_project_github/ui_component/news_by_category.dart';
import 'package:test_project_github/ui_component/news_details_screen.dart';
import 'package:test_project_github/ui_component/notification_screen.dart';
import 'package:test_project_github/ui_component/search_screen.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:html/parser.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({super.key});

  @override
  _HomeNewsScreenState createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> with SingleTickerProviderStateMixin {

  TabController? _tabController;


  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.loadPreferences().then((_) {
        setState(() {
          _tabController = TabController(
              length: categoryProvider.selectedCategories.length,
              vsync: this,
              initialIndex: 0
          );
        });
      });
    });
  }

  // void initState() {
  //   super.initState();
  //   // Fetch categories when the screen initializes
  //   Future.delayed(Duration.zero, () {
  //     final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
  //     // categoryProvider.loadPreferences(); // Load selected categories from SharedPreferences
  //     // Initialize the controller here with the correct length
  //     _tabController = TabController(
  //         length: categoryProvider.loadPreferences().l,
  //         vsync: this,
  //         initialIndex: 0
  //     );
  //     // Listen for tab changes
  //     _tabController!.addListener(() {
  //       setState(() {});
  //     });
  //
  //     //to fetch categories from endpoint
  //     // categoryProvider.fetchCategories();
  //   });
  //
  //
  //
  // }

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
            // IconButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SettingsScreen()),
            //     );
            //   },
            //   icon: const Icon(Icons.settings),
            // ),
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

            // IconButton(
            //   icon: const Icon(Icons.refresh),
            //   onPressed: () {
            //     context.read<TopNewsBloc>().add(RefreshTopNewsEvent());
            //   },
            // ),
          ],
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
                      return const Center(child: CircularProgressIndicator(color: mainColor,));
                    }

                    if (state is TopNewsErrorState) {
                      return Center(child: Text(state.message));
                    }

                    if (state is TopNewsLoadedState) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          // context.read<TopNewsBloc>().add(RefreshTopNewsEvent());
                        },
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            child: InkWell(
                              onTap: (){},
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.news.length,
                                itemBuilder: (context, index) {
                                final newsItem = state.news[index];
                                  return GestureDetector(
                                    onTap: () {
                                      HomeNewsModel fNM = newsItem;
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailScreen(newsModel: fNM,)));
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
                                            child: newsItem.xFeaturedMediaLarge == null ?
                                            Image.asset("assets/images/logo_box.png", height: 200)
                                            :Image.network(
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
                                          // // bottom: 0.0,
                                          // top: 118.0,
                                          // left: 0.0,
                                          // right: 0.0,
                                          bottom: 0.0, left: 0.0, right: 0.0,

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
                                                    // "LP chieftain urges peace as court affirms Abure's NWC peace as court",
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
                                                  Text(
                                                    // "2 hours ago",
                                                    Jiffy.parse('${newsItem.date}').fromNow(),
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
                        controller: _tabController,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.transparent,
                      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      isScrollable: true,
                      padding: const EdgeInsets.only(left: 10.0),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 7,),
                      labelColor: Colors.black,

                      tabs: [
                        ...categoryProvider.selectedCategories.map((categoryId) {
                          final category = categoryProvider.categories.firstWhere(
                                (cat) => cat.categoryId == categoryId,
                            orElse: () => CategoryListModel(
                              categoryId: categoryId,
                              categoryName: 'Loading...',
                            ),
                          );

                          final index = categoryProvider.selectedCategories.indexOf(categoryId);
                          final isSelected = _tabController!.index == index;

                          return Tab(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? mainColor.withOpacity(0.3): Colors.white,
                                border: Border.all( color: isSelected? Colors.transparent: Colors.black),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (isSelected) Icon(Icons.check, size: 15),
                                  SizedBox(width: isSelected ? 4 : 0),
                                  Text(category.categoryName ?? 'Loading...'),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ]
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController!,

                        children: [

                          ...categoryProvider.selectedCategories.map((categoryId) =>
                              NewsListScreen(categoryId: categoryId)
                          ).toList(),
                        ],
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

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

}


// Modified NewsListScreen
class NewsListScreen extends StatefulWidget {
  final String categoryId;

  const NewsListScreen({Key? key, required this.categoryId, }) : super(key: key);

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
          return const Center(child: CircularProgressIndicator(color: mainColor));
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
                            HomeNewsModel fNM = newsItem;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailScreen(newsModel: fNM,)));

                            // Navigator.push ( context ,
                            //     MaterialPageRoute(
                            //       builder: (context) =>  BlocProvider<NewsTagBloc> (
                            //           create: (context) => NewsTagBloc (repository: NewsRepository ()) ,
                            //           child: NewsDetails ( newsModel: fNM , )
                            //       ) ,
                            //     )
                            // );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const NewsDetailScreen(
                            //       imageUrl: 'https://picsum.photos/150/150?random=',
                            //       title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
                            //       author: 'Andy Corbley',
                            //       timeAgo: '1hr ago',
                            //       comments: 8,
                            //       likes: 34,
                            //     ),
                            //   ),
                            // );
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
                                        // "Nigeria",
                                        newsItem.categoriesString![0],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        // "LP chieftain urges peace as court affirms Abure's NWC peace as court",
                                        _parseHtmlString(newsItem.title?.rendered ?? ''),
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
                                          // "2 hours ago" ,
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
                                  child:
                                  newsItem.xFeaturedMediaLarge == null ?
                                  Image.asset("assets/images/logo_box.png", height: 100, width: 100,)
                                      :CachedNetworkImage(
                                    imageUrl: newsItem.xFeaturedMediaLarge!,
                                    placeholder: (context, url) => const SizedBox(
                                        height: 100, width: 100,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                                color: mainColor))),
                                    errorWidget: (context, url, error) => Image.asset(
                                      "assets/images/guardian_logo.png",
                                      fit: BoxFit.contain,
                                      // height: 100,
                                      // width: 100,
                                    ),
                                    fit: BoxFit.cover,
                                    height: 100, width: 100,
                                  ),
                                  // Image.asset('assets/images/image.jpg', height: 100, width: 100,),
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
          );
        }

        return const SizedBox();
      },
    );
  }
}
