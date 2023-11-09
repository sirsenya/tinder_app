part of 'current_user_bloc.dart';

abstract class CurrentUserEvent extends Equatable {
  const CurrentUserEvent();
}

class CurrentUserDetermineEvent extends CurrentUserEvent {
  final int currentUserIndex;
  final List<User> allUsers;
  CurrentUserDetermineEvent({required this.currentUserIndex, required this.allUsers});


  @override
  List<Object?> get props => [currentUserIndex, allUsers];}

