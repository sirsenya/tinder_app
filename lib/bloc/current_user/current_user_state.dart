part of 'current_user_bloc.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();
}

class CurrentUserInitialState extends CurrentUserState {
  @override
  List<Object> get props => [];
}

class CurrentUserDetermined extends CurrentUserState {
  final List<User> allUsers;
  final int currentUserIndex;

  CurrentUserDetermined({required this.allUsers, required this.currentUserIndex});

  User get currentUser => allUsers[currentUserIndex];

  @override
  List<Object> get props => [allUsers, currentUserIndex, currentUser];
}
