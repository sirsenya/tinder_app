// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tinder_clone/models/user.dart';

import '../../models/album.dart';
import '../../models/photo.dart';
import 'data_repository.dart';

class ApiRepository {
  final DataService dataService;
  ApiRepository({
    required this.dataService,
  });

  Future<List<User>> getUsersList() async {
    final response = await dataService.getUsers();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final users = json.map((e) => User.fromJson(e)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Album>> getAlbumsList() async {
    final response = await dataService.getAlbums();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final albums = json.map((e) => Album.fromJson(e)).toList();
      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<List<Photo>> getPhotosList() async {
    final response = await dataService.getPhotos();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final photos = json.map((e) => Photo.fromJson(e)).toList();
      return photos;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}