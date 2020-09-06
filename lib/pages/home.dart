import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
    //get data from loading  dart
    data = data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    print(data);

    // set background
    String bgImage=data['isDay']? 'mng.jpg': 'night1.jpeg';
    Color bgColor=data['isDay']? Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: bgColor ,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,128,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data ={
                      'time':result['time'],
                        'location':result['location'],
                        'flag':result['flag'],
                        'isDay':result['isDay'],

                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color:Colors.white,

                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,

                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
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
