import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/news%20model.dart';
 // Ensure the file name is correctly referenced

class ApiEvent {
  final Dio dio;
  ApiEvent({required this.dio});

  Future<List<newsmodel>> getCurrentNews() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8219616f723147e18016c5525622b726');

      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        List<newsmodel> news = [];
        
        for (var article in articles) {
          news.add(newsmodel.fromJson(article));
        }
        
        return news;
      } else {
        throw Exception('Failed to load news');
      }
    } on DioException catch (e) {
      print(e.response?.statusCode);
      throw Exception(e.message);
    }
  }
}
