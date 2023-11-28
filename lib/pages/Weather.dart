import 'package:flutter/material.dart';
import 'package:prova_mobile/data/WeatherApi.dart';
import 'package:prova_mobile/dtos/WeatherDto.dart';

class Weather extends StatefulWidget{
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather>  {
  String selectedCity = 'Porto Velho';

  WeatherDto? weatherData;

  WeatherApi weatherService = WeatherApi();

  void pesquisarClima() async {
    WeatherDto? resultado = await weatherService.pesquisar(selectedCity);
    if (resultado != null) {
      setState(() {
        weatherData = resultado;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          title: Text("Weather"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                // String? res = await showSearch(context: context, delegate: CustomSeachDelegate());
                setState(() {
                  // pesquisa = res!;
                });
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Clima',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    DropdownButton<String>(
                                      value: selectedCity,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedCity = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'Porto Velho',
                                        'Cuiabá',
                                        'Pelotas',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: pesquisarClima,
                              child: Text('Pesquisar'),
                            ),
                            SizedBox(height: 20.0),
                            if (weatherData != null)
                              Card(
                                elevation: 4.0,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        'Informações do Clima',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text('Cidade: ${weatherData!.name}'),
                                      Text('Temperatura: ${weatherData!.temp.toString()}°C'),
                                      Text('Temp. Mínima: ${weatherData!.temp_min.toString()}°C'),
                                      Text('Temp. Máxima: ${weatherData!.temp_max.toString()}°C'),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
      );
  }

}