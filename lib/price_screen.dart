import 'dart:convert';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import '';
class PriceScreen extends StatefulWidget {
  PriceScreen({required this.curr1});
  String curr1;

  @override
  State<PriceScreen> createState() => _PriceScreenState(currency: curr1);
}


class _PriceScreenState extends State<PriceScreen> {
  _PriceScreenState({required this.currency});
  String currency;
  String selectedCurrency='USD';

  late String price='?';
  List<DropdownMenuItem<String>> getDropdownItem()
  {
    List<DropdownMenuItem<String>> dropdownItems=[];
    for(int i=0;i<currenciesList.length;i++)
      {
        String currency=currenciesList[i];
        var newItem=DropdownMenuItem(
            child: Text(currency),
            value: currency,
        );
        dropdownItems.add(newItem);
      }
    return dropdownItems;

  }
  String bitcoinValueInUSD = '?';
  String ETHValueInUSD = '?';
  String LTCValueInUSD = '?';
  void getData() async {
    try {
      double data1 = await CoinData().getCoinData(curr: currency,no: 'BTC');
      double data2 = await CoinData().getCoinData(curr: currency,no: 'ETH');
      double data3 = await CoinData().getCoinData(curr: currency,no: 'LTC');

       setState(() {
        bitcoinValueInUSD = data1.toStringAsFixed(0);
        ETHValueInUSD = data2.toStringAsFixed(0);
         LTCValueInUSD = data3.toStringAsFixed(0);

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState()
  {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinValueInUSD $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $LTCValueInUSD $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ETHValueInUSD $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropdownItem(),
              onChanged: (value){
                setState(() {
                  selectedCurrency=value.toString();
                  currency=selectedCurrency;
                  getData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
