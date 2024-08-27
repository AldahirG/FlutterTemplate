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

factory ComputerSystem.fromJson(Map<String, dynamic> json) {
  var componentList = json['components'] as List?; // Puede ser nulo
  List<SystemComponent> components = componentList != null 
      ? componentList.map((i) => SystemComponent.fromJson(i)).toList() 
      : [];

  return ComputerSystem(
    id: json['id'],
    name: json['name'],
    components: components,
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
