import 'package:flutter/material.dart';
import 'package:todolist_dtc/controller/home_controller.dart';
import 'package:todolist_dtc/view/add_new_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
            ),
            home: const HomeController(),
            routes: {
                '/home': (context) => const HomeController(),
                '/add-new-task': (context) => const AddNewTask(),
            },
        );
    }
}
