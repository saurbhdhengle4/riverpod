import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/features/users/data/models/user_model.dart';
import 'package:river/features/users/presentation/providers/user_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("River Pod User List"), backgroundColor: Colors.white),
      body: users.when(
        data: (user) {
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              UserModel data = user[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.email),
                leading: Text(data.id.toString()),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text("No Data Found"));
        },

        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
//UI