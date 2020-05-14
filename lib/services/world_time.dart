import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; //if day time or not
  String country;
  String cas;
  String toCas;
  String death;
  String todeath;
  String recov;
  String actv;
  String crit;
  String cpom;

  WorldTime({ this.country, this.location, this.flag, this.url });

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Response response2 = await get('https://coronavirus-19-api.herokuapp.com/countries/$country');
      Map data = jsonDecode(response.body);
      Map data2 = jsonDecode(response2.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String cases = data2['cases'].toString();
      String todayCases = data2['todayCases'].toString();
      String deaths = data2['deaths'].toString();
      String todayDeaths = data2['todayDeaths'].toString();
      String recovered = data2['recovered'].toString();
      String active = data2['active'].toString();
      String critical = data2['critical'].toString();
      String casesPerOneMillion = data2['casesPerOneMillion'].toString();
      //print(datetime);
      print(cases);

      //create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));



      //set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      cas = cases;
      toCas = todayCases;
      death = deaths;
      todeath = todayDeaths;
      recov = recovered;
      actv = active;
      crit = critical;
      cpom = casesPerOneMillion;


    }
    catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }


  }
}

