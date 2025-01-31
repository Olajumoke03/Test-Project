import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_github/ui_component/guardian_tv_item.dart';
import 'package:test_project_github/utility/colors.dart';


class GuardianTVScreen extends StatefulWidget {
  const GuardianTVScreen({super.key});

  @override
  State<GuardianTVScreen> createState() => _GuardianTVScreenState();
}

class _GuardianTVScreenState extends State<GuardianTVScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/guardian_tv.png', width: 200, height: 70, ),
            surfaceTintColor: Colors.transparent,
            actions: const [
              Icon(Icons.search),
              SizedBox(width: 5.0,)
            ],
            bottom: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,

              labelStyle: GoogleFonts.montserrat(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize:15,
                  fontWeight:FontWeight.w500
              ),
              isScrollable: true,
              indicatorColor: mainColor,
              // indicatorSize: TabBarIndicatorSize.tab,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.grey[200],

              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
              tabAlignment: TabAlignment.start,
              tabs: const [

                Tab( text: "All", ),
                Tab(text: "Breaking News"),
                Tab(text: "News"),
                Tab(text: "Business"),
                Tab(text: "Technology"),
                Tab(text: "Fashion"),
                Tab(text: "Fashion"),
              ],

            ),
          ),
          body: const TabBarView(
            children:  [
              GuardianTvItem(),
              GuardianTvItem(),
              GuardianTvItem(),
              GuardianTvItem(),
              GuardianTvItem(),
              GuardianTvItem(),
              GuardianTvItem(),
            ],
          ),
        ),
      ),
    );
  }
}
