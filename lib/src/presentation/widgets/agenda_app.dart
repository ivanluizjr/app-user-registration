import 'package:appagenda/src/presentation/widgets/home_page.dart';
import 'package:flutter/material.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
