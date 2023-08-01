import 'package:todolist_dtc/model/status.dart';
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

}