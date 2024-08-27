import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extraa/presentation/cubits/cubit.dart';
import 'package:extraa/presentation/screens/homepage.dart';
import 'package:extraa/repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Se crea una instancia del DataRepository con la ruta al archivo JSON local
    final DataRepository dataRepository = DataRepository(jsonFilePath: 'assets/data.json');

    return MultiBlocProvider(
      providers: [
        BlocProvider<DataCubit>(
          // Se crea el DataCubit y se realiza la primera carga de datos llamando a fetchData()
          create: (context) => DataCubit(dataRepository: dataRepository)..fetchData(),
        ),
      ],
      child: MaterialApp(
        title: 'Computer Systems Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(), // La HomePage será la pantalla inicial de la aplicación
      ),
    );
  }
}
