import 'company.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(
      id: map['id'] as int,
      userId: map['userId'] as int,
      // company: Company.fromJson(map['company']) as Company,
      title: map['title'] as String,
    );
  }
}
