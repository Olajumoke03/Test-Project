import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/bloc/featured_news_bloc.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/state/featured_news_state.dart';
import 'package:test_project_github/ui_component/dummy_news_details.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'news_details_screen.dart';
import 'package:html/parser.dart';


class NewsByCategoryScreen extends StatefulWidget {
  String title;
   NewsByCategoryScreen({super.key, required this.title});

  @override
  State<NewsByCategoryScreen> createState() => _NewsByCategoryScreenState();
}

class _NewsByCategoryScreenState extends State<NewsByCategoryScreen> {
  final Map<String, List<Map<String, String>>> categoryNews = {
    'Healthy': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': '5 things to know about the \'conundrum\' of lupus',
        'author': 'Matt Villano',
        'date': 'Sunday, 9 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet is the benefits of a plant-based diet so much nutrients of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet and many more benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The benefits of a plant-based diet',
        'author': 'Emma Watson',
        'date': 'Monday, 10 May 2021',
      },
    ],
    'Technology': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The future of AI in healthcare',
        'author': 'John Doe',
        'date': 'Tuesday, 11 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': '5G rollout: What you need to know',
        'author': 'Jane Smith',
        'date': 'Wednesday, 12 May 2021',
      },
    ],
    'Finance': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'Cryptocurrency: A beginner\'s guide',
        'author': 'Alex Johnson',
        'date': 'Thursday, 13 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'How to start investing in stocks',
        'author': 'Sarah Brown',
        'date': 'Friday, 14 May 2021',
      },
    ],
    'Arts': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'Virtual museums: The new norm?',
        'author': 'Emily Clark',
        'date': 'Saturday, 15 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'Street art: A form of expression',
        'author': 'Michael Lee',
        'date': 'Sunday, 16 May 2021',
      },
    ],
    'Sports': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The impact of COVID-19 on professional sports',
        'author': 'Tom Wilson',
        'date': 'Monday, 17 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'Rising stars in tennis to watch out for',
        'author': 'Lisa Anderson',
        'date': 'Tuesday, 18 May 2021',
      },
    ],
    'Business': [
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'The impact of Business on professional sports',
        'author': 'Tom Wilson',
        'date': 'Monday, 17 May 2021',
      },
      {
        'imageUrl': 'https://picsum.photos/150/150?random=',
        'title': 'Rising stars in tennis to watch out for',
        'author': 'Lisa Anderson',
        'date': 'Tuesday, 18 May 2021',
      },
    ],

  };
  late FontSizeController fontSizeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Fetch categories when the screen initializes
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.loadPreferences(); // Load selected categories from SharedPreferences

      // categoryProvider.fetchCategories();
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

    return Consumer<FontSizeController>(builder: (context, fontScale, child){

      return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title:  Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(Icons.arrow_back_outlined)),
      ),

      body: BlocBuilder<TopNewsBloc, TopNewsState>(
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
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        final newsItem = state.news[index];
                        return GestureDetector(
                          onTap: () {
                            HomeNewsModel fNM = newsItem;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailScreen(newsModel: fNM,)));
                          },
                          child:  ListView.separated(
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
                                                      widget.title,
                                                      // newsItem.categoriesString![0],
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
                                                child: newsItem.xFeaturedMediaLarge == null ?
                                                Image.asset("assets/images/logo_box.png", height: 100,width: 100,
                                                )
                                                    :

                                                CachedNetworkImage(
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
                                      height: 100,
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
                          )
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Text(
                          //     _parseHtmlString(newsItem.title?.rendered ?? ''),
                          //     style: GoogleFonts.merriweather(
                          //       fontSize: 22,
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //     maxLines: 2,
                          //     overflow: TextOverflow.ellipsis,
                          //
                          //   ),
                          // ),
                          // child: Stack(
                          //   children: [
                          //     Container(
                          //       height: 230,
                          //       width: 350,
                          //       decoration: BoxDecoration(
                          //         color: Theme.of(context).cardColor,
                          //         borderRadius: BorderRadius.circular(8.0),
                          //       ),
                          //       margin: const EdgeInsets.only(left: 10.0),
                          //
                          //       child: ClipRRect(
                          //         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          //         child:
                          //         Image.network(
                          //           newsItem.xFeaturedMediaLarge!,
                          //           height: 200,
                          //           width: 200,
                          //           fit: BoxFit.cover,
                          //           errorBuilder: (context, error, stackTrace) {
                          //             return  Image.asset("assets/images/logo_box.png", height: 200);
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //
                          //     Positioned(
                          //       // // bottom: 0.0,
                          //       // top: 118.0,
                          //       // left: 0.0,
                          //       // right: 0.0,
                          //       bottom: 0.0, left: 0.0, right: 0.0,
                          //
                          //       child: Container(
                          //         margin: const EdgeInsets.only(left: 8.0, right: 0.0),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.0),
                          //           gradient: LinearGradient(
                          //             colors: [Colors.black.withOpacity(0.8),Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.5),Colors.black.withOpacity(0.0)],
                          //             begin: Alignment.bottomCenter,
                          //             end: Alignment.topCenter,
                          //           ),
                          //         ),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Container(
                          //               padding: const EdgeInsets.all(3.0),
                          //               margin:const EdgeInsets.only(left: 8.0),
                          //               decoration: BoxDecoration(
                          //                   color: mainColor.withOpacity(0.8),
                          //                   borderRadius: BorderRadius.circular(5.0)
                          //               ),
                          //               child: GestureDetector(
                          //                 onTap: () {},
                          //                 child:  IntrinsicWidth(
                          //                   child: Text(
                          //                     newsItem.categoriesString![0],
                          //                     style: GoogleFonts.montserrat(
                          //                       fontSize: 12,
                          //                       color: Colors.white,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //
                          //             Padding(
                          //               padding: const EdgeInsets.symmetric(horizontal: 10),
                          //               child: Text(
                          //                 // "LP chieftain urges peace as court affirms Abure's NWC peace as court",
                          //                 _parseHtmlString(newsItem.title?.rendered ?? ''),
                          //                 style: GoogleFonts.merriweather(
                          //                   fontSize: 22,
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                 ),
                          //                 maxLines: 2,
                          //                 overflow: TextOverflow.ellipsis,
                          //
                          //               ),
                          //             ),
                          //
                          //             Padding(
                          //               padding: const EdgeInsets.only(left: 10.0, bottom: 10.0 ),
                          //               child:
                          //               Text(
                          //                 // "2 hours ago",
                          //                 Jiffy.parse('${newsItem.date}').fromNow(),
                          //                 style: GoogleFonts.montserrat(
                          //                     fontSize: 15,
                          //                     color: Colors.white
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
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

    );
    });
  }


  Widget _buildArticleItem(String imageUrl, String title, String author, String date) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, width: 115, height: 105, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18
                      )),
                  const SizedBox(height: 15),

                  const Text('Entertainment  • 2 hours ago', style: TextStyle(color: mainColor, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey.shade300,),

      ],
    );
  }


}