import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'package:test_project_github/utility/text_size_seekbar.dart';
import 'package:test_project_github/widgets/custom_alert_dialog.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsDetailScreen extends StatefulWidget {
  final HomeNewsModel? newsModel;

  const NewsDetailScreen({super.key, this.newsModel});

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

  String _parseHtmlString(String? htmlString) {
    if (htmlString == null) return '';
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  bool isBookmarked = false;
  void _toggleBookmark(HomeNewsModel news) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isBookmarked = !isBookmarked;
    });

    List<String>? bookmarkedNews = prefs.getStringList('bookmarked_news') ?? [];

    if (isBookmarked) {
      bookmarkedNews.add(json.encode(news));
      _checkBookmarkStatus();
    } else {
      bookmarkedNews.remove(json.encode(news));
      _checkBookmarkStatus();
    }
    prefs.setStringList('bookmarked_news', bookmarkedNews);
  }

  Future<void> _checkBookmarkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedNews = prefs.getStringList('bookmarked_news') ?? [];
    setState(() {
      isBookmarked = bookmarkedNews.contains(json.encode(widget.newsModel!));
    });
  }



  Future<void> _shareNews() async {
    try {
      final String shareText = 'Check out this interesting story on Guardian News:\n'
          '${widget.newsModel!.title!.rendered}\n\n'
          'http://guardian.ng/${widget.newsModel!.slug}';

      await Share.share(
        shareText,
        subject: widget.newsModel!.title!.rendered,
      );
    } catch (e) {
      debugPrint('Error sharing news: $e');
    }
  }




  @override
  void initState() {
    _fontSizeController = Provider.of<FontSizeController>(context, listen: false);

    _checkBookmarkStatus();

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
                icon: Icon(
                  isBookmarked ?
                  Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked?
                  mainColor : Theme.of ( context ).iconTheme.color ,
                ),
                onPressed: () {
                  _toggleBookmark(widget.newsModel!);
                },
              ),

              IconButton(
                icon:  Icon(Icons.share, color: Theme.of(context).textTheme.bodyMedium!.color,),
                onPressed: () async{

                  _shareNews();

                    // try {
                    //   await Share.share('Test sharing');
                    // } catch (e) {
                    //   print('Error share: $e');
                    // }

                  // FlutterShare.share(
                  //   title: 'Guardian News' ,
                  //   text: '${widget.newsModel!.title!.rendered}'
                  //       .replaceAll (r"\n" , "\n" ).replaceAll ( r"\r" , "" )
                  //       .replaceAll ( r"\'" , "'" ).replaceAll ( "<p>" , "" )
                  //       .replaceAll ("&#8217;" , "'" ).replaceAll ("&#038;" , "&" )
                  //       .replaceAll ("&#8216;" , "‘" ).replaceAll("&#8211;", "-"),
                  //   linkUrl:'https://guardian.ng/' '${widget.newsModel!.slug} ',
                  //   // chooserTitle: 'Something for chooser title',
                  // );

                  // Share.share(
                  //     'Read: ${widget.newsModel!.slug} on Guardian News',
                  //     subject: '${widget.newsModel!.title!.rendered}'.replaceAll (r"\n" , "\n" ).replaceAll ( r"\r" , "" )
                  //         .replaceAll ( r"\'" , "'" ).replaceAll ( "<p>" , "" )
                  //         .replaceAll ("&#8217;" , "'" ).replaceAll ("&#038;" , "&" )
                  //         .replaceAll ("&#8216;" , "‘" ).replaceAll("&#8211;", "-"),
                  //
                  // );
                },
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
                     "  ${widget.newsModel!.categoriesString![0]}",
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
                      child:

                      Text(_parseHtmlString(widget.newsModel!.title!.rendered),
                      style: GoogleFonts.merriweather(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color:Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      ),

                      // Html(
                      //   // data:  '${widget.newsModel!.title!.rendered}',
                      //   data: widget.newsModel == null? 'LP Chieftain title: release report report report'
                      //       : widget.newsModel!.title!.rendered!,
                      //   style: {
                      //     "body": Style(
                      //         fontSize: FontSize(20.0),
                      //         fontWeight: FontWeight.w500,
                      //         color:Theme.of(context).textTheme.bodyLarge!.color,
                      //         fontFamily: GoogleFonts.merriweather().fontFamily,
                      //
                      // ),
                      //   },
                      // )
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
                      Text("  ${widget.newsModel!.xAuthor}",
                        style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: homePageBlue,
                    ),),

                    Text("  |  ", style: TextStyle(color: Colors.grey)),
                      Text(Jiffy.parse('${widget.newsModel!.date}').fromNow()  ,
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
                      child: widget.newsModel!.xFeaturedMediaLarge == null ?
                      Image.asset("assets/images/logo_box.png", height: 250,width: double.infinity,
                      )
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

                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.newsModel!.articleSplit!.length,
                      itemBuilder: (BuildContext context , int index) {
                        return Text( _parseHtmlString(widget.newsModel!.articleSplit![index].toString()),
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                          ),
                        );
                        // Text(widget.newsModel!.articleSplit![index].toString());

                        // Html (
                        //   data: widget.newsModel!.articleSplit![index].toString(),
                        //   style: {
                        //     "body": Style(
                        //         fontSize:  FontSize(10*_fontSizeController.value),
                        //         fontWeight: FontWeight.w400,
                        //         color:Theme.of(context).textTheme.bodyMedium!.color
                        //     ),
                        //   },
                        // );
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