import 'package:flutter/material.dart';
import 'package:learning_bloc/blocs/user_bloc.dart';
import 'dart:async';
import 'pages/stream_counter_page.dart';
import 'widgets/bloc_provider.dart';
import 'blocs/counter_bloc.dart';
import 'pages/bloc_counter_page.dart';
import 'package:learning_bloc/pages/bloc_user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: UserBloc(),
        child: BlocUserPage(),
      ),
    );
  }
}

