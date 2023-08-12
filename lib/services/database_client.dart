import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist_dtc/model/todos.dart';

class DatabaseClient{
    Database? _database;

    Future<Database> get database async {
        if (_database != null) {
        return database;
        } else {
        return await createDatabase();
        }
    }

    Future<Database> createDatabase() async {
        //recuperer les dossiers dans l'application
        Directory directory = await getApplicationDocumentsDirectory();
        //Creer un chemin pour la DB
        final path = join(directory.path, "database_todos.db");
        return await openDatabase(path, version: 1, onCreate: onCreate);
    }

    onCreate(Database database, int version) async {
        await database.execute('''
            CREATE TABLE todos (
            id String PRIMARY KEY, 
            title TEXT NOT NULL,
            date TEXT NULL,
            description TEXT NOT NULL,
            priority INTEGER NULL,
            status TEXT NULL
            )
        ''');
    }

    Future<List<Todos>> allLists() async {
        //recuperer le DB
        Database db = await database;
        //faire une query ou demande
        const query = 'SELECT * FROM todos';
        //recuperer les resultats
        List<Map<String, dynamic>> results = await db.rawQuery(query);
        //List<Map<String, dynamic>> results = await db.query("list");
        List<Todos> lists = [];
        results.forEach((map) {
            lists.add(Todos.fromMap(map));
        });
        //ou return results.map((map) => WishList.fromMap(map)).toList();
        return lists;
    }

    //Ajouter données
    Future<bool> addTodosList(String id,String title,String description, String status) async {
        //recuperer le DB
        Database db = await database;
        // inserer dans la DB
        await db.insert("todos", {"id": id, "title": title, "description": description, "status": status});
        //notifier le changement terminé
        return true;
    }

    //Modifier données

    Future<bool> updateTodosList(String id, String title,String description, String status) async {
        //recuperer le DB
        Database db = await database;
        // inserer dans la DB
        await db.update("todos", {"title": title, "description": description, "status": status}, where: "id = ?", whereArgs: [id]);
        //notifier le changement terminé
        return true;
    }

    //Supprimer données
    Future<bool> deleteTodosList(String id) async {
        //recuperer le DB
        Database db = await database;
        // supprimer dans la DB
        await db.delete("todos", where: "id = ?", whereArgs: [id]);
        //notifier le changement terminé
        return true;
    }
}