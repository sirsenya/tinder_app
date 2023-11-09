import 'package:http/http.dart' as http;

class DataService {
  Future<http.Response?> getUsers() async {
    const _baseUrl = 'jsonplaceholder.typicode.com';
    try {
      final url = Uri.https(_baseUrl, '/users');
      final response = await http.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response?> getAlbums() async {
    const _baseUrl = 'jsonplaceholder.typicode.com';
    try {
      final url = Uri.https(_baseUrl, '/albums');
      final response = await http.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response?> getPhotos() async {
    const _baseUrl = 'jsonplaceholder.typicode.com';
    try {
      final url = Uri.https(_baseUrl, '/photos');
      final response = await http.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }
}