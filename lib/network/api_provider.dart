import 'package:dio/dio.dart';

class ApiProvider {
  static const targetUrl =
      'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap';
  getTopMarketCapData() async {
    var response = await Dio().get(targetUrl);
    return response;
  }
}
// // import 'package:dio/dio.dart';
// // import 'package:flutter/foundation.dart' show kIsWeb;
// // import 'dart:io' show Platform;

// // class Apiprovider {
// //   Future<Response<dynamic>> getTopMarketCapData() async {
// //     // 🔹 Target API
// //     const targetUrl =
// //         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap';

// //     // 🔹 Determine proxy URL dynamically
// //     String proxyBase;
// //     if (kIsWeb) {
// //       proxyBase = 'http://localhost:3000/api?url=';
// //     } else if (Platform.isAndroid) {
// //       // For emulator or real device, use your laptop IP (the hotspot host IP)
// //       proxyBase = 'http://10.224.44.118:3000/api?url=';
// //     } else if (Platform.isIOS) {
// //       proxyBase = 'http://localhost:3000/api?url=';
// //     } else {
// //       // Fallback for other platforms
// //       proxyBase = 'http://localhost:3000/api?url=';
// //     }

// //     // 🔹 Combine URLs safely
// //     final encodedTarget = Uri.encodeComponent(targetUrl);
// //     final fullUrl = '$proxyBase$encodedTarget';

// //     final dio = Dio(
// //       BaseOptions(
// //         followRedirects: true,
// //         receiveTimeout: const Duration(seconds: 30),
// //         connectTimeout: const Duration(seconds: 15),
// //         responseType: ResponseType.json,
// //         validateStatus: (status) => status != null && status < 500,
// //       ),
// //     );

// //     try {
// //       final response = await dio.get(fullUrl);
// //       print('✅ Response status: ${response.statusCode}');
// //       return response;
// //     } on DioException catch (e) {
// //       print('❌ DioException: ${e.message}');
// //       if (e.response != null) {
// //         print('Response data: ${e.response!.data}');
// //       }
// //       rethrow;
// //     } catch (e) {
// //       print('❌ Other Error: $e');
// //       rethrow;
// //     }
// //   }
// // }
// // ***********************************************************************************************************************

// import 'package:dio/dio.dart';

// class ApiProvider {
//   // Replace with your actual worker URL
//   static const _workerBase =
//       'https://small-forest-a15e.instagrambay4u.workers.dev/?url=';

//   // If you used Option B (API key), set it here and pass as header or query param.
//   static const _proxyKey = null; // e.g. 'MY_SECRET' or null if not using key

//   Future<Response<dynamic>> getAllCryptoData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=1000&sortBy=market_cap&sortType=desc'
//         '&convert=USD&cryptoType=all&tagType=all&audited=false'
//         '&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,'
//         'max_supply,circulating_supply,total_supply,volume_7d,volume_30d,'
//         'self_reported_circulating_supply,self_reported_market_cap';

//     final encodedTarget = Uri.encodeComponent(targetUrl);
//     // print(encodedTarget);

//     // If using query-key method:
//     final workerUrl = (_proxyKey == null)
//         ? '$_workerBase$encodedTarget'
//         : '$_workerBase$encodedTarget&key=${Uri.encodeComponent(_proxyKey)}';

//     final dio = Dio(
//       BaseOptions(
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 15),
//         followRedirects: true,
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );

//     // If using header-key method, add below:
//     final options = Options(
//       headers: _proxyKey == null ? null : {'x-proxy-key': _proxyKey},
//     );

//     try {
//       print('🔗 Fetching via proxy: $workerUrl');
//       final response = await dio.get(workerUrl, options: options);
//       print('✅ Response status: ${response.statusCode}');
//       return response;
//     } catch (e, st) {
//       print('❌ Error fetching data: $e\n$st');
//       rethrow;
//     }
//   }

//   Future<Response<dynamic>> getTopMarketCapData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=10&sortBy=market_cap&sortType=desc'
//         '&convert=USD&cryptoType=all&tagType=all&audited=false'
//         '&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,'
//         'max_supply,circulating_supply,total_supply,volume_7d,volume_30d,'
//         'self_reported_circulating_supply,self_reported_market_cap';

//     final encodedTarget = Uri.encodeComponent(targetUrl);
//     // print(encodedTarget);

//     // If using query-key method:
//     final workerUrl = (_proxyKey == null)
//         ? '$_workerBase$encodedTarget'
//         : '$_workerBase$encodedTarget&key=${Uri.encodeComponent(_proxyKey)}';

