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
      // Cargar el archivo JSON desde los assets
      final jsonString = await rootBundle.loadString(jsonFilePath);
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Deserializar manufacturers
      List<Manufacturer> manufacturers = (jsonData['manufacturers'] as List?)
          ?.map((e) => Manufacturer.fromJson(e))
          .toList() ?? [];

      // Deserializar componentTypes
      List<ComponentType> componentTypes = (jsonData['componentTypes'] as List?)
          ?.map((e) => ComponentType.fromJson(e))
          .toList() ?? [];

      // Deserializar components
      List<Component> components = (jsonData['components'] as List?)
          ?.map((e) => Component.fromJson(e))
          .toList() ?? [];

      // Deserializar computerSystems
      List<ComputerSystem> computerSystems = (jsonData['computerSystems'] as List?)
          ?.map((e) => ComputerSystem.fromJson(e))
          .toList() ?? [];

      // Retornar un mapa con los datos deserializados
      return {
        'manufacturers': manufacturers,
        'componentTypes': componentTypes,
        'components': components,
        'computerSystems': computerSystems,
      };
    } catch (e) {
      // Manejo de excepciones para errores de formato y otros errores generales
      if (e is FormatException) {
        throw Exception('Error al procesar el JSON: Formato incorrecto.');
      } else {
        throw Exception('Error al procesar el JSON: $e');
      }
    }
  }
}
