import 'package:flutter/material.dart';
import 'package:tinder_clone/bloc/current_user/current_user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Direction {
  previous,
  next,
}

class ControlButton extends StatelessWidget {
  final Direction direction;
  final CurrentUserDetermined state;
  const ControlButton({super.key, required this.direction, required this.state});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        int newCurrentUserIndex;
        switch (direction) {
          case Direction.next: newCurrentUserIndex = state.currentUserIndex ==
              state.allUsers.length - 1
              ? 0
              : state.currentUserIndex + 1;
          case Direction.previous: newCurrentUserIndex = state.currentUserIndex == 0
              ? state.allUsers.length - 1
              : state.currentUserIndex - 1;
        }
        BlocProvider.of<CurrentUserBloc>(context).add(
            CurrentUserDetermineEvent(
                currentUserIndex: newCurrentUserIndex,
                allUsers: state.allUsers));
      },
      child: Text(
        direction.name,
      ),
    );
  }
}
