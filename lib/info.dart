import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Info', style: TextStyle(color: Color(0xFFFF3030), fontSize: 30),),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        leading: Icon(Icons.account_circle_outlined),
      ),
      body: Column(
        children:[
        ],
      ),
    );
  }
}

