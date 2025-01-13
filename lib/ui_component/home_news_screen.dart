// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/bloc/home_news_bloc.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/event/home_news_event.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/settings_screen.dart';
import 'package:test_project_github/state/home_news_state.dart';


class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({super.key});

  @override
  _HomeNewsScreenState createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch categories when the screen initializes
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Show loading indicator while categories are being fetched
    if (categoryProvider.categories.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return DefaultTabController(
      length: categoryProvider.selectedCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              icon: Icon(Icons.settings),
            )
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: categoryProvider.selectedCategories.map((categoryId) {
              // Find the category in the loaded categories list
              final category = categoryProvider.categories.firstWhere(
                    (cat) => cat.categoryId == categoryId,
                orElse: () => CategoryListModel(
                  categoryId: categoryId,
                  categoryName: 'Loading...',
                ),
              );

              return Tab(
                text: '${category.categoryName ?? 'Loading...'} ($categoryId)',
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: categoryProvider.selectedCategories.map((categoryId) {
            return NewsListScreen(categoryId: categoryId);
          }).toList(),
        ),
      ),
    );
  }
}

class NewsListScreen extends StatelessWidget {
  final String categoryId;

  const NewsListScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsError) {
          return Center(child: Text(state.message));
        }
        if (state is NewsLoaded) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              final newsItem = state.news[index];
              return ListTile(
                title: Text(newsItem.title!.rendered!),
                subtitle: Text(newsItem.date!),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}