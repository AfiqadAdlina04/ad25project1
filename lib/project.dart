import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ad254a/signin.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  // Database reference
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://iot-app-dfi24-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();

  double temperature = 0.0;
  double humidity = 0.0;
  double distance = 0.0;

  bool switch1 = false;
  bool switch2 = false;
  bool buzzer = false;

  @override
  void initState() {
    super.initState();
    _readSensorData();
    _readActuatorStatus();
  }

  void _readSensorData() {
    _dbRef.child("Sensor").onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          temperature = (data["temperature"] ?? 0).toDouble();
          humidity = (data["humidity"] ?? 0).toDouble();
          distance = (data["distance"] ?? 0).toDouble();
        });
      }
    });
  }

  void _readActuatorStatus() {
    _dbRef.child("Actuator").onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          switch1 = data["switch1"] ?? false;
          switch2 = data["switch2"] ?? false;
          buzzer = data["buzzer"] ?? false;
        });
      }
    });
  }

  void _updateSwitch(String name, bool value) {
    _dbRef.child("Actuator/$name").set(value);
  }

  Widget glassCard({required Widget child, Color? bgColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor ?? const Color.fromARGB(46, 255, 255, 255),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color.fromARGB(61, 255, 255, 255), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(64, 0, 0, 0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("IoT Home Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to SignIn page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()),
              );
            },
            tooltip: "Log Out",
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://4kwallpapers.com/images/walls/thumbs_3t/9602.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // SENSOR DATA
                glassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sensor Readings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Temperature : $temperature °C",
                          style: const TextStyle(color: Colors.white, fontSize: 16)),
                      Text("Humidity    : $humidity %",
                          style: const TextStyle(color: Colors.white, fontSize: 16)),
                      Text("Distance    : $distance cm",
                          style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),

                // LED1 SWITCH
                glassCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Switch 1 (LED 1)",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Switch(
                        value: switch1,
                        activeColor: Colors.greenAccent,
                        onChanged: (value) {
                          setState(() => switch1 = value);
                          _updateSwitch("switch1", value);
                        },
                      ),
                    ],
                  ),
                ),

                // LED2 SWITCH
                glassCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Switch 2 (LED 2)",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Switch(
                        value: switch2,
                        activeColor: Colors.greenAccent,
                        onChanged: (value) {
                          setState(() => switch2 = value);
                          _updateSwitch("switch2", value);
                        },
                      ),
                    ],
                  ),
                ),

                // BUZZER DISPLAY WITH ANIMATED COLOR
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: glassCard(
                    bgColor: buzzer ? Colors.green : Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Buzzer Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          buzzer ? "BUZZER ACTIVE 🔴" : "BUZZER OFF ⚪",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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