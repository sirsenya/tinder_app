part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();
}

class PhotoInitialState extends PhotoState {
  @override
  List<Object> get props => [];
}

class PhotoLoadingState extends PhotoState {
  @override
  List<Object> get props => [];
}

class PhotoLoadedState extends PhotoState {
  final List<Photo> photos;

  const PhotoLoadedState({
    required this.photos,
  });

  @override
  List<Object> get props => [photos];
}

class PhotoFailureLoadState extends PhotoState {
  final String message;

  const PhotoFailureLoadState({required this.message});

  @override
  List<Object> get props => [message];
}
