import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  List colorNight = [Colors.grey[300],Colors.white];
  List colorDay = [Colors.grey[600],Colors.black];

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg':'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.blueGrey[900];
    List fontColor = data['isDaytime'] ? colorDay : colorNight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,150.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed:()async{
                      dynamic results = await Navigator.pushNamed(context,'/location');
                      setState(() {
                        data = {
                          'time': results['time'],
                          'location' : results['location'],
                          'isDaytime':results['isDaytime'],
                          'flag':results['flag']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: fontColor[0],
                      size: 20.0,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle( color: fontColor[0],fontSize: 18.0),
                    )
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: fontColor[1],
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                      color: fontColor[1],
                      fontWeight: FontWeight.w200
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
