import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../component_type_model/component_model.dart';
import '../component_type_model/component_type_model.dart';
import '../component_type_model/computer_system_model.dart';
import '../component_type_model/manufacturer_model.dart';

class DataRepository {
  final String jsonFilePath;

  DataRepository({required this.jsonFilePath});

  Future<Map<String, dynamic>> getAllData() async {
    try {
      final jsonString = await rootBundle.loadString(jsonFilePath);
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      List<Manufacturer> manufacturers = (jsonData['manufacturers'] as List?)
          ?.map((e) => Manufacturer.fromJson(e))
          .toList() ?? [];

      List<ComponentType> componentTypes = (jsonData['componentTypes'] as List?)
          ?.map((e) => ComponentType.fromJson(e))
          .toList() ?? [];

      List<Component> components = (jsonData['components'] as List?)
          ?.map((e) => Component.fromJson(e))
          .toList() ?? [];

      List<ComputerSystem> computerSystems = (jsonData['computerSystems'] as List?)
          ?.map((e) => ComputerSystem.fromJson(e))
          .toList() ?? [];

      return {
        'manufacturers': manufacturers,
        'componentTypes': componentTypes,
        'components': components,
        'computerSystems': computerSystems,
      };
    } catch (e) {
      throw Exception('Error al procesar el JSON: $e');
    }
  }
}
