import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulu_project/screens/home_page.dart';

import 'blocs/task_bloc/task_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
   return  BlocProvider<TaskBloc>(
      create: (BuildContext context) => TaskBloc(),
      child: MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    ),
    );
   
  }
}
