import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/service/api_repository.dart';
import '../../models/photo.dart';
import '../../models/user.dart';

part 'photo_event.dart';

part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final ApiRepository apiRepository;

  PhotoBloc({required this.apiRepository}) : super(PhotoInitialState()) {
    on<PhotoEvent>((event, emit) async {
      if (event is PhotoLoadEvent || event is PhotoRefreshEvent) {
        emit(PhotoLoadingState());
        try {
          final List<Photo> photos = await apiRepository.getPhotosList();
          emit(
            PhotoLoadedState(
              photos: photos,
            ),
          );
        } catch (e) {
          emit(
            PhotoFailureLoadState(
              message: e.toString(),
            ),
          );
        }
      } else {}
    });
  }
}
