
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_project_github/utility/constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/model/response/featured_news_response.dart';

class NewsRepository {
  // final ApiClient _apiClient = ApiClient();
  final  httpClient = http.Client() ;
  late SharedPreferences prefs ;
  NewsRepository() {
    openCache();
  }

  void openCache() async {
    prefs = await SharedPreferences.getInstance();
  }

  // caches any string and key
  void saveAnyStringToCache(String value,String key) async {
    // check if the key even exists
    prefs.setString(key,value);
  }

  // checks shared preferences and fetches the  data saved there
  Future<String> getAnyStringValueFromCache(String key) async {
    openCache();
    String? value = prefs.getString(key);
    return value!;
  }


  //fetch home page top story
  Future<List<HomeNewsModel>>fetchFeaturedNews() async {
    final response = await httpClient.get(Uri.parse('https://guardian.ng/wp-json/wp/v2/posts?categories=34'));
    var data = json.decode(response.body);
    print("featured news response from repository: " + data.toString());

    FeaturedNewsResponse featuredNewsResponse = FeaturedNewsResponse.fromJson(data);
    // pick just 10 out of the news
    List<HomeNewsModel> newsToCache = featuredNewsResponse.featuredNewsResponse;
    // cache latest  news to shared preferences
    saveAnyStringToCache(jsonEncode(newsToCache), constants.Constants.featuredNewsCacheKey);
    // saveAnyStringToCache(response, constants.Constants.featuredNewsCacheKey);
    return featuredNewsResponse.featuredNewsResponse;
  }

  //for top stories
  Future<List<HomeNewsModel>> fetchTopNews() async {
    try {
      final response = await http.get(Uri.parse('https://guardian.ng/wp-json/wp/v2/posts?per_page=30&page=1'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        print("Data data: " + response.body.toString());
        return jsonData.map((json) => HomeNewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news, please try again');
      // throw Exception('Error fetching news: $e');
    }
  }
}

  Future<List<HomeNewsModel>> _fetchNewsForCategory(String categoryId) async {
    final url = Uri.parse('https://punchng.com/wp-json/wp/v2/posts?categories=$categoryId&per_page=10');
    print('Fetching news from: $url');

    try {
      final response = await http.get(url);
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => HomeNewsModel.fromJson(item)).toList();
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
      throw Exception('Network error: $e');
    }
  }






