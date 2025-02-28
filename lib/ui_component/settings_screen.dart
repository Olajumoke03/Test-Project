// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'category_provider.dart';
//
// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Settings')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: categoryProvider.categories.length,
//               itemBuilder: (context, index) {
//                 final category = categoryProvider.categories[index];
//                 return ListTile(
//                   title: Text(category.categoryName ?? ''),
//                   leading: Checkbox(
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
//             onPressed: () => Navigator.pop(context),
//             child: Text('Save Changes'),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/utility/colors.dart';
import '../category_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Keep track of initial selection to detect changes
    final initialSelection = [...categoryProvider.selectedCategories];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Categories'),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            // Check if selections have changed
            if (!_areListsEqual(initialSelection, categoryProvider.selectedCategories)) {
              // Show confirmation dialog if user has made changes
              final shouldSave = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Save Changes?'),
                  content: const Text('Do you want to save your category changes?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Discard'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );

              if (shouldSave ?? false) {
                await categoryProvider.saveSelectedCategories();
              } else {
                // Restore original selection if user discards changes
                categoryProvider.selectedCategories.clear();
                categoryProvider.selectedCategories.addAll(initialSelection);
              }
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select or deselect categories',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                final isSelected = categoryProvider.selectedCategories.contains(category.categoryId);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(category.categoryName ?? ''),
                    trailing: Checkbox(
                      fillColor: MaterialStateProperty.all<Color>(mainColor),
                      overlayColor: MaterialStateProperty.all<Color>(mainColor),
                      hoverColor: mainColor,
                      activeColor: mainColor,
                      focusColor: mainColor,
                      value: isSelected,
                      onChanged: (bool? value) {
                        if (value == true) {
                          categoryProvider.selectCategory(category.categoryId!);
                        } else {
                          // Prevent deselecting if it would leave less than 4 categories
                          if (categoryProvider.selectedCategories.length > 4) {
                            categoryProvider.deselectCategory(category.categoryId!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('You must keep at least 4 categories selected'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(overlayColor: mainColor),
              onPressed: () async {
                if (categoryProvider.selectedCategories.length >= 4) {
                  await categoryProvider.saveSelectedCategories();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select at least 4 categories'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child:  Text('Save Changes',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  height: 3,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),),
            ),
          ),
        ],
      ),
    );
  }

  bool _areListsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) return false;
    for (var item in list1) {
      if (!list2.contains(item)) return false;
    }
    return true;
  }
}