part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState({
    required this.users,
  });

  @override
  List<Object> get props => [users];
}

class UserFailureLoadState extends UserState {
  final String message;

  UserFailureLoadState({required this.message});

  @override
  List<Object> get props => [message];
}
