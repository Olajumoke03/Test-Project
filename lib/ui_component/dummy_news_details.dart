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
import 'package:html/parser.dart';

class DummyNewsDetailScreen extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? author;
  final String? timeAgo;
  final int? comments;
  final int? likes;
  final HomeNewsModel? newsModel;


  const DummyNewsDetailScreen({
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
  State<DummyNewsDetailScreen> createState() => _DummyNewsDetailScreenState();
}

class _DummyNewsDetailScreenState extends State<DummyNewsDetailScreen> {

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
                    "   NIGERIA" ,
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

                      Text("LP Chieftain title: release report report report",
                        style: GoogleFonts.merriweather(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color:Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ) ,

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        Text('  Owede Agbajileke',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: homePageBlue,
                          ),),

                        Text("  |  ", style: TextStyle(color: Colors.grey)),
                        Text( "2 hours ago",
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


                    const SizedBox(height: 5),

                    Container(
                      child: ClipRRect(
                        child: Image.asset('assets/images/image.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 280,)

                        // Image.network(
                        //   imageUrl,
                        //   width: double.infinity,
                        //   height: 300,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),

                    ListView(
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