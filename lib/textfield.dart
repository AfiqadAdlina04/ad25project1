import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextfieldState();
}

class _TextfieldState extends State<TextFieldPage> {

  var nameController = TextEditingController();
  var classController = TextEditingController();
  var studentNumberController = TextEditingController();

  String _name = '';
  String _class = '';
  String _studentNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Text Field Exercise'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Please Insert your details'),
          SizedBox(height: 20,),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'Enter Your Name'
            )
          ),
          SizedBox(height: 20,),
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Class',
                  hintText: 'Enter Your Class'
              )
          ),
          SizedBox(height: 20,),
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Student Number',
                  hintText: 'Enter Your Student Number'
              ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            setState(() {
              _name = nameController.text;
              _class = classController.text;
              _studentNumber = studentNumberController.text;
            });
          }, child: Text('Submit')),
          SizedBox(height: 50),
          Text('My name is $_name'),
          Text('My class is $_class'),
          Text('My student number is $_studentNumber'),
        ],
      ),
    );
  }
}