//     final dio = Dio(
//       BaseOptions(
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 15),
//         followRedirects: true,
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );

//     // If using header-key method, add below:
//     final options = Options(
//       headers: _proxyKey == null ? null : {'x-proxy-key': _proxyKey},
//     );

//     try {
//       print('🔗 Fetching via proxy: $workerUrl');
//       final response = await dio.get(workerUrl, options: options);
//       print('✅ Response status: ${response.statusCode}');
//       return response;
//     } catch (e, st) {
//       print('❌ Error fetching data: $e\n$st');
//       rethrow;
//     }
//   }

//   Future<Response<dynamic>> getTopGainerCapData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=10&sortBy=percent_change_24h&sortType=desc'
//         '&convert=USD&cryptoType=all&tagType=all&audited=false'
//         '&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,'
//         'max_supply,circulating_supply,total_supply,volume_7d,volume_30d,'
//         'self_reported_circulating_supply,self_reported_market_cap';

//     final encodedTarget = Uri.encodeComponent(targetUrl);
//     // print(encodedTarget);

//     // If using query-key method:
//     final workerUrl = (_proxyKey == null)
//         ? '$_workerBase$encodedTarget'
//         : '$_workerBase$encodedTarget&key=${Uri.encodeComponent(_proxyKey)}';

//     final dio = Dio(
//       BaseOptions(
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 15),
//         followRedirects: true,
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );

//     // If using header-key method, add below:
//     final options = Options(
//       headers: _proxyKey == null ? null : {'x-proxy-key': _proxyKey},
//     );

//     try {
//       print('🔗 Fetching via proxy: $workerUrl');
//       final response = await dio.get(workerUrl, options: options);
//       print('✅ Response status: ${response.statusCode}');
//       return response;
//     } catch (e, st) {
//       print('❌ Error fetching data: $e\n$st');
//       rethrow;
//     }
//   }

//   Future<Response<dynamic>> getTopLosersCapData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=10&sortBy=percent_change_24h&sortType=asc'
//         '&convert=USD&cryptoType=all&tagType=all&audited=false'
//         '&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,'
//         'max_supply,circulating_supply,total_supply,volume_7d,volume_30d,'
//         'self_reported_circulating_supply,self_reported_market_cap';

//     final encodedTarget = Uri.encodeComponent(targetUrl);
//     // print(encodedTarget);

//     // If using query-key method:
//     final workerUrl = (_proxyKey == null)
//         ? '$_workerBase$encodedTarget'
//         : '$_workerBase$encodedTarget&key=${Uri.encodeComponent(_proxyKey)}';

//     final dio = Dio(
//       BaseOptions(
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 15),
//         followRedirects: true,
//         validateStatus: (status) => status != null && status < 500,
//       ),
//     );

//     // If using header-key method, add below:
//     final options = Options(
//       headers: _proxyKey == null ? null : {'x-proxy-key': _proxyKey},
//     );

//     try {
//       print('🔗 Fetching via proxy: $workerUrl');
//       final response = await dio.get(workerUrl, options: options);
//       print('✅ Response status: ${response.statusCode}');
//       return response;
//     } catch (e, st) {
//       print('❌ Error fetching data: $e\n$st');
//       rethrow;
//     }
//   }

//   dynamic callRegisterApi(name, password, passwordConfirm) async {
//     var formData = FormData.fromMap({
//       'name': name,

//       'password': password,
//       'passwordConfirm': passwordConfirm,
//     });
//     final response = await Dio().post(
//       'https://startflutter.ir/api/collections/users/records',
//       data: formData,
//     );
//     return response;
//   }
// }

// // ***********************************************************************************************************************

// // import 'package:dio/dio.dart';
// // import 'package:flutter/foundation.dart' show kIsWeb;

// // class Apiprovider {
// //   Future<Response<dynamic>> getTopMarketCapData() async {
// //     final dio = Dio();

// //     // Original API
// //     const apiUrl =
// //         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap';

// //     // Add proxy prefix if running on Web
// //     final targetUrl = kIsWeb
// //         // https://cors-anywhere.herokuapp.com/corsdemo
// //         ? 'https://cors-anywhere.herokuapp.com/$apiUrl'
// //         : apiUrl;

// //     final response = await dio.get(targetUrl);
// //     return response;
// //   }
// // }

// // ***********************************************************************************************************************
// // import 'package:dio/dio.dart';

// // class Apiprovider {
// //   Future<Response<dynamic>> getTopMarketCapData() async {
// //     final dio = Dio();
// //     final response = await dio.get(
// //       'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap',
// //     );
// //     return response;
// //   }
// // }
