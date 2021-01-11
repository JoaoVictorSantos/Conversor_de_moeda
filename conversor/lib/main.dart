import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";

const request = "https://api.hgbrasil.com/finance?format=json&key=60df7606";

void main() async {
  print(await getData());
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

//Future -> Retorna algo de forma assincrona
Future<Map> getData() async {
  //forma de fazer uma requisão
  //http.Response response = await http.get(request);
  //forma de pegar os dados da requisião
  //print(json.decode(response.body)["results"]["currencies"]);
  var response = "{\r\n   \"by\":\"default\",\r\n   \"valid_key\":true,\r\n " +
      "  \"results\":{\r\n  \"currencies\":{\r\n " +
      " \"source\":\"BRL\",\r\n \"USD\":{\r\n" +
      " \"name\":\"Dollar\",\r\n  \"buy\":5.2278,\r\n \"sell\":5.2181,\r\n " +
      " \"variation\":-2.215\r\n },\r\n \"EUR\":{\r\n \"name\":\"Euro\",\r\n " +
      " \"buy\":6.297,\r\n  \"sell\":6.2973,\r\n  \"variation\":-1.41\r\n  },\r\n " +
      "\"GBP\":{\r\n \"name\":\"Pound Sterling\",\r\n  \"buy\":7.0547,\r\n  " +
      " \"sell\":null,\r\n  \"variation\":-0.917\r\n },\r\n  \"ARS\":{\r\n  " +
      " \"name\":\"Argentine Peso\",\r\n \"buy\":0.0649,\r\n \"sell\":null,\r\n " +
      " \"variation\":-1.113\r\n },\r\n  \"CAD\":{\r\n \"name\":\"Canadian Dollar\",\r\n " +
      " \"buy\":4.0341,\r\n \"sell\":null,\r\n \"variation\":0\r\n },\r\n \"AUD\":{\r\n  " +
      "\"name\":\"Australian Dollar\",\r\n \"buy\":3.8459,\r\n \"sell\":null,\r\n \"variation\":-0.001\r\n  },\r\n  \"JPY\":{\r\n \"name\":\"Japanese Yen\",\r\n \"buy\":0.05,\r\n \"sell\":null,\r\n \"variation\":0.059\r\n  },\r\n  \"CNY\":{\r\n \"name\":\"Renminbi\",\r\n \"buy\":0.794,\r\n \"sell\":null,\r\n \"variation\":-0.005\r\n  },\r\n  \"BTC\":{\r\n \"name\":\"Bitcoin\",\r\n \"buy\":103039.718,\r\n \"sell\":103039.718,\r\n \"variation\":-2.808\r\n  }\r\n      },\r\n      \"stocks\":{\r\n  \"IBOVESPA\":{\r\n \"name\":\"BM&F BOVESPA\",\r\n \"location\":\"Sao Paulo, Brazil\",\r\n \"points\":111216.133,\r\n \"variation\":2.13\r\n  },\r\n  \"NASDAQ\":{\r\n \"name\":\"NASDAQ Stock Market\",\r\n \"location\":\"New York City, United States\",\r\n \"points\":12355.11,\r\n \"variation\":1.28\r\n  },\r\n  \"CAC\":{\r\n \"name\":\"CAC 40\",\r\n \"location\":\"Paris, French\",\r\n \"variation\":63.09\r\n  },\r\n  \"NIKKEI\":{\r\n \"name\":\"Nikkei 225\",\r\n \"location\":\"Tokyo, Japan\",\r\n \"variation\":-0.12\r\n  }\r\n      },\r\n      \"available_sources\":[\r\n  \"BRL\"\r\n      ],\r\n      \"bitcoin\":{\r\n  \"blockchain_info\":{\r\n \"name\":\"Blockchain.info\",\r\n \"format\":[\r\n    \"USD\",\r\n    \"en_US\"\r\n ],\r\n \"last\":18689.34,\r\n \"buy\":18689.34,\r\n \"sell\":18689.34,\r\n \"variation\":-2.312\r\n  },\r\n  \"coinbase\":{\r\n \"name\":\"Coinbase\",\r\n \"format\":[\r\n    \"USD\",\r\n    \"en_US\"\r\n ],\r\n \"last\":18664.61,\r\n \"variation\":-2.376\r\n  },\r\n  \"bitstamp\":{\r\n \"name\":\"BitStamp\",\r\n \"format\":[\r\n    \"USD\",\r\n    \"en_US\"\r\n ],\r\n \"last\":18644.46,\r\n \"buy\":18644.46,\r\n \"sell\":18631.44,\r\n \"variation\":-2.526\r\n  },\r\n  \"foxbit\":{\r\n \"name\":\"FoxBit\",\r\n \"format\":[\r\n    \"BRL\",\r\n    \"pt_BR\"\r\n ],\r\n \"last\":98501.0479,\r\n \"variation\":-1.628\r\n  },\r\n  \"mercadobitcoin\":{\r\n \"name\":\"Mercado Bitcoin\",\r\n \"format\":[\r\n    \"BRL\",\r\n    \"pt_BR\"\r\n ],\r\n \"last\":99033.67597,\r\n \"buy\":98686.15,\r\n \"sell\":99033.67482,\r\n \"variation\":-1.263\r\n  }\r\n      },\r\n      \"taxes\":[\r\n  {\r\n \"date\":\"2020-11-30\",\r\n \"cdi\":2,\r\n \"selic\":2,\r\n \"daily_factor\":1.00007469,\r\n \"selic_daily\":1.9,\r\n \"cdi_daily\":1.9\r\n  }\r\n      ]\r\n   },\r\n   \"execution_time\":0,\r\n   \"from_cache\":true\r\n}";
  //print(json.decode(objeto)["results"]["currencies"]);
  //return json.decode(response.body);
  return json.decode(response);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    double real = dolar * this.dolar;
    realController.text = real.toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    double real = euro * this.euro;
    realController.text = real.toStringAsFixed(2);
    dolarController.text = (real / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text("\$ Conversor \$"),
            backgroundColor: Colors.amber,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _clearAll,
              )
            ]),
        body: FutureBuilder<Map>(
            //Monta a tela conforme o status da resposta assincrona
            future:
                getData(), //Função que retorna os dados de maneira assincrona
            builder: (context, snapshot) {
              //context ->
              //snapshot -> Indica o status do carregamento dos dados na tela
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    //Forma de centralizar os dados na tela
                    child: Text(
                      "Carregando Dados...",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      //Forma de centralizar os dados na tela
                      child: Text(
                        "Carregando Dados...",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    dolar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(Icons.monetization_on,
                              size: 150.0, color: Colors.amber),
                          buildTextField(
                              "Reais", "R\$", realController, _realChanged),
                          Divider(), //forma de da uma espaço entre os elementos
                          buildTextField("Dólares", "US\$", dolarController,
                              _dolarChanged),
                          Divider(), //forma de da uma espaço entre os elementos
                          buildTextField(
                              "Euros", "€", euroController, _euroChanged)
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    //forma de digitar o ponto decimal no IOS
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    onChanged: f,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
  );
}
