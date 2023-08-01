import 'package:flutter/material.dart';
import 'package:todolist_dtc/model/status.dart';

class FormInput extends StatefulWidget {
    TextEditingController? titleController;
    TextEditingController? descriptionController;
    Function? saveData;
    String? status;

    FormInput({super.key, this.titleController, this.descriptionController, this.saveData, this.status});

    @override
    State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {

    List<Status> statusList = Status.getStatus();

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                TextField(
                    controller: widget.titleController,
                    decoration: const InputDecoration(
                        labelText: 'Titre',
                        border: OutlineInputBorder(),
                    ),
                ),
                const SizedBox(height: 20,),
                TextField(
                    controller: widget.descriptionController,
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
                    value: widget.status,
                    onChanged: (String? newValue) {
                        setState(() {
                            widget.status = newValue!;
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
                        widget.saveData!();
                    },
                    child: const Text('Ajouter'),
                ),
            ],
        );
    }
}