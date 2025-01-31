import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/ui_component/dummy_news_details.dart';
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
                              builder: (context) => const DummyNewsDetailScreen(
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

        ),
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