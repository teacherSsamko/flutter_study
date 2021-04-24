import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';

  var cryptoRates = {'BTC': '?', 'ETH': '?', 'LTC': '?'};
  CoinData coinData = CoinData();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        getData(currency: value);
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getData(currency: selectedCurrency);
      },
      children: pickerItems,
    );
  }

  List<RateCard> setCards() {
    List<RateCard> cardList = [];
    for (String crypto in cryptoList) {
      RateCard card = RateCard(
        currentRate: cryptoRates[crypto],
        selectedCurrency: selectedCurrency,
        coinType: crypto,
      );
      cardList.add(card);
    }

    return cardList;
  }

  void getData({String currency: "USD"}) async {
    double rate;
    for (String crypto in cryptoList) {
      var response =
          await coinData.getCoinData(currency: currency, crypto: crypto);
      print(response["rate"]);
      rate = response["rate"];
      cryptoRates[crypto] = rate.round().toString();
      print(cryptoRates[crypto]);

      setState(() {
        print('get data');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData(currency: selectedCurrency);
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: setCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class RateCard extends StatelessWidget {
  RateCard(
      {@required this.currentRate,
      @required this.selectedCurrency,
      @required this.coinType});

  final String currentRate;
  final String selectedCurrency;
  final String coinType;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 $coinType = $currentRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
