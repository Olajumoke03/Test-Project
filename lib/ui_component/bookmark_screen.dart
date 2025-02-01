// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:test_project_github/ui_component/bookmark_articles.dart';
// import 'package:test_project_github/ui_component/bookmark_video.dart';
// import 'package:test_project_github/utility/colors.dart';
//
//
// class SavedNewsScreen extends StatefulWidget {
//   const SavedNewsScreen({super.key});
//
//   @override
//   State<SavedNewsScreen> createState() => _SavedNewsScreenState();
// }
//
// class _SavedNewsScreenState extends State<SavedNewsScreen> {
//   final Map<String, List<Map<String, String>>> categoryNews = {
//     'Healthy': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': '5 things to know about the \'conundrum\' of lupus',
//         'author': 'Matt Villano',
//         'date': 'Sunday, 9 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet is the benefits of a plant-based diet so much nutrients of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet and many more benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The benefits of a plant-based diet',
//         'author': 'Emma Watson',
//         'date': 'Monday, 10 May 2021',
//       },
//     ],
//     'Technology': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The future of AI in healthcare',
//         'author': 'John Doe',
//         'date': 'Tuesday, 11 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': '5G rollout: What you need to know',
//         'author': 'Jane Smith',
//         'date': 'Wednesday, 12 May 2021',
//       },
//     ],
//     'Finance': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'Cryptocurrency: A beginner\'s guide',
//         'author': 'Alex Johnson',
//         'date': 'Thursday, 13 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'How to start investing in stocks',
//         'author': 'Sarah Brown',
//         'date': 'Friday, 14 May 2021',
//       },
//     ],
//     'Arts': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'Virtual museums: The new norm?',
//         'author': 'Emily Clark',
//         'date': 'Saturday, 15 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'Street art: A form of expression',
//         'author': 'Michael Lee',
//         'date': 'Sunday, 16 May 2021',
//       },
//     ],
//     'Sports': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The impact of COVID-19 on professional sports',
//         'author': 'Tom Wilson',
//         'date': 'Monday, 17 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'Rising stars in tennis to watch out for',
//         'author': 'Lisa Anderson',
//         'date': 'Tuesday, 18 May 2021',
//       },
//     ],
//     'Business': [
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'The impact of Business on professional sports',
//         'author': 'Tom Wilson',
//         'date': 'Monday, 17 May 2021',
//       },
//       {
//         'imageUrl': 'https://picsum.photos/150/150?random=',
//         'title': 'Rising stars in tennis to watch out for',
//         'author': 'Lisa Anderson',
//         'date': 'Tuesday, 18 May 2021',
//       },
//     ],
//
//   };
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//
//             title: Text('Saved',  style: GoogleFonts.montserrat(
//                 // color: Theme.of(context).textTheme.bodyMedium!.color,
//                 // fontSize: 7*fontSizeController.value,
//                 // fontSize: FontSize(15),
//                 fontWeight:FontWeight.w500
//             ),),
//             bottom: TabBar(
//               labelStyle: GoogleFonts.montserrat(
//                   color: Theme.of(context).textTheme.bodyMedium!.color,
//                   fontSize:15,
//                   fontWeight:FontWeight.w500
//               ),
//               indicatorColor: mainColor,
//               indicatorSize: TabBarIndicatorSize.tab,
//               overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
//
//               tabs: const [
//                 Tab( text: "Articles", ),
//                 Tab(text: "Videos")
//               ],
//             ),
//           ),
//           body: const TabBarView(
//             children:  [
//               BookmarkArticlesScreen(),
//               BookmarkVideosScreen(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildArticleItem(String imageUrl, String title, String author, String date) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child:
//               CachedNetworkImage(
//                 imageUrl: imageUrl,
//                 placeholder: (context, url) => SizedBox(
//                     height: 125,
//                     width: 248,
//                     child: Center(
//                         child: CircularProgressIndicator(
//                             color: mainColor))),
//                 errorWidget: (context, url, error) => Image.asset(
//                   "assets/images/guardian_logo.png",
//                   fit: BoxFit.contain,
//                   // height: 100,
//                   // width: 100,
//                 ),
//                 fit: BoxFit.cover,
//                 height: 100,
//                 width: 100,
//               ),
//
//               // Image.network(imageUrl, width: 115, height: 105, fit: BoxFit.cover),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(title,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w600, fontSize: 18
//                       )),
//                   const SizedBox(height: 15),
//
//                   const Text('Entertainment  • 2 hours ago', style: TextStyle(color: mainColor, fontSize: 13)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Divider(color: Colors.grey.shade300,),
//
//       ],
//     );
//   }
//
//
// }



