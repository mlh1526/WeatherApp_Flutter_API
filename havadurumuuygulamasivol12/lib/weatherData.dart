import 'dart:convert';

import 'package:havadurumuuygulamasivol12/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=6c7505b85f1e4dbf825153356220408&q=$latitude,$longitude&aqi=no');
    var responce = await http.get(uriCall);
    var body = jsonDecode(responce.body);
    return Weather.fromJson(body);
  }
}
