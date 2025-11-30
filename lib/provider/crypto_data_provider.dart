import 'package:cryptoapp/models/cryptoModel/all_crypto_model.dart';
import 'package:cryptoapp/network/api_provider.dart';
import 'package:cryptoapp/network/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  late Response<dynamic> response;

  getTopMarketCapData() async {
    state = ResponseModel.loading('...loading');
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
    state = ResponseModel.loading('...loading');
    try {
      response = await apiProvider.getTopGainerData();
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
  getTopLoserData() async {
    state = ResponseModel.loading('...loading');
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
