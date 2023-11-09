import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_clone/models/album.dart';

import '../../data/service/api_repository.dart';
import '../../models/photo.dart';
import '../../models/user.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final ApiRepository apiRepository;

  AlbumBloc({required this.apiRepository}) : super(AlbumInitialState()) {
    on<AlbumEvent>((event, emit) async {
      if (event is AlbumLoadEvent || event is AlbumRefreshEvent) {
        emit(AlbumLoadingState());
        try {
          final List<Album> albums = await apiRepository.getAlbumsList();
          emit(
            AlbumLoadedState(
              albums: albums,
            ),
          );
        } catch (e) {
          emit(
            AlbumFailureLoadState(
              message: e.toString(),
            ),
          );
        }
      } else {}
    });
  }
}
