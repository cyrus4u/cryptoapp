import 'package:cryptoapp/data/models/cryptoModel/all_crypto_model.dart';
import 'package:cryptoapp/data/data_source/api_provider.dart';
import 'package:cryptoapp/data/data_source/response_model.dart';
import 'package:cryptoapp/data/repositories/crypto_data_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  late Response<dynamic> response;
  CryptoDataRepository repository = CryptoDataRepository();
  var defaultChoiceIndex = 0;
  
  CryptoDataProvider(){
    getTopMarketCapData();
  }

  getTopMarketCapData() async {
    defaultChoiceIndex = 0;
    state = ResponseModel.loading('...loading');
    notifyListeners();
    try {
      response = await apiProvider.getTopMarketCapData();
      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error('something is wrong...');
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error('check your connection...');
      notifyListeners();
    }
  }

  getTopGainerData() async {
    defaultChoiceIndex = 1;
    state = ResponseModel.loading('...loading');
    notifyListeners();
    try {
      dataFuture = await repository.getTopGainerData();
      state = ResponseModel.completed(dataFuture);
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error('check your connection...');
      notifyListeners();
    }
  }

  getTopLoserData() async {
    defaultChoiceIndex = 2;
    state = ResponseModel.loading('...loading');
    notifyListeners();
    try {
      response = await apiProvider.getTopLoserData();
      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error('something is wrong...');
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error('check your connection...');
      notifyListeners();
    }
  }
}
