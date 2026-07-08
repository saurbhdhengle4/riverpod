import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/core/api/api_service.dart';

import '../../data/models/user_model.dart';
import '../../data/repository/user_repository_impl.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(ref.read(apiServiceProvider));
});

final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(userRepositoryProvider).getUsers();
});
