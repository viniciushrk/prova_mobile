import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  @override
  _MoneyScreenState createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<Money> {
  String selectedCurrency = 'Real'; // Moeda padrão selecionada
  Map<String, double> conversionRates = {
    'Real': 1.0,
    'Dólar': 4.87,
    'Peso': 0.014,
    'Iene': 0.033,
    'Euro': 5.36,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
      ),
      body: Container(
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
                      'Escolha a Moeda',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButton<String>(
                      value: selectedCurrency,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      },
                      items: conversionRates.keys.map<DropdownMenuItem<String>>((String value) {
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
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Valores de Conversão',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    for (var entry in conversionRates.entries)
                      if (entry.key != selectedCurrency)
                        Text(
                          '${entry.key}: ${(conversionRates[selectedCurrency]! / conversionRates[entry.key]!).toStringAsFixed(2)}',
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}