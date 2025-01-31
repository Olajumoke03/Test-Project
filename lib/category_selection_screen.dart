// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'category_provider.dart';
// //
// // class CategorySelectionScreen extends StatelessWidget {
// //   const CategorySelectionScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final categoryProvider = Provider.of<CategoryProvider>(context);
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Select Categories')),
// //       body: Column(
// //         children: [
// //           const Text('Please select at least 4 categories'),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: categoryProvider.categories.length,
// //               itemBuilder: (context, index) {
// //                 final category = categoryProvider.categories[index];
// //                 return ListTile(
// //                   title: Text(category.categoryName ?? 'hi'),
// //                   leading: Checkbox(
// //                     value: categoryProvider.selectedCategories.contains(category.categoryId),
// //                     onChanged: (bool? value) {
// //                       if (value == true) {
// //                         categoryProvider.selectCategory(category.categoryId!);
// //                       } else {
// //                         categoryProvider.deselectCategory(category.categoryId!);
// //                       }
// //                     },
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: categoryProvider.selectedCategories.length >= 4
// //                 ? () => Navigator.pushReplacementNamed(context, '/home')
// //                 : null,
// //             child: const Text('Continue'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:test_project_github/category_provider.dart';
// import 'package:test_project_github/model/catgegory_model.dart';
// import 'package:test_project_github/utility/colors.dart';
// import 'package:test_project_github/category_hardcode.dart';
//
//
// class CategorySelectionScreen extends StatefulWidget {
//   @override
//   _CategorySelectionScreenState createState() => _CategorySelectionScreenState();
// }
//
// class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when the screen is initialized
//     Future.delayed(Duration.zero, () {
//       final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
//
//
//       //// this is to fetch categories from backend
//       categoryProvider.fetchCategories(); // Load categories when the screen appears
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     // If categories are empty or still loading, show loading indicator
//     if (categoryProvider.categories.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(title: Text('Select Preferred Categories'),
//           surfaceTintColor: Colors.transparent,
//         ),
//
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Preferred Categories'),
//         surfaceTintColor: Colors.transparent,
//       ),
//       body: Column(
//         children: [
//           Text(
//             'Please select at least four(4) categories',
//             style: GoogleFonts.montserrat(
//                 fontSize: 18,
//                 height: 3,
//                 fontWeight: FontWeight.w500
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: categoryProvider.categories.length,
//               itemBuilder: (context, index) {
//                 final category = categoryProvider.categories[index];
//                 return ListTile(
//                   title: Text(category.categoryName ?? 'Unknown'),
//                   leading: Checkbox(
//
//                     fillColor: MaterialStateProperty.all<Color>(mainColor),
//                     overlayColor: MaterialStateProperty.all<Color>(mainColor),
//                     hoverColor: mainColor,
//                     activeColor: mainColor,
//                     focusColor: mainColor,
//
//
//                     value: categoryProvider.selectedCategories.contains(category.categoryId),
//                     onChanged: (bool? value) {
//                       if (value == true) {
//                         categoryProvider.selectCategory(category.categoryId!);
//                       } else {
//                         categoryProvider.deselectCategory(category.categoryId!);
//                       }
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: categoryProvider.selectedCategories.length >= 4
//                 ? () async {
//               // Save the selected categories when the user clicks continue
//               await categoryProvider.saveSelectedCategories();
//               Navigator.pushReplacementNamed(context, '/home');
//             }
//                 : null,
//             child: Text('Continue',style: GoogleFonts.montserrat(
//                 fontSize: 18,
//                 height: 3,
//                 fontWeight: FontWeight.w600,
//               color: mainColor
//             ), ),
//           ),
//
//           SizedBox(height: 5.0)
//         ],
//       ),
//     );
//   }
// }
//
//



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/utility/colors.dart';

class CategorySelectionScreen extends StatefulWidget {
  @override
  _CategorySelectionScreenState createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  @override
  void initState() {
    super.initState();
    // No need to fetch categories anymore
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Preferred Categories'),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Text(
            'Please select at least four(4) categories',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              height: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                return ListTile(
                  title: Text(category.categoryName ?? 'Unknown'),
                  leading: Checkbox(
                    fillColor: MaterialStateProperty.all<Color>(mainColor),
                    overlayColor: MaterialStateProperty.all<Color>(mainColor),
                    hoverColor: mainColor,
                    activeColor: mainColor,
                    focusColor: mainColor,
                    value: categoryProvider.selectedCategories.contains(category.categoryId),
                    onChanged: (bool? value) {
                      if (value == true) {
                        categoryProvider.selectCategory(category.categoryId!);
                      } else {
                        categoryProvider.deselectCategory(category.categoryId!);
                      }
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(overlayColor: mainColor),
            onPressed: categoryProvider.selectedCategories.length >= 4
                ? () async {
              await categoryProvider.saveSelectedCategories();
              Navigator.pushReplacementNamed(context, '/home');
            }
                : null,
            child: Text(
              'Continue',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                height: 3,
                fontWeight: FontWeight.w600,
                color: mainColor,
              ),
            ),
          ),
          SizedBox(height: 5.0)
        ],
      ),
    );
  }
}