import 'package:ad254a/info.dart';
import 'package:ad254a/myprofile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Color(0xFF390050), fontSize: 30),),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: Icon(Icons.account_circle_outlined),
        actions: [
          Icon(Icons.add),
          IconButton(onPressed: (){}, icon : Icon(Icons.ad_units_outlined))
        ],
      ),
      body: Stack(
        children : [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.redAccent,
                      Color(0xFFE5EC16)
                    ]
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  'https://png.pngtree.com/png-clipart/20230512/original/pngtree-isolated-cat-on-white-background-png-image_9158356.png',
                  height: 300,
                ),
              ),
              SizedBox(height: 50,),
              Text('Please select menu', style: TextStyle(color: Color(0xFF390050), fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9F6ECC)
                        ),
                          child: Text('Profile',style: TextStyle(color: Colors.black),),
                        )
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9F6ECC)
                        ),
                          child: Text('XXXXX',style: TextStyle(color: Colors.black),),
                        )
                    ),
                  ],
                ),
              ),
              // Image.asset('assets/cat.gif'),
              // Image.asset('assets/cat.gif'),
            ],
          ),
        ],
      ),
    );
  }
}