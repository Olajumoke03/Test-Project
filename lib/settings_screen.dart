import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                return ListTile(
                  title: Text(category.categoryName ?? ''),
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
            onPressed: () => Navigator.pop(context),
            child: Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
