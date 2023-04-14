import 'package:http/http.dart';
import 'dart:convert';
String front='https://rest.coinapi.io/v1/exchangerate/BTC/';
String Api='36ECBB03-5E04-4AD4-B9CF-FC215328C934';
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

class CoinData {
  late String curr;
  Future getCoinData({ dynamic curr,dynamic no})async{
    Response response=await get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$no/$curr?apikey=$Api'));
    if(response.statusCode==200)
      {
        String data=response.body;
        var decodedata=jsonDecode(data);
        print(decodedata);
        return decodedata['rate'];
      }
    else
      {
        print(response.statusCode);
      }
  }
}