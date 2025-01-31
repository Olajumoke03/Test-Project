import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_github/ui_component/bookmark_articles.dart';
import 'package:test_project_github/ui_component/bookmark_video.dart';
import 'package:test_project_github/utility/colors.dart';


class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
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



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(

            title: Text('Saved',  style: GoogleFonts.montserrat(
                // color: Theme.of(context).textTheme.bodyMedium!.color,
                // fontSize: 7*fontSizeController.value,
                // fontSize: FontSize(15),
                fontWeight:FontWeight.w500
            ),),
            bottom: TabBar(
              labelStyle: GoogleFonts.montserrat(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize:15,
                  fontWeight:FontWeight.w500
              ),
              indicatorColor: mainColor,
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),

              tabs: const [
                Tab( text: "Articles", ),
                Tab(text: "Videos")
              ],
            ),
          ),
          body: const TabBarView(
            children:  [
              BookmarkArticlesScreen(),
              BookmarkVideosScreen(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildArticleItem(String imageUrl, String title, String author, String date) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => SizedBox(
                    height: 125,
                    width: 248,
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
                height: 100,
                width: 100,
              ),

              // Image.network(imageUrl, width: 115, height: 105, fit: BoxFit.cover),
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