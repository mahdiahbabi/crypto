


import 'package:flutter/material.dart';

import '../models/CryptoModel/AllCryptoModel.dart';
import '../network/ApiProvider.dart';
import '../network/ResponseModel.dart';

class CryptoDataProvider extends ChangeNotifier{
  ApiProvider apiProvider = ApiProvider();

  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;


  getTopMarketCapData() async {

    state = ResponseModel.loading("is Loading...");

    try{
      response = await apiProvider.getTopMarketCapData();

      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      }else{
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
}