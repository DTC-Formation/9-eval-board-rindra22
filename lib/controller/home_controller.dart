import 'package:flutter/material.dart';
import 'package:todolist_dtc/constant.dart';
import 'package:todolist_dtc/view/home.dart';

class HomeController extends StatefulWidget {
    const HomeController({super.key});

    @override
    State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Todo List', style: TextStyle(color: AppColor.white)),
                centerTitle: true,
                backgroundColor: AppColor.primaryColor,
            ),
            body: Home(),
        );
    }
}