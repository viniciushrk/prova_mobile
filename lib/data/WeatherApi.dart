import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dtos/WeatherDto.dart';

const baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=97886118f4931c3424b870899c0abf18";

class WeatherApi {
  Future<WeatherDto?> pesquisar(String pesquisa) async {
    var url = Uri.parse(baseUrl +
        "&q=" + pesquisa
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> retornoJson = json.decode(response.body);

      if (retornoJson.containsKey("weather")) {
        WeatherDto? weatherDto = null;
        var data = retornoJson;
        if( data != null)
          weatherDto = WeatherDto.fromJson(retornoJson);
        return weatherDto;
      }
    }
  }
}