import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/ui_component/news_details_screen.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'package:html/parser.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});


  @override
  State<StatefulWidget> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> with RouteAware {
  List<HomeNewsModel> bookmarkedNews = [];
  FontSizeController? _fontSizeController;

  Future<void> _getBookmarkedNews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedNewsStrings = prefs.getStringList('bookmarked_news') ?? [];
    setState(()  {
      bookmarkedNews =  bookmarkedNewsStrings.map((jsonString) => HomeNewsModel.fromJson(json.decode(jsonString))).toList();
    });
  }

  String _parseHtmlString(String? htmlString) {
    if (htmlString == null) return '';
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  void initState() {
    super.initState();
    _getBookmarkedNews();
    _fontSizeController = Provider.of<FontSizeController>(context, listen: false);
  }

  @override
  void didPopNext() {
    // This will be called when the top route has been popped off, such as after returning from NewsDetailsScreen
    _getBookmarkedNews();
  }


  @override
  Widget build(BuildContext context) {
    _getBookmarkedNews();

    return Consumer<FontSizeController>(
        builder: (context, fontScale, child) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                title: Text('Saved',
                  style: GoogleFonts.montserrat(
                    fontWeight:FontWeight.w500
                ),),
              ),

              body: bookmarkedNews.isEmpty
                  ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/images/bookmark.png',
                        height: 200,
                        width: 200,),

                      Text("You have no saved articles yet.",
                        style: GoogleFonts.montserrat(
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                            fontSize:15,
                            fontWeight:FontWeight.w600
                        ),),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tap the [",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                                fontSize:15,
                                fontWeight:FontWeight.w400
                            ),),
                          Icon(Icons.bookmark_outline, color: mainColor,),
                          Text("] button while reading to \n save article here.",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                                fontSize:15,
                                fontWeight:FontWeight.w400
                            ),),
                        ],
                      )
                    ],
                  )
              )

                  :
              ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 7,),
                  scrollDirection: Axis.vertical,
                  itemCount: bookmarkedNews.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    final bookmarkItem = bookmarkedNews[index];

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
                              HomeNewsModel fNM = bookmarkItem;
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
                                          bookmarkItem.categoriesString![0],
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: mainColor,
                                          ),
                                        ),
                                      ),
                                      Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            _parseHtmlString(bookmarkItem.title?.rendered ?? ''),
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
                                            Jiffy.parse('${bookmarkItem.date}').fromNow()  ,
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
                                    child: bookmarkItem.xFeaturedMediaLarge == null ?
                                    Image.asset("assets/images/logo_box.png", height: 100,width: 100,
                                    )
                                        :

                                    CachedNetworkImage(
                                      imageUrl: bookmarkItem.xFeaturedMediaLarge!,
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
              // ListView.builder(
              //   padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              //   shrinkWrap: true,
              //   reverse: true,
              //   itemCount: bookmarkedNews.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     // HomeNewsModel newsModel = HomeNewsModel.fromJson(favoritesProvider.posts[index]["item"]);
              //     return Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //       decoration: BoxDecoration(
              //         color: Theme.of(context).cardColor,
              //         borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10),
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //               color: Theme.of(context).focusColor.withOpacity(0.1),
              //               blurRadius: 5,
              //               offset: const Offset(0, 2)),
              //         ],
              //       ),
              //       child: InkWell(
              //         borderRadius: const BorderRadius.only(
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10),
              //         ),
              //         onTap: () {
              //           // Navigator.push(context, MaterialPageRoute(
              //           //   builder: (context) =>
              //           //       BlocProvider<NewsTagBloc>(
              //           //           create: (context) =>
              //           //               NewsTagBloc(repository: NewsRepository()),
              //           //           child: NewsDetails(
              //           //             newsModel: bookmarkedNews[index],)
              //           //       ),
              //           // ));
              //         },
              //         child: Row(
              //           children: <Widget>[
              //             Card(
              //               shape: const RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.all(
              //                   Radius.circular(10),
              //                 ),
              //               ),
              //               elevation: 4,
              //               child: ClipRRect(
              //                 borderRadius: const BorderRadius.all(
              //                     Radius.circular(10)),
              //                 child: CachedNetworkImage(
              //                   imageUrl: bookmarkedNews[index].xFeaturedMedia!,
              //                   placeholder: (context, url) =>
              //                       SizedBox(
              //                           height: 125,
              //                           width: 248,
              //                           child: Center(
              //                               child: CircularProgressIndicator(
              //                                   color: Theme
              //                                       .of(context)
              //                                       .primaryColor))),
              //                   errorWidget: (context, url, error) =>
              //                       Image.asset(
              //                         "assets/punchLogo.png",
              //                         fit: BoxFit.contain,
              //                         // height: 100,
              //                         // width: 100,
              //                       ),
              //                   fit: BoxFit.cover,
              //                   height: 100,
              //                   width: 100,
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(width: 10),
              //             Flexible(
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.max,
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                   Material(
              //                       type: MaterialType.transparency,
              //                       child: Html(
              //                         data: '${bookmarkedNews[index].title!
              //                             .rendered}',
              //                         style: {
              //                           "body": Style(
              //                               fontSize: FontSize(18.0),
              //                               fontWeight: FontWeight.w400,
              //                               color: Theme
              //                                   .of(context)
              //                                   .textTheme
              //                                   .bodyMedium!
              //                                   .color),
              //                         },
              //                       )),
              //                   const SizedBox(height: 10),
              //                   Row(
              //                     children: <Widget>[
              //                       Container(
              //                         constraints: const BoxConstraints(
              //                             maxWidth: 150),
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 5, vertical: 3),
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(5),
              //                           color: mainColor,
              //                         ),
              //                         child: GestureDetector(
              //                           onTap: () {
              //                             // CategoryListModel cLM = CategoryListModel();
              //                             // cLM.categoryId = bookmarkedNews[index]
              //                             //     .categories![0].toString();
              //                             // cLM.categoryName =
              //                             // bookmarkedNews[index]
              //                             //     .categoriesString![0];
              //                             // Navigator.push(context,
              //                             //     MaterialPageRoute(
              //                             //       builder: (context) =>
              //                             //           BlocProvider<
              //                             //               NewsByCategoryBloc>(
              //                             //               create: (context) =>
              //                             //                   NewsByCategoryBloc(
              //                             //                       repository: NewsRepository()),
              //                             //               child: NewsByCategory(
              //                             //                 model: cLM,)
              //                             //           ),
              //                             //     ));
              //                           },
              //                           child: Text(
              //                             bookmarkedNews[index]
              //                                 .categoriesString![0].replaceAll(
              //                                 "&amp;", "&"),
              //                             style: TextStyle(
              //                               fontSize: 4.5 *
              //                                   _fontSizeController!.value,
              //                               color: Colors.white,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                       const Spacer(),
              //                       Container(
              //                         padding: const EdgeInsets.only(left: 5),
              //                         child: Text(
              //                             Jiffy.parse(
              //                                 '${bookmarkedNews[index].date}')
              //                                 .fromNow(),
              //                             style: TextStyle(
              //                                 fontSize: 4 *
              //                                     _fontSizeController!.value,
              //                                 color: Theme
              //                                     .of(context)
              //                                     .textTheme
              //                                     .bodyMedium!
              //                                     .color)),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // )

          );
        }
    );

  }
}
