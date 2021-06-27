import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try{
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));

      isDayTime = now.hour > 6 && now.hour <20;

      //set the time property
      time = DateFormat.jm().format(now);
    }catch(e){
      print('Caught Error: $e');
    }
  }

}