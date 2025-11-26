import 'package:flutter/material.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SmartHomePage(),
    );
  }
}

class SmartHomePage extends StatefulWidget {
  const SmartHomePage({super.key});

  @override
  State<SmartHomePage> createState() => _SmartHomePageState();
}

class _SmartHomePageState extends State<SmartHomePage> {
  bool livingLight = false;
  bool bedroomLight = true;
  bool doorLocked = true;
  double temperature = 23.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: const Text(
          'Smart Home Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFFF1F3F4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchCard(
              icon: Icons.lightbulb_outline,
              title: 'Living Room Light',
              color: Colors.orange,
              value: livingLight,
              onChanged: (val) => setState(() => livingLight = val),
            ),
            const SizedBox(height: 16),
            _buildSwitchCard(
              icon: Icons.bed_outlined,
              title: 'Bedroom Light',
              color: Colors.purple,
              value: bedroomLight,
              onChanged: (val) => setState(() => bedroomLight = val),
            ),
            const SizedBox(height: 16),
            _buildDoorCard(),
            const SizedBox(height: 16),
            _buildTemperatureCard(),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All settings applied!')),
                );
              },
              icon: const Icon(Icons.power_settings_new),
              label: const Text('Apply Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchCard({
    required IconData icon,
    required String title,
    required Color color,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(fontSize: 16)),
          ),
          Switch(
            value: value,
            activeColor: color,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildDoorCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor:
            doorLocked ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
            child: Icon(
              doorLocked ? Icons.lock_outline : Icons.lock_open_outlined,
              color: doorLocked ? Colors.red : Colors.green,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              doorLocked ? 'Front Door Locked' : 'Front Door Unlocked',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            onPressed: () => setState(() => doorLocked = !doorLocked),
            icon: Icon(
              doorLocked ? Icons.lock_open : Icons.lock,
              color: doorLocked ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFFE0F2F1),
                child: Icon(Icons.thermostat, color: Colors.teal, size: 26),
              ),
              SizedBox(width: 16),
              Text('Temperature', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          Slider(
            value: temperature,
            min: 16,
            max: 30,
            divisions: 14,
            label: '${temperature.round()}°C',
            activeColor: Colors.teal,
            onChanged: (val) => setState(() => temperature = val),
          ),
          Center(
            child: Text(
              '${temperature.round()} °C',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
