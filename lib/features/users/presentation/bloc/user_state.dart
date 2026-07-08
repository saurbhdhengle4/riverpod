import 'package:equatable/equatable.dart';
import 'package:river/features/users/data/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

// Initial
class UserInitial extends UserState {}

// Loading
class UserLoading extends UserState {}

// Success
class UserLoaded extends UserState {
  final List<UserModel> users;

  const UserLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

// Error
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
