import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:river/features/users/presentation/bloc/user_bloc.dart';
import 'package:river/features/users/presentation/bloc/user_event.dart';
import 'package:river/features/users/presentation/bloc/user_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<UserBloc>().add(const LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Users bloc view',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,

              itemBuilder: (context, index) {
                final user = state.users[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(user.id.toString()),
                  ),

                  title: Text(user.name),

                  subtitle: Text(user.email),
                );
              },
            );
          }

          if (state is UserError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
