class Company {
  final String name;

  Company({

    required this.name,

  });

  factory Company.fromJson(Map<String, dynamic> map) {
    return Company(
      name: map['name'] as String,
    );
  }
}