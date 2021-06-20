import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          'Ninja ID Card'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ninjaLevel+=1;
          });
        },
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Colors.grey[500],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50.0, 30.0,50.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
               backgroundImage: AssetImage('images/d.png'),
                maxRadius: 50.0,
              ),
            ),
            Divider(
              height: 80.0,
              color: Colors.grey[400],
            ),
            Text(
              'NAME',
              style: TextStyle(
                letterSpacing: 2.0,
                color: Colors.grey[200]
              ),
            ),
            SizedBox(height: 8,),
            Text(
              'Thiran Dev',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 2.0,
                  color: Colors.amber[300]
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.grey[200]
              ),
            ),
            SizedBox(height: 8,),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 2.0,
                  color: Colors.amber[300]
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey[200],
                ),
                SizedBox(width: 15,),
                Text(
                  'thiranhetiiarachchi@gmail.com',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.0,
                      color: Colors.grey[200],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


