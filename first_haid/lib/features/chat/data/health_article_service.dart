import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = dotenv.env['HEALTH_ARTICLE_API_KEY']!;
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String country = 'us';
  final String category = 'health';

  Future<List<dynamic>> fetchHealthArticles() async {
    final String url =
        '$baseUrl?country=$country&category=$category&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['articles'] as List<dynamic>;
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }
}
