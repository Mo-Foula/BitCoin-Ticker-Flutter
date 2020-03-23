import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'RequestMakerBoy.dart';

class PriceScreen extends StatefulWidget {

  PriceScreen({this.BTClist,this.ETHlist,this.LTClist});

  final List<double> BTClist;
  final List<double> LTClist;
  final List<double> ETHlist;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String SelectedCurrency = "AUD";
  int SelectedCurrencyID = 0;

  double BTC=0 , LTC=0 , ETH=0;

  @override
  void initState() {
    super.initState();
    UPDATEUI();
  }

  CupertinoPicker IOSpicker()  {
    List<Text> E = [];
    for (String currency in currenciesList) {
      E.add(
        Text(currency),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
          SelectedCurrency = currenciesList[value];
          SelectedCurrencyID = value;
        setState(() {
          UPDATEUI();
        });
      },
      children: E,
    );
  }

  Widget CardBoy(String first, String second, double value) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $first = $value $second',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void UPDATEUI()async{

    setState(() {
      BTC = widget.BTClist[SelectedCurrencyID];
      LTC = widget.LTClist[SelectedCurrencyID];
      ETH = widget.ETHlist[SelectedCurrencyID];
    });
   // print("MY NAME IS SASUKE ADJAWIDJAWIDJ IWD AW   "+ A['rate'].toString());

  }
  Widget GUIMAKER() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CardBoy("BTC", SelectedCurrency, BTC),
        CardBoy("ETH", SelectedCurrency, LTC),
        CardBoy("LTC", SelectedCurrency, ETH),
      ],
    );
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: GUIMAKER(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: IOSpicker(),
          ),
        ],
      ),
    );
  }
}

/*
DropdownButton<String>(
              value: SelectedCurrency,
              items: DropDownItems(),
              onChanged: (value) {
                setState(
                  () {
                    SelectedCurrency = value;
                  },
                );
              },
            ),
 */
//  List<DropdownMenuItem<String>> DropDownItems() {
//    List<DropdownMenuItem<String>> E = [];
//    for (String currency in currenciesList) {
//      E.add(
//        DropdownMenuItem(
//          value: currency,
//          child: Text(currency),
//        ),
//      );
//    }
//    return E;
//  }