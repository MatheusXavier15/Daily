import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` description is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'tasks_database.db'),
    // When the database is first created, create a table to store tasks.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, day TEXT, description TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}

// Define a function that inserts tasks into the database
Future<void> insertTaskPerDay(TaskPerDay task) async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Insert the TaskPerDay into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same task is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'tasks',
    task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print('Nova task inserida: ' + task.id.toString());
  tasks();
}

// A method that retrieves all the tasks from the tasks table.
Future<List<TaskPerDay>> tasks() async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Query the table for all The TaskPerDays.
  final List<Map<String, dynamic>> maps = await db.query('tasks');

  print('Lista de tasks: ');
  // Convert the List<Map<String, dynamic> into a List<TaskPerDay>.
  return List.generate(maps.length, (i) {
    print(maps[i].toString());
    return TaskPerDay(
      id: maps[i]['id'],
      day: maps[i]['day'],
      description: maps[i]['description'],
    );
  });
}

// A method that updates a task.
Future<void> updateTaskPerDay(TaskPerDay task) async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Update the given TaskPerDay.
  await db.update(
    'tasks',
    task.toMap(),
    // Ensure that the TaskPerDay has a matching id.
    where: 'id = ?',
    // Pass the TaskPerDay's id as a whereArg to prevent SQL injection.
    whereArgs: [task.id],
  );
}

// A method that deletes a task.
Future<void> deleteTaskPerDay(int id) async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Remove the TaskPerDay from the database.
  await db.delete(
    'tasks',
    // Use a `where` clause to delete a specific task.
    where: 'id = ?',
    // Pass the TaskPerDay's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

Future<int> getQtdTasks() async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Query the table for all The TaskPerDays.
  final List<Map<String, dynamic>> maps = await db.query('tasks');

  // Convert the List<Map<String, dynamic> into a List<TaskPerDay>.
  return maps.length;
}

// A method that create a database if that doens't exist and test some CRUD operations
void createDatabase() async {
  // Create a TaskPerDay and add it to the tasks table
  var taskTeste = TaskPerDay(
    id: 0,
    day: '15',
    description: 'Tarefa de teste',
  );

  await insertTaskPerDay(taskTeste);

  // Now, use the method above to retrieve all the tasks.
  print(await tasks()); // Prints a list that include taskTeste.

  // Update taskTeste's description and save it to the database.
  taskTeste = TaskPerDay(
    id: taskTeste.id,
    day: taskTeste.day,
    description: taskTeste.description,
  );
  await updateTaskPerDay(taskTeste);

  // Print the updated results.
  print(await tasks()); // Prints taskTeste with description 42.

  // Delete taskTeste from the database.
  await deleteTaskPerDay(taskTeste.id);

  // Print the list of tasks (empty).
  print(await tasks());
}

class TaskPerDay {
  final int id;
  final String day;
  final String description;

  TaskPerDay({required this.id, required this.day, required this.description});

  // Convert a TaskPerDay into a Map. The keys must correspond to the days of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day,
      'description': description,
    };
  }

  // Implement toString to make it easier to see information about
  // each task when using the print statement.
  @override
  String toString() {
    return 'TaskPerDay{id: $id, day: $day, description: $description}';
  }
}
