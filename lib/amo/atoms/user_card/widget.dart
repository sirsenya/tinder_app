import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/album/album_bloc.dart';
import '../../../bloc/current_user/current_user_bloc.dart';
import '../../../bloc/photo/photo_bloc.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../models/album.dart';
import '../../../models/photo.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState is UserLoadedState) {
          BlocProvider.of<CurrentUserBloc>(context).add(
            CurrentUserDetermineEvent(
              allUsers: userState.users,
              currentUserIndex: 0,
            ),
          );
          return BlocBuilder<CurrentUserBloc, CurrentUserState>(
            builder: (context, currentUserState) {
              if (currentUserState is CurrentUserDetermined) {
                return Column(
                  children: [
                    BlocBuilder<AlbumBloc, AlbumState>(
                      builder: (context, albumState) {
                        if (albumState is AlbumLoadedState) {
                          return Column(
                            children: [
                              BlocBuilder<PhotoBloc, PhotoState>(
                                builder: (context, photoState) {
                                  if (photoState is PhotoLoadedState) {
                                    List<Album> userAlbums = albumState.albums
                                        .where((album) =>
                                            album.userId ==
                                            currentUserState.currentUser.id)
                                        .toList();

                                    Map<Album, List<Photo>>
                                        userAlbumsAndPhotos = {};
                                    for (int i = 0;
                                        i < userAlbums.length;
                                        i++) {
                                      userAlbumsAndPhotos[userAlbums[i]] =
                                          photoState.photos
                                              .where((photo) =>
                                                  photo.albumId ==
                                                  userAlbums[i].id)
                                              .toList();
                                    }
                                    ;
                                    List<Photo> allUserPhotos =
                                        userAlbumsAndPhotos.values
                                            .toList()
                                            .expand((element) => element)
                                            .toList();
                                    return Column(
                                      children: [
                                        InkWell(
                                            onTap: () => showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          Dialog.fullscreen(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Close'),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GridView.builder(
                                                            itemCount:
                                                                allUserPhotos
                                                                    .length,
                                                            itemBuilder: (context,
                                                                    index) =>
                                                                Image.network(
                                                                    allUserPhotos[
                                                                            index]
                                                                        .url),
                                                            gridDelegate:
                                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            child: Image.network(
                                                allUserPhotos[0].url)),
                                      ],
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                    Text(
                      currentUserState.currentUser.name,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(currentUserState.currentUser.company.name,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Text(
                              "\u2022Phone: ${currentUserState.currentUser.phone}"
                              "\n \u2022 Email: ${currentUserState.currentUser.email}"
                              "\n \u2022 Address: ${currentUserState.currentUser.address.city},"
                              "\n      ${currentUserState.currentUser.address.street},"
                              "\n      ${currentUserState.currentUser.address.suite}"
                              "\n      ${currentUserState.currentUser.address.zipcode} "),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Text('current user is not determined');
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
