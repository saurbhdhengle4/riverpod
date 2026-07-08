import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
  );

  Future<List<dynamic>> getUsers() async {
    final response = await dio.get("/users");

    return response.data;
  }
}
