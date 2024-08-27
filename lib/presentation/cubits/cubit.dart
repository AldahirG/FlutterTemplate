import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scooter_app/presentation/cubits/state.dart';
import '../../repository/repository.dart';

class DataCubit extends Cubit<DataState> {
  final DataRepository dataRepository;

  DataCubit({required this.dataRepository}) : super(DataInitial());

  Future<void> fetchData() async {
    try {
      emit(DataLoading());

      // Obtener los datos desde el JSON local a través del repositorio
      final data = await dataRepository.getAllData();

      // Emitir el estado DataLoaded con los datos cargados desde el JSON
      emit(DataLoaded(
        manufacturers: data['manufacturers'],
        componentTypes: data['componentTypes'],
        components: data['components'],
        computerSystems: data['computerSystems'],
      ));
    } catch (e) {
      emit(DataError('Error al cargar los datos: $e'));
    }
  }
}
