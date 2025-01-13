// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'category_provider.dart';
//
// class CategorySelectionScreen extends StatelessWidget {
//   const CategorySelectionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Categories')),
//       body: Column(
//         children: [
//           const Text('Please select at least 4 categories'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: categoryProvider.categories.length,
//               itemBuilder: (context, index) {
//                 final category = categoryProvider.categories[index];
//                 return ListTile(
//                   title: Text(category.categoryName ?? 'hi'),
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
//             onPressed: categoryProvider.selectedCategories.length >= 4
//                 ? () => Navigator.pushReplacementNamed(context, '/home')
//                 : null,
//             child: const Text('Continue'),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/category_provider.dart';


class CategorySelectionScreen extends StatefulWidget {
  @override
  _CategorySelectionScreenState createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch categories when the screen is initialized
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.fetchCategories(); // Load categories when the screen appears
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // If categories are empty or still loading, show loading indicator
    if (categoryProvider.categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Select Categories')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Select Categories')),
      body: Column(
        children: [
          Text('Please select at least 4 categories'),
          Expanded(
            child: ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                return ListTile(
                  title: Text(category.categoryName ?? 'Unknown'),
                  leading: Checkbox(
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
            onPressed: categoryProvider.selectedCategories.length >= 4
                ? () async {
              // Save the selected categories when the user clicks continue
              await categoryProvider.saveSelectedCategories();
              Navigator.pushReplacementNamed(context, '/home');
            }
                : null,
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}
