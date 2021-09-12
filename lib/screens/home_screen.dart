import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todos = <String>[];
  String todo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Please enter a todo'),
              onChanged: (String value) {
                setState(() {
                  todo = value;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, i) {
                    return Card(
                        child: ListTile(
                            onTap: () {
                              setState(() {
                                todos.removeAt(i);
                              });
                            },
                            title: Text(todos[i]),
                            trailing: const Icon(Icons.delete)));
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            setState(() {
              todos.add(todo);
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
