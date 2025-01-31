import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'package:test_project_github/utility/text_size_seekbar.dart';
import 'package:test_project_github/widgets/custom_alert_dialog.dart';

class NewsDetailScreen extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? author;
  final String? timeAgo;
  final int? comments;
  final int? likes;
  final HomeNewsModel? newsModel;


  const NewsDetailScreen({
    super.key,
     this.imageUrl,
     this.title,
     this.author,
     this.timeAgo,
     this.comments,
     this.likes,
    this.newsModel
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {

  late FontSizeController _fontSizeController;
  fontDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
          child:   const ChangeTextSizeWithSeekBar()
      ),
    );
  }

  @override
  void initState() {
    _fontSizeController = Provider.of<FontSizeController>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FontSizeController>(
      builder: (context,  fontScale,  child) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: Image.asset('assets/images/guardian_logo.png', width: 170, height: 50),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Theme.of(context).textTheme.bodyMedium!.color,),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon:  Icon(Icons.bookmark_border, color: Theme.of(context).textTheme.bodyMedium!.color,),
                onPressed: () {},
              ),
              IconButton(
                icon:  Icon(Icons.share, color: Theme.of(context).textTheme.bodyMedium!.color,),
                onPressed: () {},
              ),
            ],
          ),


          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0,),

                  GestureDetector(
                    onTap: () {},
                    child:  Text(
                     widget.newsModel == null? "   NIGERIA" :  "  ${widget.newsModel!.categoriesString![0]}",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: mainColor,
                      ),

                    ),
                  ),

                  const SizedBox(height: 5.0,),

                  // Text(
                  //   "CAF Ruling: FG denies harassment of Nigerians in Libya",
                  //   style: GoogleFonts.merriweather(
                  //       fontSize: 25, fontWeight: FontWeight.w400
                  //   ),
                  // ),
                  Material (
                      type: MaterialType.transparency ,
                      child: Html(
                        // data:  '${widget.newsModel!.title!.rendered}',
                        data: widget.newsModel == null? 'LP Chieftain title: release report report report'
                            : widget.newsModel!.title!.rendered!,
                        style: {
                          "body": Style(
                              fontSize: FontSize(20.0),
                              fontWeight: FontWeight.w500,
                              color:Theme.of(context).textTheme.bodyLarge!.color,
                              fontFamily: GoogleFonts.merriweather().fontFamily,

                      ),
                        },
                      )
                  ) ,


                  const SizedBox(height: 5),
                  // Text('2 hours ago | 4 min read',
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 14,
                  //     color: Colors.grey[600],
                  //   ),
                  //   // style: TextStyle(color: Colors.grey, fontSize: 13)
                  // ),

                  Row(
                    children: [
                      Text(
                        widget.newsModel == null? '  Owede Agbajileke' : "  ${widget.newsModel!.xAuthor}",
                        style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: homePageBlue,
                    ),),

                    Text("  |  ", style: TextStyle(color: Colors.grey)),
                      Text(  widget.newsModel == null? "2 hours ago" :
                        Jiffy.parse('${widget.newsModel!.date}').fromNow()  ,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      // Text(
                      //     '2 hours ago',
                      //   style: GoogleFonts.montserrat(
                      //     fontSize: 14,
                      //     color: Colors.grey[600],
                      //   ),
                      // )
                    ],
                  ),



                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: Row(
                  //     children: [
                  //       CircleAvatar(
                  //         backgroundImage: const NetworkImage('https://picsum.photos/200'),
                  //         radius: 20,
                  //         backgroundColor: mainColor.withOpacity(0.3),
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text('By $author' ', $timeAgo', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: mainColor)),
                  //           // Text(timeAgo, style: const TextStyle(color: mainColor)),
                  //         ],
                  //       ),
                  //       const Spacer(),
                  //
                  //       Container(
                  //         constraints: const BoxConstraints(maxWidth: 150),
                  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(5),
                  //             color: mainColor.withOpacity(0.05),
                  //             border: Border.all(color: mainColor)
                  //         ),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //           },
                  //           child: const Text(
                  //             "Entertainment",
                  //             style: TextStyle(
                  //               fontSize: 12,
                  //               color: mainColor,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       //   Icon(Icons.watch_later_outlined, color: mainColor, size: 15,),
                  //       //   Text(timeAgo, style: const TextStyle(color: mainColor)),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 5),

                  Container(
                    child: ClipRRect(
                      child:
                      widget.newsModel == null?  Image.asset('assets/images/image.jpg',
                        fit: BoxFit.cover,
                          width: double.infinity,
                          height: 280,)
                      : CachedNetworkImage(
                        imageUrl: widget.newsModel!.xFeaturedMediaLarge!,
                        placeholder: (context, url) => const SizedBox(
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
                        height: 250,
                        width: double.infinity,
                      ),

                      // Image.network(
                      //   imageUrl,
                      //   width: double.infinity,
                      //   height: 300,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),

                  const SizedBox(height: 20),


                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: Row(
                  //     children: [
                  //       const Icon(Icons.comment, size: 16),
                  //       const SizedBox(width: 4),
                  //       Text('$comments comments'),
                  //       const SizedBox(width: 16),
                  //       const Icon(Icons.favorite, size: 16),
                  //       const SizedBox(width: 4),
                  //       Text('$likes likes'),
                  //       const SizedBox(width: 16),
                  //       const Icon(Icons.share, size: 16),
                  //       const SizedBox(width: 4),
                  //       const Text('Share'),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 16),


                  // Material (
                  //     type: MaterialType.transparency ,
                  //     child: Html(
                  //       data:  '${widget.newsModel!.content!.rendered}',
                  //       style: {
                  //         "body": Style(
                  //             fontSize: FontSize(18.0),
                  //             fontWeight: FontWeight.w500,
                  //             color:Theme.of(context).textTheme.bodyLarge!.color,
                  //             fontFamily: GoogleFonts.dmSans().fontFamily,
                  //
                  //     ),
                  //       },
                  //     )
                  // ) ,

                  widget.newsModel == null? ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        'When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                        ),                  ),
                      const SizedBox(height: 16),
                      Container(
                          height: 270,
                          margin: const EdgeInsets.only(top: 10.0) ,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(color: Colors.grey[200], height: 250, width: MediaQuery.of(context).size.width,
                                child: Text('Advertisement', style: TextStyle(color: Colors.grey[700]),),
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                       Text(
                        'This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to spend the winter on the California coast.',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                        ),                  ),
                      const SizedBox(height: 16),

                      Text(
                        "It's expected that the monarch butterfly will be...",
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                        ),                  ),
                       Text(
                        'When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                        ),                  ),
                      const SizedBox(height: 16),
                       Text(
                        'This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to spend the winter on the California coast.',
                         style: GoogleFonts.dmSans(
                           fontSize: 18,
                         ),                  ),
                      const Text(
                        'When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.',
                        style: TextStyle(fontSize: 18),
                      ),
                       const SizedBox(height: 16),
                       Text(
                        'This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to spend the winter on the California coast.',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                        ),                  ),
                      const SizedBox(height: 16),
                       Text(
                        "It's expected that the monarch butterfly will be...",
                         style: GoogleFonts.dmSans(
                           fontSize: 18,
                         ),                  ),
                       const SizedBox(height: 16),
                    ],
                  )
                      :
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.newsModel!.articleSplit!.length,
                      itemBuilder: (BuildContext context , int index) {
                        return Html (
                          data: widget.newsModel!.articleSplit![index].toString(),
                          style: {
                            "body": Style(
                                fontSize:  FontSize(10*_fontSizeController.value),
                                fontWeight: FontWeight.w400,
                                color:Theme.of(context).textTheme.bodyMedium!.color
                            ),
                          },
                        );
                      },


                      separatorBuilder: ( context, index) {
                        if ((index + 1) % 5 == 0) {
                          return Container(
                              height: 150,
                              margin: const EdgeInsets.only(top: 10.0) ,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      child: Text('Advertisement', style: TextStyle(color: Colors.grey[700]),)),
                                ],
                              ));
                          // return getAd();
                        } else {
                          return Container();
                        }
                      }
                  ),

                ],
              ),
            ),
          ),

        );
      }
    );
  }
}