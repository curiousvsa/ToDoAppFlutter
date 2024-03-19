import 'package:flutter/material.dart';
import 'package:todo_application/util/dialogue_box.dart';
import 'package:todo_application/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text Controller
  final _controller = TextEditingController();

  //Task List
  List toDoList = [
    ["Make List Data", false],
    ["Do Exercise", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 238, 159, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 238, 159, 253),
        title: const Text('TO DO APPLICATION'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value!, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    print(toDoList);
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }
}
