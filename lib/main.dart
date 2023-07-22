import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plutofirstmusic/screens/hometracks.dart';

import 'BLOC/bloc/trackbloc_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TrackblocBloc(), // Initialize the Bloc here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeTracks(),
    );
  }
}
