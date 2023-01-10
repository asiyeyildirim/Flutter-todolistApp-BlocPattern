import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/ui/cubit/anasayfa_cubit.dart';
import 'package:todoapp/ui/cubit/gorev_detay_cubit.dart';
import 'package:todoapp/ui/cubit/gorev_kayit_cubit.dart';
import 'package:todoapp/ui/screen/Anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => GorevKayitCubit()),
      BlocProvider(create: (context) => GorevDetayCubit()),
      BlocProvider(create: (context) => AnasayfaCubit()),

    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    ),
    );

  }
}
