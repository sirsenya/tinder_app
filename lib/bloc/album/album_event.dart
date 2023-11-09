part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();
}

class AlbumLoadEvent extends AlbumEvent {
  @override
  List<Object?> get props => [];
}

class AlbumRefreshEvent extends AlbumEvent {
  @override
  List<Object?> get props => [];
}
