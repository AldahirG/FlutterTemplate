import 'package:flutter/material.dart';
import '../component_type_model/component_model.dart';
import '../component_type_model/computer_system_model.dart';


class ComputerSystemTable extends StatelessWidget {
  final List<ComputerSystem> computerSystems;
  final Map<int, Component> componentMap;

  ComputerSystemTable({required this.computerSystems, required this.componentMap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('System Name')),
          DataColumn(label: Text('Components')),
        ],
        rows: computerSystems.map((system) {
          return DataRow(cells: [
            DataCell(Text(system.name)),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: system.components.map((systemComponent) {
                final component = componentMap[systemComponent.componentId];
                return Text(
                    '${component?.name ?? 'Unknown'} x${systemComponent.quantity}');
              }).toList(),
            )),
          ]);
        }).toList(),
      ),
    );
  }
}
