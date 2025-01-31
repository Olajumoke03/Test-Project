
//
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:test_project_github/catgegory_model.dart';
//
// class CategoryProvider with ChangeNotifier {
//   List<CategoryListModel> _categories = [];
//   List<String> _selectedCategories = [];
//   bool _isFirstTimeUser = true; // Flag to track first-time user
//
//   List<CategoryListModel> get categories => _categories;
//   List<String> get selectedCategories => _selectedCategories;
//   bool get isFirstTimeUser => _isFirstTimeUser;
//
//   // Load categories from API
//   Future<void> fetchCategories() async {
//     try {
//       final response = await http.get(Uri.parse('https://punchng.com/category-payload/?v2'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _categories = data.map((item) => CategoryListModel.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load categories');
//       }
//     } catch (e) {
//       print("Error loading categories: $e");
//     }
//   }
//
//   // Select category
//   void selectCategory(String categoryId) {
//     if (!_selectedCategories.contains(categoryId)) {
//       _selectedCategories.add(categoryId);
//       notifyListeners();
//     }
//   }
//
//   // Deselect category
//   void deselectCategory(String categoryId) {
//     _selectedCategories.remove(categoryId);
//     notifyListeners();
//   }
//
//   // Save the user's selected categories and update first-time user status
//   Future<void> saveSelectedCategories() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('selectedCategories', _selectedCategories);
//     await prefs.setBool('isFirstTimeUser', false); // Set to false after selecting categories
//     _isFirstTimeUser = false; // Update the in-memory flag
//     notifyListeners();
//   }
//
//   // Load the categories and check if it's the first time user
//   Future<void> loadPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     _selectedCategories = prefs.getStringList('selectedCategories') ?? [];
//     _isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
//     notifyListeners();
//   }
//
//   // // Load selected categories from SharedPreferences
//   // Future<void> loadSelectedCategories() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   _selectedCategories = prefs.getStringList('selectedCategories') ?? [];
//   //   notifyListeners();
//   // }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/category_hardcode.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryListModel> _categories = [];
  List<String> _selectedCategories = []; // List of selected category IDs
  bool _isFirstTimeUser = true;

  List<CategoryListModel> get categories => _categories;

  List<String> get selectedCategories => _selectedCategories;

  bool get isFirstTimeUser => _isFirstTimeUser;


  // Add this method to your CategoryProvider class
  void debugCategoryState() {
    print('Total categories loaded: ${_categories.length}');
    print('Selected category IDs: $_selectedCategories');
    print('Categories mapping: ');
    for (var category in _categories) {
      print('category ID: ${category.categoryId}, category Name: ${category
          .categoryName}');
    }
  }

  // Load categories from API
  //Update your fetchCategories method to include debugging:
  Future<void> fetchCategories() async {
    try {
      final response = await http.get(
          Uri.parse('https://punchng.com/category-payload/?v2'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _categories =
            data.map((item) => CategoryListModel.fromJson(item)).toList();
        debugCategoryState(); // Add this line
        notifyListeners();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print("Error loading categories: $e");
    }

  }


  // Future<void> fetchCategories() async {
  //   try {
  //     final response = await http.get(Uri.parse('https://punchng.com/category-payload/?v2'));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       _categories = data.map((item) => CategoryListModel.fromJson(item)).toList();
  //       notifyListeners();
  //     } else {
  //       throw Exception('Failed to load categories');
  //     }
  //   } catch (e) {
  //     print("Error loading categories: $e");
  //   }
  // }

  // Select category
  void selectCategory(String categoryId) {
    if (!_selectedCategories.contains(categoryId)) {
      _selectedCategories.add(categoryId);
      notifyListeners();
    }
  }

  // Deselect category
  void deselectCategory(String categoryId) {
    _selectedCategories.remove(categoryId);
    notifyListeners();
  }

  // Save the user's selected categories and update first-time user status
  Future<void> saveSelectedCategories() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedCategories', _selectedCategories);
    await prefs.setBool('isFirstTimeUser', false); // Set to false after selecting categories
    _isFirstTimeUser = false; // Update the in-memory flag
    notifyListeners();
  }

  // Load the categories and check if it's the first time user
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedCategories = prefs.getStringList('selectedCategories') ?? [];
    _isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
    notifyListeners();
  }
}
