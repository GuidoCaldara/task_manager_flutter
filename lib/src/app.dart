import 'package:flutter/material.dart';
import 'taskform.dart';

class App extends StatelessWidget {
  
  Widget build(context){
      return (
    MaterialApp(
      title: "Guido's Task Manager",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Guido\'s Task Manager '),
        ),
        body: TaskForm()
        )
    )
  );

  }
}