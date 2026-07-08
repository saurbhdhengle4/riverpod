import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/users');
    return response.data;
  }


  // This  is api call service using dio
}
