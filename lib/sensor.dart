import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {

  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-dfi24-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();


  String rssiValue = '-23';

//funtion block

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readSensor();
  }

  //Read data from firebase
  void _readSensor () {
    _dbRef
        .child('Sensor/rssi')
        .onValue
        .listen(
            (event) {
          final Object? rssiData = event.snapshot.value;
          setState(() {
            rssiValue = rssiData.toString();
          });
        }

    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Reading'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.network_wifi,
                  size: 60,
                  color: Colors.teal,
                ),
                const SizedBox(height: 10),
                const Text(
                  'RSSI Signal Strength',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$rssiValue dBm',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


