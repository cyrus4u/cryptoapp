import 'package:cryptoapp/data/models/cryptoModel/all_crypto_model.dart';
import 'package:cryptoapp/data/data_source/api_provider.dart';

class CryptoDataRepository {
  var response;
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;

  Future<AllCryptoModel> getTopGainerData() async {
    response = await apiProvider.getTopGainerData();
    dataFuture = AllCryptoModel.fromJson(response.data);
    return dataFuture;
  }
}
