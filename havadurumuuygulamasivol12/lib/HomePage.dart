import 'package:flutter/material.dart';
import 'package:havadurumuuygulamasivol12/weatherData.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMMM, yyyy').format(dayInfo);

class _HomePageState extends State<HomePage> {
  var client = WeatherData();
  var data;

  info() async {
    //var position = await GetPosition();
    data = await client.getData('51.52', '-0.11');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FutureBuilder(
                future: info(),
                builder: ((context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.7,
                        padding: EdgeInsets.only(top: 30),
                        margin: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff955cd1),
                                Color(0xff3fa2fa),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.2, 0.88]),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${data?.cityname}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              dateFormat,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15,
                                fontFamily: 'Hubballi',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //Image.asset(
                            // 'assets/images/sunny_2.png',
                            // width: size.width * 0.2,
                            //  ),
                            Image.network(
                              'https:${data?.icon}',
                              width: size.width * 0.25,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${data?.condition}',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 25,
                                  fontFamily: 'MavenPro'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${data?.temp}',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 45,
                                  fontFamily: 'MavenPro'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/54298.png',
                                        width: size.width * 0.2,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.wind}',
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Wind',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/cloud_1.png',
                                        width: size.width * 0.2,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Text(
                                        '${data?.humidity}',
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Humidity',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/windirection_1.png',
                                        width: size.width * 0.2,
                                      ),
                                      Text(
                                        '${data?.wind_dir}',
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Wind direction',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Gust',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.gust} kp/h',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.pressure} hpa',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'UV',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.uv}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  'Precipitacion',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.pricipe} mm ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.wind} kp/h',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  'Last Update',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                Text(
                                  '${data?.last_update} ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }))));
  }
}
