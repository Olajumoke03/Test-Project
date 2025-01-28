import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'news_details_screen.dart';


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
  Widget build(BuildContext context) {
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 7,),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              // itemCount: homeNewsModel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, pos) {
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
                                    onTap: () {
                                    },
                                    child: Text(
                                      "ENTERTAINMENT",
                                      // homeNewsModel[pos].categoriesString![0].replaceAll("&amp;", "&"),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        // fontSize: 4.5 * fontSizeController.value,
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    type: MaterialType.transparency,
                                    child:
                                    Text("LP chieftain urges peace as court affirms Abure's NWC peace as court",
                                      style: GoogleFonts.merriweather(
                                          color: Theme.of(context).textTheme.bodyMedium!.color,
                                          fontSize: 18,
                                          // fontSize: 7.5*fontSizeController.value,
                                          // fontSize: FontSize(15),
                                          fontWeight:FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text('2 hours ago | 4 min read',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                    // style: TextStyle(color: Colors.grey, fontSize: 13)
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
                                child: Hero(
                                  tag: pos,
                                  child: Image.asset('assets/images/image.jpg', height: 100, width: 100,),
                                ),
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
          // ListView.separated(
          //     padding: const EdgeInsets.symmetric(horizontal: 7,),
          //     scrollDirection: Axis.vertical,
          //     itemCount: 10,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (ctx, pos) {
          //       return          Column(
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => const NewsDetailScreen(
          //                     imageUrl: 'https://picsum.photos/150/150?random=',
          //                     title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
          //                     author: 'Andy Corbley',
          //                     timeAgo: '1hr ago',
          //                     comments: 8,
          //                     likes: 34,
          //                   ),
          //                 ),
          //               );
          //             },
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     const Expanded(
          //                       child: Text('The benefits of a plant-based diet is the benefits of a plant-based diet so much nutrients of a plant-based diet',
          //                           style: TextStyle(
          //                               fontWeight: FontWeight.w600, fontSize: 17
          //                           )),
          //                     ),
          //                     const SizedBox(width: 10),
          //
          //                     ClipRRect(
          //                       borderRadius: BorderRadius.circular(2),
          //                       child: Image.asset('assets/images/image.jpg', height: 100, width: 100,),
          //
          //       // CachedNetworkImage(
          //                       //   imageUrl: 'https://picsum.photos/150/150?random=',
          //                       //   placeholder: (context, url) => SizedBox(
          //                       //       height: 125,
          //                       //       width: 248,
          //                       //       child: Center(
          //                       //           child: CircularProgressIndicator(
          //                       //               color: mainColor))),
          //                       //   errorWidget: (context, url, error) => Image.asset(
          //                       //     "assets/images/guardian_logo.png",
          //                       //     fit: BoxFit.contain,
          //                       //     // height: 100,
          //                       //     // width: 100,
          //                       //   ),
          //                       //   fit: BoxFit.cover,
          //                       //   height: 100,
          //                       //   width: 100,
          //                       // ),
          //                       // Image.network('https://picsum.photos/150/150?random=', width: 115, height: 105, fit: BoxFit.cover),
          //                     ),
          //                   ],
          //                 ),
          //                const Text('Entertainment  • 2 hours ago', style: TextStyle(color: mainColor, fontSize: 13)),
          //
          //               ],
          //             ),
          //           ),
          //           Divider(color: Colors.grey.shade300,),
          //
          //         ],
          //       );
          //     },
          //     separatorBuilder: (context, index) {
          //       if (index % 5 == 0) {
          //         return  Center(
          //           child: Container(
          //               height: 270,
          //               margin: const EdgeInsets.only(top: 10.0) ,
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text('Advertisement', style: TextStyle(color: Colors.grey[700]),),
          //                   Container(height: 150,),
          //                 ],
          //               )),
          //         );
          //       } else {
          //         return Container();
          //       }
          //     }
          // ),
        ),
      ),


      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => NewsDetailScreen(
      //                 imageUrl: 'https://picsum.photos/150/150?random=$index',
      //                 title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
      //                 author: 'Andy Corbley',
      //                 timeAgo: '1hr ago',
      //                 comments: 8,
      //                 likes: 34,
      //               ),
      //             ),
      //           );
      //         },
      //         child: ListView.separated(
      //             padding: const EdgeInsets.symmetric(horizontal: 7,),
      //             scrollDirection: Axis.vertical,
      //             itemCount: 10,
      //             shrinkWrap: true,
      //             physics: const NeverScrollableScrollPhysics(),
      //             itemBuilder: (ctx, pos) {
      //               return Container(
      //                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //                 decoration: BoxDecoration(
      //                   color: Theme.of(context).cardColor,
      //                   borderRadius: const BorderRadius.only(
      //                     topLeft: Radius.circular(10),
      //                     topRight: Radius.circular(10),
      //                   ),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         color: Theme.of(context).focusColor.withOpacity(0.1),
      //                         blurRadius: 5,
      //                         offset: const Offset(0, 2)),
      //                   ],
      //                 ),
      //                 child: InkWell(
      //                   borderRadius: const BorderRadius.only(
      //                     topLeft: Radius.circular(10),
      //                     topRight: Radius.circular(10),
      //                   ),
      //                   onTap: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => NewsDetailScreen(
      //                           imageUrl: 'https://picsum.photos/150/150?random=$index',
      //                           title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
      //                           author: 'Andy Corbley',
      //                           timeAgo: '1hr ago',
      //                           comments: 8,
      //                           likes: 34,
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                   child: Row(
      //                     children: <Widget>[
      //                       Card(
      //                         shape: const RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.all(
      //                             Radius.circular(10),
      //                           ),
      //                         ),
      //                         elevation: 4,
      //                         child: ClipRRect(
      //                           borderRadius: const BorderRadius.all(Radius.circular(10)),
      //                           child: Hero(
      //                             tag: pos,
      //                             child:
      //                             Image.network(
      //                               'https://picsum.photos/50/50?random=${index + 10}',
      //                               width: 100,
      //                               height: 100,
      //                               fit: BoxFit.cover,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       const SizedBox(width: 10),
      //                       Flexible(
      //                         child: Column(
      //                           mainAxisSize: MainAxisSize.max,
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: <Widget>[
      //                             const Material(
      //                                 type: MaterialType.transparency,
      //                                 child:Text("Monarch population soars 4,900 percent since last year in thrilling 2021 western migration",
      //                                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
      //                             const SizedBox(height: 10),
      //                             Row(
      //                               children: <Widget>[
      //                                 Container(
      //                                   constraints: const BoxConstraints(maxWidth: 150),
      //                                   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      //                                   decoration: BoxDecoration(
      //                                     borderRadius: BorderRadius.circular(5),
      //                                     color: mainColor,
      //                                   ),
      //                                   child: GestureDetector(
      //                                     onTap: () {
      //                                     },
      //                                     child: const Text(
      //                                       "Metro",
      //                                       style: TextStyle(
      //                                         fontSize: 16,
      //                                         color: whiteColor,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 const Spacer(),
      //                                 Container(
      //                                   padding: const EdgeInsets.only(left: 5),
      //                                   child: Text(
      //                                       Jiffy.parse('1997/09/23').fromNow(),
      //                                       style: const TextStyle(
      //                                           fontSize: 15,
      //                                           color: mainColor)),
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             },
      //             separatorBuilder: (context, index) {
      //               if (index % 5 == 0) {
      //                 return  Container(
      //                     height: 270,
      //                     margin: const EdgeInsets.only(top: 10.0) ,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text('Advertisement', style: TextStyle(color: Colors.grey[700]),),
      //                       ],
      //                     ));
      //               } else {
      //                 return Container();
      //               }
      //             }
      //         )
      //       // ListTile(
      //       //   leading: ClipRRect(
      //       //     borderRadius: BorderRadius.circular(8),
      //       //     child: Image.network(
      //       //       'https://picsum.photos/50/50?random=${index + 10}',
      //       //       width: 50,
      //       //       height: 50,
      //       //       fit: BoxFit.cover,
      //       //     ),
      //       //   ),
      //       //   title: Text("LP chieftain urges peace as court affirms Abure's NWC",
      //       //   ),
      //       //   subtitle: Text('Description for item ${index + 1}'),
      //       // ),
      //     );
      //   },
      // ),
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