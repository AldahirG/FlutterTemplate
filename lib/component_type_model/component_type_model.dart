class ComponentType {
  final int id;
  final String name;

  ComponentType({
    required this.id,
    required this.name,
  });

  factory ComponentType.fromJson(Map<String, dynamic> json) {
    return ComponentType(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
