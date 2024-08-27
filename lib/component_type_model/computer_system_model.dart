class ComputerSystem {
  final int id;
  final String name;
  final List<SystemComponent> components;

  ComputerSystem({
    required this.id,
    required this.name,
    required this.components,
  });

  factory ComputerSystem.fromJson(Map<String, dynamic> json) {
    var componentList = json['components'] as List;
    List<SystemComponent> components = componentList.map((i) => SystemComponent.fromJson(i)).toList();

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
      'components': components.map((c) => c.toJson()).toList(),
    };
  }
}

class SystemComponent {
  final int componentId;
  final int quantity;

  SystemComponent({
    required this.componentId,
    required this.quantity,
  });

  factory SystemComponent.fromJson(Map<String, dynamic> json) {
    return SystemComponent(
      componentId: json['component_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'component_id': componentId,
      'quantity': quantity,
    };
  }
}
