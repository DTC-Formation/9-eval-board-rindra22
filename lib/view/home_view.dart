import 'package:flutter/material.dart';
import 'package:todolist_dtc/constant.dart';
import 'package:todolist_dtc/model/status.dart';
import 'package:todolist_dtc/model/todo_repository.dart';
import 'package:todolist_dtc/model/todos.dart';

class HomeView extends StatefulWidget {
    HomeView({super.key});

    @override
    State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    TodoRepository todoRepository = TodoRepository();
    List<Status> status = Status.getStatus();


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: ValueListenableBuilder(
                valueListenable: TodoRepository(),
                builder: (context, value, child){
                    final todos = value;
                    return ListView(
                        children: [
                            const SizedBox(height: 20,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                    Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                                IconButton(
                                                    onPressed: (){
                                                        Navigator.pushNamed(context, '/add-new-task');
                                                    },
                                                    icon: const Icon(Icons.add),
                                                    color: AppColor.white,
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                            ),

                            // filter by status si todo.status == "En cours"
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text('En cours',style: TextStyle(fontSize: 20),),
                            ),
                            const SizedBox(height: 20,),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: todos.length,
                                itemBuilder: (context, index){
                                    final todo = todos[index];
                                    final getInfo = todoRepository.getAllTodos()[index];
                                    return getInfo.status == "En cours" ? Dismissible(
                                        key: Key(todo.id ?? ''),
                                        onDismissed: (direction){
                                            setState(() {
                                                todoRepository.deleteTodoById(todo.id ?? '');
                                            });
                                        },
                                        child: Card(
                                            child: ListTile(
                                                title: Text(getInfo.title ?? ''),
                                                subtitle: Text(getInfo.description ?? ''),
                                                trailing: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                        IconButton(
                                                            onPressed: (){
                                                                setState(() {
                                                                    // todoRepository.getAllTodos()[index].status = 1;
                                                                    todoRepository.deleteTodoById(todoRepository.getAllTodos()[index].id ?? '');
                                                                });
                                                            },
                                                            icon: const Icon(Icons.delete),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ) : const SizedBox();
                                },
                            ),

                            // filter by status si todo.status == "Bloqué"

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text('Bloqué',style: TextStyle(fontSize: 20),),
                            ),

                            const SizedBox(height: 20,),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: todos.length,
                                itemBuilder: (context, index){
                                    final todo = todos[index];
                                    final getInfo = todoRepository.getAllTodos()[index];
                                    return getInfo.status == "Bloqué" ? Dismissible(
                                        key: Key(todo.id ?? ''),
                                        onDismissed: (direction){
                                            setState(() {
                                                todoRepository.deleteTodoById(todo.id ?? '');
                                            });
                                        },
                                        child: Card(
                                            child: ListTile(
                                                title: Text(getInfo.title ?? ''),
                                                subtitle: Text(getInfo.description ?? ''),
                                                trailing: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                        IconButton(
                                                            onPressed: (){
                                                                setState(() {
                                                                    // todoRepository.getAllTodos()[index].status = 1;
                                                                    todoRepository.deleteTodoById(todoRepository.getAllTodos()[index].id ?? '');
                                                                });
                                                            },
                                                            icon: const Icon(Icons.delete),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ) : const SizedBox();
                                },
                            ),

                            // filter by status  si todo.status == "Terminé"

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text('Terminé',style: TextStyle(fontSize: 20),),
                            ),

                            const SizedBox(height: 20,),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: todos.length,
                                itemBuilder: (context, index){
                                    final todo = todos[index];
                                    final getInfo = todoRepository.getAllTodos()[index];
                                    return getInfo.status == "Terminé" ? Dismissible(
                                        key: Key(todo.id ?? ''),
                                        onDismissed: (direction){
                                            setState(() {
                                                todoRepository.deleteTodoById(todo.id ?? '');
                                            });
                                        },
                                        child: Card(
                                            child: ListTile(
                                                title: Text(getInfo.title ?? ''),
                                                subtitle: Text(getInfo.description ?? ''),
                                                trailing: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                        IconButton(
                                                            onPressed: (){
                                                                setState(() {
                                                                    // todoRepository.getAllTodos()[index].status = 1;
                                                                    todoRepository.deleteTodoById(todoRepository.getAllTodos()[index].id ?? '');
                                                                });
                                                            },
                                                            icon: const Icon(Icons.delete),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ) : const SizedBox();
                                },
                            ),
                        ],
                    );
                }
            ),
        );
    }
}