import 'package:flutter/material.dart';
import 'models/task.dart';
import 'task_card.dart';

class TaskForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskFormState();
  }
}

class TaskFormState extends State<TaskForm> {
  List<Task> tasks = [];
  final TextEditingController controller = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: (Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          renderHeader(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: renderForm(width, controller),
          ),
          TaskCards(tasks)
        ],
      )),
    );
  }

  renderForm(width, controller) {
    return (Form(
      key: formKey,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            color: Colors.grey[100],
            width: width * 0.75,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value.length < 1) {
                  return 'Insert a Task';
                }
              },
              onSaved: (value) {
                Task task = new Task(value);
                setState(() {
                  tasks.add(task);
                });
                controller.clear();
              },
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
          ),
          Expanded(
            child: RawMaterialButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                }
              },
              child: new Icon(
                Icons.add,
                color: Colors.white,
                size: 15.0,
              ),
              shape: new CircleBorder(),
              fillColor: Colors.red,
              padding: const EdgeInsets.all(5.0),
            ),
          ),
        ],
      ),
    ));
  }

  renderHeader() {
    return (Container(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 5.00,
        right: 5.00,
        bottom: 20.00,
      ),
      child: Text(
        'Insert a new Task',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
    ));
  }
}
