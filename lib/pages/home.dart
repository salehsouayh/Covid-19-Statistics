import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Text(
                  'COVID-19',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
                FlatButton.icon(onPressed: () async {
                 dynamic result = await Navigator.pushNamed(context, '/location');
                 setState(() {
                   data = {
                     'time' : result['time'],
                     'location' : result['location'],
                     'isDayTime' : result['isDayTime'],
                     'flag' : result['flag'],
                     'country': result['country'],
                     'cas': result['cas']
                   };
                 });
                },

                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Change Country',
                       style: TextStyle(
                         color: Colors.grey[300],
                         fontSize: 25.0,
                       ),
                    )
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['country'],
                      style: TextStyle(
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text('Total Cases: '+
                  data['cas'] + ' | Today Cases: '+data['toCas'] ,
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text('Total Deaths: '+
                    data['death'] + ' | Today Deaths: '+data['todeath'] ,
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text('Recovered: '+
                    data['recov'] + ' | Critical: '+data['crit'] ,
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text('Active: '+
                    data['actv'],
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text('Cases Per One Million: '+
                    data['cpom'],
                  style: TextStyle(
                    fontSize: 21.0,
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
