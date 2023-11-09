import 'address.dart';
import 'company.dart';

class User {
  final int id;

  //final List<String> photosUrl;
  final String name;
  final Company company;
  final String phone;
  final String email;
  final String website;
  final Address address;

  User({
    required this.id,
    required this.company,
    required this.website,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
    // required this.photosUrl,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      company: Company.fromJson(map['company']) as Company,
      phone: map['phone'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
      address: Address.fromJson(map['address']) as Address,
    );
  }
}
