import 'package:flutter/material.dart';
import 'package:todolist_dtc/constant.dart';
import 'package:todolist_dtc/model/status.dart';
import 'package:todolist_dtc/model/todo_repository.dart';
import 'package:todolist_dtc/model/todos.dart';

class AddNewTask extends StatefulWidget {
    const AddNewTask({super.key});

    @override
    State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController? titleController;
    TextEditingController? descriptionController;
    String? status;
    List<Status> statusList = Status.getStatus();
    TodoRepository todoRepository = TodoRepository();

    @override
    void initState() {
        titleController = TextEditingController();
        descriptionController = TextEditingController();
        super.initState();
    }

    @override
    void dispose() {
        titleController?.dispose();
        descriptionController?.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Ajouter une tâche', style: TextStyle(color: AppColor.white)),
                centerTitle: true,
                backgroundColor: AppColor.primaryColor,
                leading: IconButton(
                    onPressed: (){
                        Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: AppColor.white,
                ),
            ),
            body:Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10,top: 50),
                                child: Column(
                                    children: [
                                        TextFormField(
                                            controller: titleController,
                                            validator: (value) {
                                                if (value!.isEmpty) {
                                                    return 'Veuillez entrer un titre';
                                                }
                                                return null;
                                            },
                                            decoration: const InputDecoration(
                                                labelText: 'Titre',
                                                border: OutlineInputBorder(),
                                            ),
                                        ),
                                        const SizedBox(height: 20,),
                                        TextFormField(
                                            controller: descriptionController,
                                            decoration: const InputDecoration(
                                                labelText: 'Description',
                                                border: OutlineInputBorder(),
                                            ),
                                        ),
                                        const SizedBox(height: 20,),
                                        
                                        // dropdown with status label
                                        DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                                labelText: 'Statut',
                                                border: OutlineInputBorder(),
                                            ),
                                            value: status,
                                            onChanged: (String? newValue) {
                                                setState(() {
                                                    status = newValue!;
                                                //  print('status: ${widget.status}');
                                                });
                                            },
                                            items: statusList.map((Status status) {
                                                return DropdownMenuItem(
                                                    value: status.name,
                                                    child: Text(status.name),
                                                );
                                            }).toList(),
                                        ),
                                
                                        const SizedBox(height: 20,),
                                
                                        ElevatedButton(
                                            onPressed: (){

                                                if (_formKey.currentState!.validate()) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(content: Text('Ajout avec succès'))
                                                    );
                                                    
                                                    Navigator.pop(context);
                                                }
                                                 
                                                setState(() {
                                                    todoRepository.addTodo(Todos(
                                                        title: titleController!.text,
                                                        description: descriptionController!.text,
                                                        status: status ?? 'En cours',
                                                    ));
                                                });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColor.primaryColor,
                                            ),
                                            child: const Text('Ajouter', style: TextStyle(color: AppColor.white)),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            )
        );
    }
}