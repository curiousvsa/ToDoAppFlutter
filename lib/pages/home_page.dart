import 'package:flutter/material.dart';
import 'package:todo_application/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value!, index));
        },
      ),
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
}
