import 'package:flutter/material.dart';
import 'package:todolist_dtc/model/todos.dart';

class TodoRepository extends ValueNotifier<List<Todos>>{

    static List<Todos> todos = [];
    TodoRepository._sharedInstance() : super(todos);
    static final TodoRepository _instance = TodoRepository._sharedInstance();
    factory TodoRepository() => _instance;

    List<Todos> getAllTodos(){
        return value.length > 0 ? value : [];
    }

    void addTodo(Todos todo){
        final newTodo = value;
        newTodo.add(todo);

        notifyListeners();

    }

    void deleteTodoById(String id){
        final newTodo = value;
        newTodo.removeWhere((element) => element.id == id);

        notifyListeners();
    }
}