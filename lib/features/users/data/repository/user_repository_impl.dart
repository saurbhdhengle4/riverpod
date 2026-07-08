import 'package:river/core/api/api_service.dart';
import 'package:river/features/users/data/models/user_model.dart';

import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<List<UserModel>> getUsers() async {
    final data = await apiService.getUsers();

    return data.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
  // This is api call repo for calling api using api call service
}
