import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:river/core/network/api_service.dart';
import 'package:river/features/users/data/repository/user_repository.dart';
import 'package:river/features/users/presentation/bloc/user_bloc.dart';

import 'features/users/presentation/screens/splash_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => UserBloc(UserRepository(ApiService())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Application',
      home: const SplashScreen(),
    );
  }
}
