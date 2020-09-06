import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class WorldTime{
  String location;//location name of the ui
  String time;//the time of that location
  String flag;//url of assets flag icon
  String url;//Location url foe api end point
  bool isDay;//true or false is a day ti me or not


  WorldTime({this.location,this.flag,this.url});

  Future <void> getTime() async {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print (data);

      //get respone for data time
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);
      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      //set the time property
      isDay= now.hour >6 && now.hour<20 ? true : false ;
      time=DateFormat.jm().format(now);
  }
}

