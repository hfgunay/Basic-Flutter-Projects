import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:flutter_config/flutter_config.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LINK',
];

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
var apiKey = FlutterConfig.get("API_KEY");

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String urlBeforeParse = '$coinApiUrl/$crypto/$currency?apikey=$apiKey';
      var url = Uri.parse(urlBeforeParse);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
