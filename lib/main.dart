import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scooter_app/presentation/cubits/cubit.dart';
import 'package:scooter_app/presentation/screens/homepage.dart';
import 'package:scooter_app/repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Cambiar baseUrl por jsonFilePath para utilizar datos locales
    final DataRepository dataRepository = DataRepository(jsonFilePath: 'assets/data.json');

    return MultiBlocProvider(
      providers: [
        BlocProvider<DataCubit>(
          create: (context) => DataCubit(dataRepository: dataRepository)..fetchData(),
        ),
      ],
      child: MaterialApp(
        title: 'Computer Systems Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
