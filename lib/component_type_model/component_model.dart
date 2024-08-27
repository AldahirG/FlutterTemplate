import 'component_type_model.dart';
import 'manufacturer_model.dart';

class Component {
  final int id;
  final String name;
  final Manufacturer manufacturer;
  final ComponentType componentType;

  Component({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.componentType,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      manufacturer: Manufacturer.fromJson(json['manufacturer'] ?? {}),
      componentType: ComponentType.fromJson(json['componentType'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer.toJson(),
      'componentType': componentType.toJson(),
    };
  }
}
