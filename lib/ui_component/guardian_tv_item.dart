import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_github/ui_component/news_by_category.dart';
import 'package:test_project_github/ui_component/news_details_screen.dart';
import 'package:test_project_github/utility/colors.dart';


class GuardianTvItem extends StatefulWidget {
  const GuardianTvItem({super.key});

  @override
  State<GuardianTvItem> createState() => _GuardianTvItemState();
}

class _GuardianTvItemState extends State<GuardianTvItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only( top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Stories',
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
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

            Container(
              height: 275,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: InkWell(
                    onTap: (){
                      // HomeNewsModel fNM = featuredNewsModel[0];
                      // Navigator.push ( context ,
                      //     MaterialPageRoute(
                      //       builder: (context) =>  BlocProvider<NewsTagBloc> (
                      //           create: (context) => NewsTagBloc (repository: NewsRepository ()) ,
                      //           child: NewsDetails ( newsModel: fNM , )
                      //       ) ,
                      //     )
                      // );
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
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

                          child: Container(
                            height: 300,
                            width: 300,
                            margin: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                      ),
                                      child: Image.asset(
                                        'assets/images/image.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Positioned.fill(
                                        child: Center(
                                            child: ClipOval(
                                              child: Card(
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50), // Half of the width/height for a perfect circle
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.all(10.0),
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white
                                                  ),
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.grey[800],
                                                    size: 40,),
                                                ),
                                              ),
                                            )))
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                                  child: Text("JAMB releases 36,540 out of 64,000 withheld results",
                                    style: GoogleFonts.merriweather(
                                      color: Theme.of(context).textTheme.bodyMedium!.color,
                                      fontSize: 18,
                                      fontWeight:FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(left: 0.0, right: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child:  IntrinsicWidth(
                                          child: Text(
                                            "ENTERTAINMENT ",
                                            // featuredNewsModel[index].categoriesString![0].replaceAll("&amp;", "&"),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: mainColor
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text("•", style: TextStyle(fontSize: 20, color: Colors.grey[400]

                                      ),),

                                      Text(
                                        " 2 hours ago",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                          color: Colors.grey[600]
                                        ),
                                      ),

                                      const Spacer(),

                                      Icon(Icons.bookmark_outline, color: Colors.grey[600],),
                                      const SizedBox(width: 10.0,),
                                      Transform.rotate(
                                        angle: - pi /2,
                                          child: Icon(Icons.logout, color: Colors.grey[600], )),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ),
            ),

            Divider(color: Colors.grey,),

            Text(
              'Latest Stories',
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
              ),
            ),

            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
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

                  child: Container(
                    // height: 300,
                    // width: 300,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    IntrinsicWidth(
                      child: Text(
                        "ENTERTAINMENT ",
                        // featuredNewsModel[index].categoriesString![0].replaceAll("&amp;", "&"),
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: mainColor
                        ),
                      ),
                    ),
                        const SizedBox(height: 5.0,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text("JAMB releases 36,540 out of 64,000 withheld results",
                                      style: GoogleFonts.merriweather(
                                        color: Theme.of(context).textTheme.bodyMedium!.color,
                                        fontSize: 18,
                                        fontWeight:FontWeight.w500,
                                      ),
                                      // maxLines: 2,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Image.asset(
                                    'assets/images/image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Positioned.fill(
                                    child: Center(
                                        child: ClipOval(
                                          child: Card(
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40), // Half of the width/height for a perfect circle
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(5.0),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                              ),
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.grey[800],
                                                size: 20,),
                                            ),
                                          ),
                                        )))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0,),

                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: Text('13 mins', style: GoogleFonts.montserrat(
                                    color: homePageBlue,
                                  fontSize: 12
                                ),)
                            ),

                            Text("  |  ", style: TextStyle(fontSize: 12, color: Colors.grey[400],

                            ),),

                            Text(
                              "2 hours ago",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.grey[600]
                              ),
                            ),

                            const Spacer(),

                            Icon(Icons.bookmark_outline, color: Colors.grey[600],),
                            const SizedBox(width: 15.0,),
                            Transform.rotate(
                                angle: - pi /2,
                                child: Icon(Icons.logout, color: Colors.grey[600], ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
