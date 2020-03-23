import 'dart:io';

import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'RequestMakerBoy.dart';
import 'coin_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();



    getData();
  }

  Widget A= SpinKitWave(
    color: Colors.black,
    size: 100,
  );

  void getData() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        List<double> BTClist=[];
        List<double> ETHlist=[];
        List<double> LTClist=[];

          for(String Currency in currenciesList){
            dynamic A = await RequestMakerBoy().getBTC(Currency);
            print('JSON DECODED  ${num.parse(A['rate'].toStringAsFixed(5))}');
            BTClist.add(num.parse(A['rate'].toStringAsFixed(5)));

            A = await RequestMakerBoy().getETH(Currency);
            ETHlist.add(num.parse(A['rate'].toStringAsFixed(5)));

            A = await RequestMakerBoy().getLTC(Currency);
            LTClist.add(num.parse(A['rate'].toStringAsFixed(5)));
          }

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PriceScreen(
            BTClist: BTClist,
            ETHlist: ETHlist,
            LTClist: LTClist,
          );
        }));


      }
    } on SocketException catch (_) {
      print('not connected');

    }
   setState(() {
     A = FloatingActionButton(
       onPressed: () {
         getData();
       },
       child: Text('Try Again'),
     );
   });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: A,
      ),
    );
  }
}
