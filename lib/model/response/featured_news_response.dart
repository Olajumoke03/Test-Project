import 'package:test_project_github/model/home_news_model.dart';

class FeaturedNewsResponse {
  late List<HomeNewsModel> featuredNewsResponse;

  FeaturedNewsResponse({required featuredNewsResponse});

  FeaturedNewsResponse.fromJson(List<dynamic> json) {
    featuredNewsResponse =[];
    for (var v in json) {
      featuredNewsResponse.add(HomeNewsModel.fromJson(v));
    }
  }

}
