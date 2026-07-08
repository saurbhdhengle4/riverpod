import '../../../../core/network/api_service.dart';
import '../models/user_model.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<List<UserModel>> getUsers() async {
    final response = await apiService.getUsers();

    return response.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}
