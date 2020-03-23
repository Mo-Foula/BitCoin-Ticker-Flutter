import 'package:bitcoin_ticker/NetworkHelper.dart';
import 'package:flutter/cupertino.dart';

const APIKEY = "AE306AD4-2492-4E3F-84C3-D6FA19DF5A9B";
const APIKEY2 = '1862AB2A-D55B-418E-87A7-2DF41EA627E1';

const BTC = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$APIKEY";
const LTC = "https://rest.coinapi.io/v1/exchangerate/LTC/USD?apikey=$APIKEY";
const req = "https://rest.coinapi.io/v1/exchangerate/";
const ETH = "https://rest.coinapi.io/v1/exchangerate/ETH/USD?apikey=$APIKEY";

String CurrentAPI = APIKEY;

class RequestMakerBoy{

  Future getBTC(String S) async {
    String D = req+"BTC/$S?apikey=$CurrentAPI";
    print("API    $D");
    dynamic A = await NetworkHelper(D).getDate();
    if(A==null){
      CurrentAPI = CurrentAPI==APIKEY?APIKEY2:APIKEY;
      A = await NetworkHelper(D).getDate();
    }

    return A;
  }

  Future getLTC(String S) async {
    String D = req+"LTC/$S?apikey=$APIKEY";
    dynamic A = await NetworkHelper(D).getDate();
    return A;
  }

  Future getETH(String S) async {
    String D = req+"ETH/$S?apikey=$APIKEY";
    dynamic A = await NetworkHelper(D).getDate();
    return A;
  }

}