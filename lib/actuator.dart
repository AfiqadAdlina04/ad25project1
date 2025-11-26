import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ActuatorPage extends StatefulWidget {
  const ActuatorPage({super.key});

  @override
  State<ActuatorPage> createState() => _ActuatorPageState();
}

class _ActuatorPageState extends State<ActuatorPage> {

  //Variable declaration ----------------------
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-dfi24-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();

  bool switch1 = false;

  //Initialize page ---------------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSwitchStatus();
  }


  //Function block ----------------------------

  void _loadSwitchStatus(){
    _dbRef.child('Actuator/switch1').onValue.listen((event){
      setState(() {
        switch1 = event.snapshot.value as bool? ?? false;
      });
    });
  }

  void _updateSwitch1(bool value){
    _dbRef.child('Actuator/switch1').set(value);
    setState(() {
      switch1 = value;
    });
  }

  //default widget build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actuator Control'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Card(
          elevation: 3,
          child: ListTile(
            title: Text('Switch 1'),
            subtitle: Text('Lab B1.11'),
            trailing: Switch(
                value: switch1,
                onChanged: (bool value){
                  _updateSwitch1(value);
                }
            ),
          )
          )
          ],
        ),
      ),
    );
  }
}