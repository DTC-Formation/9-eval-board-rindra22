import 'package:uuid/uuid.dart';

class Todos{
    String? id;
    String? title;
    String? description;
    String? date;
    int? priority;
    String? status;
    
    Todos({
        this.title,
        this.description,
        this.date,
        this.priority,
        this.status,
    }) : id = Uuid().v4();

    Todos.fromMap(Map<String, dynamic> map)
        : id = map['id'],
        title = map['title'],
        description = map['description'],
        date = map['date'],
        priority = map['priority'],
        status = map['status'];

}