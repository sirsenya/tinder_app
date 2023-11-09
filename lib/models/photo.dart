import 'company.dart';

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      albumId: map['albumId'] as int,
      // company: Company.fromJson(map['company']) as Company,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }
}
