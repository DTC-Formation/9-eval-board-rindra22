import 'package:flutter/material.dart';
import 'package:todolist_dtc/constant.dart';
import 'package:todolist_dtc/model/status.dart';
import 'package:todolist_dtc/model/todo_repository.dart';
import 'package:todolist_dtc/model/todos.dart';
import 'package:todolist_dtc/services/database_client.dart';

class Home extends StatefulWidget {
    Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    // TodoRepository todoRepository = TodoRepository();
    String? statusValue = "En cours";

    List<Status> status = Status.getStatus();

    List<Todos> todos = [];

    @override
    void initState() {
        getTodosList();
        super.initState();
    }

    getTodosList() async {
        final fromDb = await DatabaseClient().allLists();
       // print("Length : " + fromDb.length.toString());
        setState(() {
            todos = fromDb;
        });
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: ListView(
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
                                                       // todoRepository.getAllTodos().where((element) => element.status == "En cours").length.toString(),
                                                        todos.where((element) => element.status == "En cours").length.toString(),
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
                                                        // todoRepository.getAllTodos().where((element) => element.status == "Terminé").length.toString(),
                                                        todos.where((element) => element.status == "Terminé").length.toString(),
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
                                                       //  todoRepository.getAllTodos().where((element) => element.status == "Bloqué").length.toString(),
                                                        todos.where((element) => element.status == "Bloqué").length.toString(),
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
                                                       //  todoRepository.getAllTodos().length.toString(),
                                                        todos.length.toString(),
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
                    ),

                    const SizedBox(height: 20,),

                    SizedBox(
                        width: 200,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                Row(
                                    children: [
                                        const Text(
                                            'Filtre par statut',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Icon(Icons.filter_alt_outlined, color: AppColor.kGreenDark,),
                                    ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DropdownButton(
                                        value: statusValue,
                                        onChanged: (value){
                                            setState(() {
                                                statusValue = value as String;
                                            });
                                        },
                                        items: status.map((val) => DropdownMenuItem(
                                            value: val.name,
                                            child: Text(val.name),
                                        )).toList(),
                                    ),
                                ),
                            ],
                        ),
                    ),

                    const SizedBox(height: 10,),

                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index){
                            final todo = todos[index];
                            // final getInfo = todoRepository.getAllTodos()[index];
                            final getInfo = todos[index];
                            return getInfo.status == statusValue ? Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction){
                                    setState(() {
                                        // todoRepository.deleteTodoById(todo.id ?? '');
                                        // todos.removeWhere((element) => element.id == todo.id);
                                        DatabaseClient().deleteTodosList(todo.id ?? '').then((onSuccess){
                                            getTodosList();
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tâche supprimée avec succès')));
                                        });
                                    });
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Card(
                                        color: AppColor.white,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Stack(
                                            children: [
                                                // add badge status
                                                Positioned(
                                                    top: 5,
                                                    right: 10,
                                                    child: Container(
                                                        padding: const EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            color: statusValue == "En cours" ? AppColor.kBlueDark : statusValue == "Terminé" ? AppColor.kGreenDarkDone : AppColor.kRedDark,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Text(
                                                            todo.status ?? '',
                                                            style: const TextStyle(
                                                                color: AppColor.white,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                    
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 15),
                                                    child: ListTile(
                                                        title: Text(getInfo.title ?? ''),
                                                        subtitle: Text(getInfo.description ?? ''),
                                                        trailing: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                                IconButton(
                                                                    onPressed: (){
                                                                        setState(() {
                                                                            /* todoRepository.updateTodoById(todo.id ?? '', Todos(
                                                                                title: todo.title,
                                                                                description: todo.description,
                                                                                status: "Terminé",
                                                                            )); */
                                                                            DatabaseClient().updateTodosList(
                                                                                getInfo.id as String,
                                                                                getInfo.title as String,
                                                                                getInfo.description as String,
                                                                                "Terminé",
                                                                            ).then((onSuccess){
                                                                                getTodosList();
                                                                            });
                                                                        });
                                                                    },
                                                                    icon: const Icon(Icons.done, color: AppColor.kGreenDarkDone,),
                                                                ),
                                                                IconButton(
                                                                    onPressed: (){
                                                                        setState(() {
                                                                            /* todoRepository.updateTodoById(todo.id ?? '', Todos(
                                                                                title: todo.title,
                                                                                description: todo.description,
                                                                                status: "Bloqué",
                                                                            )); */
                                                                            DatabaseClient().updateTodosList(
                                                                                getInfo.id as String,
                                                                                getInfo.title as String,
                                                                                getInfo.description as String,
                                                                                "Bloqué",
                                                                            ).then((onSuccess){
                                                                                getTodosList();
                                                                            });
                                                                        });
                                                                    },
                                                                    icon: const Icon(Icons.block, color: AppColor.kRedDarkBocked,),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ]
                                        ),
                                    ),
                                ),
                            ) : const SizedBox();
                        },
                    ),

                ],
            )
        );
    }
}