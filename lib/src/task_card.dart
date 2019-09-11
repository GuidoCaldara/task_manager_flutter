import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'models/task.dart';

class TaskCards extends StatelessWidget {
  final List<Task> tasks;
  TaskCards(this.tasks);

  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
     return Expanded(
       child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, int index){
        return Container(
          padding: EdgeInsets.only(bottom: 10),
          child: cardBox(width, tasks[index])
        );
      },
    ),
     );
  }}


  cardBox(width, task) {
    return (Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: (BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
          left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
          right: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
        ),
      )),
      width: width * 0.9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 10.00, bottom: 10.00),
              child: Text(task.content),
            ),
          ),
          Expanded(
              child: Container(
            width: 0.3 * width,
            child: RawMaterialButton(
              child: new Icon(
                Icons.close,
                color: Colors.black54,
                size: 25.0,
              ),
              shape: CircleBorder(),
              padding: const EdgeInsets.all(5.0),
            ),
          )),
        ],
      ),
    ));
  }

// return
