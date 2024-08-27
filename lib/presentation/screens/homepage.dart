import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extraa/presentation/cubits/cubit.dart';
import 'package:extraa/presentation/cubits/state.dart';
import 'package:extraa/repository/repository.dart';
import 'package:extraa/ui/dropdownbutton.dart';
import 'package:extraa/ui/listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Systems Management'),
      ),
      body: BlocProvider(
        // Proporciona la ruta del archivo JSON local en lugar de una URL
        create: (_) => DataCubit(dataRepository: DataRepository(jsonFilePath: 'assets/data.json'))..fetchData(),
        child: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DataLoaded) {
              return Column(
                children: [
                  ManufacturerDropdown(
                    manufacturers: state.manufacturers,
                    onSelected: (manufacturer) {
                      // Acción cuando se selecciona un fabricante.
                    },
                  ),
                  Expanded(child: ComponentTypesList(componentTypes: state.componentTypes)),
                  // Muestra otros widgets según corresponda.
                ],
              );
            } else if (state is DataError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('Bienvenido a la aplicación'));
          },
        ),
      ),
    );
  }
}
