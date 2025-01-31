

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_github/utility/colors.dart';

class BookmarkVideosScreen extends StatefulWidget {
  const BookmarkVideosScreen({super.key});

  @override
  State<BookmarkVideosScreen> createState() => _BookmarkVideosScreenState();
}

class _BookmarkVideosScreenState extends State<BookmarkVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/bookmark.png'),
            Text("You have no saved videos yet.",
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
        ));
  }

}
