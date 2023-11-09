part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
}

class AlbumInitialState extends AlbumState {
  @override
  List<Object> get props => [];
}

class AlbumLoadingState extends AlbumState {
  @override
  List<Object> get props => [];
}

class AlbumLoadedState extends AlbumState {
  final List<Album> albums;

  const AlbumLoadedState({
    required this.albums,
  });

  @override
  List<Object> get props => [albums];
}

class AlbumFailureLoadState extends AlbumState {
  final String message;

  const AlbumFailureLoadState({required this.message});

  @override
  List<Object> get props => [message];
}
