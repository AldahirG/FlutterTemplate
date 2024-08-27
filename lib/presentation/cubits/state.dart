import 'package:equatable/equatable.dart';
import '../../component_type_model/component_model.dart';
import '../../component_type_model/component_type_model.dart';
import '../../component_type_model/computer_system_model.dart';
import '../../component_type_model/manufacturer_model.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object?> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<Manufacturer> manufacturers;
  final List<ComponentType> componentTypes;
  final List<Component> components;
  final List<ComputerSystem> computerSystems;

  const DataLoaded({
    required this.manufacturers,
    required this.componentTypes,
    required this.components,
    required this.computerSystems,
  });

  @override
  List<Object?> get props => [manufacturers, componentTypes, components, computerSystems];
}

class DataError extends DataState {
  final String message;

  const DataError(this.message);

  @override
  List<Object?> get props => [message];
}
