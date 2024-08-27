import 'package:flutter/material.dart';
import '../component_type_model/component_model.dart';

class ComponentDetails extends StatelessWidget {
  final Component component;

  ComponentDetails({required this.component});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Component: ${component.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Manufacturer: ${component.manufacturer.name}'),
            SizedBox(height: 8),
            Text('Component Type: ${component.componentType.name}'),
          ],
        ),
      ),
    );
  }
}
