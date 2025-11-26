import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,

      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, 4)
                    )
                  ]

              ),
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/me.jpg', height: 200,),
              ),
            ),
          ),
          Card(
            color: Color(0xffc64cd8),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name; Nur Afiqah Adlina Binti Mohd Azmi", style: TextStyle(fontSize: 20)),
                SizedBox(height : 8),
                Text("ID DFI2401007", style: TextStyle(fontSize: 20)),
                SizedBox(height : 8),
                Text("Email: nurafiqah@gmail.com" , style: TextStyle(fontSize: (16))),
                SizedBox(height: 8),
                Text("Class: 4A" , style: TextStyle(fontSize: (16))),
                SizedBox(height: 8),
                Text("Address: Pelabuhan Klang" , style: TextStyle(fontSize: (16))),
                SizedBox(height: 8),
                Text("Phone Number: 0182443418" , style: TextStyle(fontSize: (16))),
                SizedBox(height: 8),

              ],
            ),),

          )





        ],
      ),
    );
  }
}