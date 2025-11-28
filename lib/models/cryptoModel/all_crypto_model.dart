import 'status.dart';
import 'crypto_data.dart';

class AllCryptoModel {
  Data? data;
  Status? status;

  AllCryptoModel({this.data, this.status});

  AllCryptoModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["status"] is Map) {
      status = json["status"] == null ? null : Status.fromJson(json["status"]);
    }
  }

  static List<AllCryptoModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AllCryptoModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    if (status != null) {
      _data["status"] = status?.toJson();
    }
    return _data;
  }
}

class Data {
  List<CryptoCurrencyList>? cryptoCurrencyList;
  String? totalCount;

  Data({this.cryptoCurrencyList, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["cryptoCurrencyList"] is List) {
      cryptoCurrencyList = json["cryptoCurrencyList"] == null
          ? null
          : (json["cryptoCurrencyList"] as List)
                .map((e) => CryptoCurrencyList.fromJson(e))
                .toList();
    }
    if (json["totalCount"] is String) {
      totalCount = json["totalCount"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (cryptoCurrencyList != null) {
      _data["cryptoCurrencyList"] = cryptoCurrencyList
          ?.map((e) => e.toJson())
          .toList();
    }
    _data["totalCount"] = totalCount;
    return _data;
  }
}

