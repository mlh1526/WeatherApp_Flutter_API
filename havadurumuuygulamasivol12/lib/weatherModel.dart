class Weather {
  var cityname;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;
  Weather() {
    this.cityname;
    this.icon;
    this.condition;
    this.temp;
    this.wind;
    this.humidity;
    this.wind_dir;
    this.gust;
    this.uv;
    this.pressure;
    this.pricipe;
    this.last_update;
  }
  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    pressure = json['current']['pressure_mb'];
    pricipe = json['current']['precip_mm'];
    last_update = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
  }
}
