import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_clone/models/user.dart';

part 'current_user_event.dart';
part 'current_user_state.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  CurrentUserBloc() : super(CurrentUserInitialState()) {
    on<CurrentUserDetermineEvent>((event, emit) {
      emit(CurrentUserDetermined(currentUserIndex: event.currentUserIndex, allUsers: event.allUsers));
    });
  }
}

