class Manufacturer {
  final int id;
  final String name;
  final String country;

  Manufacturer({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      id: json['id'],
      name: json['name'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country,
    };
  }
}
