import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/service/api_repository.dart';
import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository apiRepository;
  UserBloc({required this.apiRepository}) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is UserLoadEvent || event is UserRefreshEvent) {
        emit(UserLoadingState());
        try {
          final List<User> users = await apiRepository.getUsersList();
          emit(UserLoadedState(users: users));
        } catch (e) {
          emit(UserFailureLoadState(message: e.toString()));
        }
      }
      else {}
    });
  }
}
