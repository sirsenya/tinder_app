part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
}

class PhotoLoadEvent extends PhotoEvent {
  @override
  List<Object?> get props => [];
}

class PhotoRefreshEvent extends PhotoEvent {
  @override
  List<Object?> get props => [];
}
