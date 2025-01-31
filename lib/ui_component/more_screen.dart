import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/ui_component/settings_screen.dart';
import 'package:test_project_github/utility/colors.dart';
import 'package:test_project_github/utility/font_controller.dart';
import 'package:test_project_github/utility/theme_selector.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utility/text_size_seekbar.dart';
import '../widgets/custom_alert_dialog.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool _isSwitched = false;
  bool _isSettings = false;

  ThemeMode _themeMode = ThemeMode.system;

  void _handleThemeModeChange(ThemeMode newThemeMode) {
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  fontDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
          child:   const ChangeTextSizeWithSeekBar()
      ),
    );
  }

  Future<void> launchInstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/guardiannigeria/');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Consumer<FontSizeController>(builder: ( context,  fontScale, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("More"),
          surfaceTintColor: Colors.transparent,
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Visual Preferences", style: TextStyle(
                        color: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!
                            .color,
                        fontSize: 7.5 * fontScale.value,
                        fontWeight: FontWeight.normal),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Text Size", style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w400
                        ),),

                        const SizedBox(height: 5.0,),
                        const ChangeTextSizeWithSeekBar(),
                        const SizedBox(height: 5.0,),

                        // SwitchListTile(
                        //   activeColor: const Color(0XFFAFB5D9),
                        //   dense: true,
                        //   contentPadding: EdgeInsets.zero,
                        //   title: Text(
                        //       "Follow Device Settings",
                        //       style: GoogleFonts.dmSans( fontSize: 7*fontScale.value, fontWeight: FontWeight.normal)
                        //   ),
                        //   value: _isSettings,
                        //   onChanged: (bool value) {
                        //     setState(() {
                        //       _isSettings = value;
                        //     });
                        //   },
                        // ),
                        //
                        // Text(
                        //     "When switched on the App will follow your Phone’s settings ",
                        //     style: GoogleFonts.dmSans(
                        //         fontSize: 5.7*fontScale.value,
                        //         fontWeight: FontWeight.normal, color: Colors.grey)
                        // ),

                        const SizedBox(height: 10.0,),
                        Divider(color: Colors.grey[200],),
                        const SizedBox(height: 5.0,),

                        Text("App Theme", style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w400
                        ),),

                        const ThemeSelector(
                          // currentThemeMode: _themeMode,
                          // onThemeModeChanged: _handleThemeModeChange,
                        ),

                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(5.0),
                        //       decoration: BoxDecoration(
                        //           border: Border.all(color: Colors.black)
                        //       ),
                        //       child: GestureDetector(
                        //           onTap: () {
                        //             Provider.of<AppProvider>(context, listen: false)
                        //                 .setTheme(Constants.darkTheme, "dark");
                        //           },
                        //           child: Icon(Icons.dark_mode)),
                        //     ),
                        //     const SizedBox(width: 5.0,),
                        //
                        //     Container(
                        //       padding: EdgeInsets.all(5.0),
                        //       decoration: BoxDecoration(
                        //           border: Border.all(color: Colors.black)
                        //       ),
                        //       child: GestureDetector(
                        //           onTap: () {
                        //             Provider.of<AppProvider>(context, listen: false)
                        //                 .setTheme(Constants.lightTheme, "light");
                        //           },
                        //           child: Icon(Icons.light_mode)),
                        //     )
                        //   ],
                        // ),

                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[300],),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SwitchListTile(
                      activeColor: mainColor,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          "Notifications",
                          style: TextStyle( fontSize: 7*fontScale.value, fontWeight: FontWeight.normal)
                      ),
                      value: _isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("About us", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Contact us", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )                       ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Privacy Policy", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Share App", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Rate Us", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                    },

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Row(
                        children: [
                          Text("Update Categories", style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color,
                              fontSize: 7 * fontScale.value,
                              fontWeight: FontWeight.normal
                          ),
                          ),

                          const Spacer(),

                          Transform.rotate(
                              angle: - pi /4,
                              child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Change of Name", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal
                         ),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Advertise with us", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Text("Subscribe to our Newsletter", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const Spacer(),

                        Transform.rotate(
                            angle: - pi /4,
                            child: Icon(Icons.logout, color: Colors.grey[500], size: 20, )
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(color: Colors.grey[200],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Social Media", style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!
                                .color,
                            fontSize: 7 * fontScale.value,
                            fontWeight: FontWeight.normal),
                        ),

                        const SizedBox(height: 5.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: () async {
                                launchInstagram();

                                // final Uri url = Uri.parse('https://www.instagram.com/guardiannigeria/');
                                // if (await canLaunchUrl(url)) {
                                //   await launchUrl(url, mode: LaunchMode.externalApplication);
                                // } else {
                                //   throw 'Could not launch $url';
                                // }
                              },
                              child: SvgPicture.asset(
                                'assets/social_media/instagram.svg',
                                height: 35.0,
                                width: 35.0,
                              ),
                            ),

                            // InkWell(
                            //   onTap: (){
                            //     launchInstagram() async {
                            //       const url = 'https://www.instagram.com/guardiannigeria/';
                            //       if (await canLaunch(url)) {
                            //         await launch(url);
                            //       } else {
                            //         throw 'Could not launch $url';
                            //       }
                            //     }
                            //     launchInstagram();
                            //   },
                            //   child: SvgPicture.asset(
                            //     'assets/social_media/instagram.svg',
                            //     height: 35.0,
                            //     width: 35.0,
                            //   ),
                            // ),

                            InkWell(
                              onTap: (){
                                launchTelegram() async {
                                  const url = 'https://www.threads.net/@guardiannigeria';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                                launchTelegram();
                              },
                              child: Image.asset(
                                'assets/social_media/threads_logo.jpg',
                                height: 35.0,
                                width: 35.0,
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                launchFacebook() async {
                                  const url = 'https://www.facebook.com/guardianng';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                                launchFacebook();
                              },
                              child: Image.asset(
                                'assets/social_media/facebook.png',
                                height: 35.0,
                                width: 35.0,
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                launchTwitter() async {
                                  const url = 'https://x.com/GuardianNigeria';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                                launchTwitter();
                              },

                              child: Image.asset(
                                'assets/social_media/x_logo.png',
                                height: 30.0,
                                width: 30.0,
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                launchLinkedIn() async {
                                  const url = 'https://www.linkedin.com/company/guardian-newspapers-limited/';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                                launchLinkedIn();
                              },

                              child: SvgPicture.asset(
                                'assets/social_media/linkedin.svg',
                                height: 35.0,
                                width: 35.0,
                              ),
                            ),


                            InkWell(
                              onTap: (){
                                launchYouTube() async {
                                  const url = 'https://www.youtube.com/channel/UCjV6LnXFtXzWoYxnq-zIvXw';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }
                                launchYouTube();
                              },

                              child: SvgPicture.asset(
                                'assets/social_media/youtube.svg',
                                height: 35.0,
                                width: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:Text("Version - 1.0.0", style: TextStyle(
                      color: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium!
                          .color,
                      fontSize: 7 * fontScale.value,
                      fontWeight: FontWeight.bold),
                  ),
              ),
            )
          ],
        ),
      );
     }
    );
  }
}



