import 'keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = coinAPIKey;

class CoinData {
  dynamic getCoinData() async {
    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD');
    var response = await http.get(
      url,
      headers: {"X-CoinAPI-Key": apiKey},
    );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    String data = response.body;

    return jsonDecode(data);
  }
}
