import 'package:flutter/material.dart';
import '../component_type_model/component_type_model.dart';

class ComponentTypesList extends StatelessWidget {
  final List<ComponentType> componentTypes;

  ComponentTypesList({required this.componentTypes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: componentTypes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(componentTypes[index].name),
        );
      },
    );
  }
}
