import 'package:flutter/material.dart';
import 'package:todolist_dtc/constant.dart';
import 'package:todolist_dtc/model/status.dart';
import 'package:todolist_dtc/model/todo_repository.dart';

class Home extends StatefulWidget {
    Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                           /*  Padding(
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
                            ), */
                            Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                                child: const Text('Statistiques',style: TextStyle(fontSize: 20),)
                            ),

                            const SizedBox(height: 20,),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: AppColor.kYellowDark,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                            children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        // total des tâches en cours
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.pending_actions, color: AppColor.white,),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                                todoRepository.getAllTodos().where((element) => element.status == "En cours").length.toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: AppColor.white
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),

                                                const Text(
                                                    'En cours', 
                                                    style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),

                                    Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: AppColor.kBlueDark,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                            children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.done, color: AppColor.white,),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                                todoRepository.getAllTodos().where((element) => element.status == "Terminé").length.toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: AppColor.white
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),

                                                const Text(
                                                    'Terminé', 
                                                    style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                    
                                ],
                            ),

                            const SizedBox(height: 20,),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: AppColor.kRedDark,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                            children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        // total des tâches en cours
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.block, color: AppColor.white,),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                                todoRepository.getAllTodos().where((element) => element.status == "Bloqué").length.toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: AppColor.white
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),

                                                const Text(
                                                    'Bloqué', 
                                                    style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),

                                    Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: AppColor.kGreenDark,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                            children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(Icons.done_all, color: AppColor.white,),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                                todoRepository.getAllTodos().length.toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: AppColor.white
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),

                                                const Text(
                                                    'Total', 
                                                    style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ],
                            )


                        ],
                    );
                }
            ),
        );
    }
}