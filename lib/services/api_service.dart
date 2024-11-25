import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://67449f2eb4e2e04abea2fc65.mockapi.io/api/v1',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<List<dynamic>> fetchPosts({required int page, required int limit}) async {
    try {
      final response = await _dio.get(
        '/posts',
      );
      return response.data as List<dynamic>;
    } on DioException catch (e) {
      throw Exception('Failed to fetch posts: ${e.message}');
    }
  }
}
