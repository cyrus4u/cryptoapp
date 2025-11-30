import 'package:dio/dio.dart';

class ApiProvider {
  dynamic getAllCryptoData() async {
    return await Dio().get(
      "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=1000&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
    );
  }

  dynamic getTopMarketCapData() async {
    return await Dio().get(
      "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
    );
  }

  dynamic getTopGainerData() async {
    return await Dio().get(
      "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=percent_change_24h&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
    );
  }

  dynamic getTopLoserData() async {
    return await Dio().get(
      "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=10&sortBy=percent_change_24h&sortType=asc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap",
    );
  }

  dynamic callRegisterApi(name, email, password) async {
    var formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
    });

    final response = await Dio().post(
      'https://besenior.ir/api/register',
      data: formData,
    );

    return response;
  }
}
// ************************************************************************

/// A service provider for making API calls related to cryptocurrency data
/// and user authentication.
///
/// ─────────────────────────────────────────────────────────────────────
/// Why Cloudflare & Supabase (Web CORS Fix)
/// ─────────────────────────────────────────────────────────────────────
/// - Direct browser calls to public APIs like CoinMarketCap often fail
///   because of strict **CORS restrictions**
///
/// - Mobile apps are not affected because they make requests directly
///   from the device.
/// 
/// To make Web builds work:
///   1️⃣ Cloudflare Worker → secure proxy that fetches crypto data
///   2️⃣ Supabase Edge Function → adds authentication + protects API keys
///
/// - This protects sensitive keys and ensures the app works on:
///     ✔ Android / iOS Emulator
///     ✔ Physical Phones
///     ✔ Chrome / Flutter Web
///
/// NOTE:
/// Replace the hardcoded endpoints below with your Worker/Supabase URLs  
/// when building for Web.
///
// import 'package:dio/dio.dart';

// class ApiProvider {
//   // Base URL for your Supabase Edge Function
//   // This function acts as a proxy to the CoinMarketCap API
//   static final String _nodeBase =
//       'https://ukrshwdqetdpzfsjmgbc.supabase.co/functions/v1/crypto';

//   // Supabase "anon key" for authentication
//   // Required to call the Supabase Edge Function securely
//   static const String _supabaseAnonKey =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVrcnNod2RxZXRkcHpmc2ptZ2JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI4NDkzMzMsImV4cCI6MjA3ODQyNTMzM30.KNnALmGW6pW5GrUslwnL07dNUQRDwbYkzIhJV2bi4XU'; // truncated

//   // Dio instance for making HTTP requests
//   final Dio _dio = Dio(
//     BaseOptions(
//       connectTimeout: const Duration(seconds: 20), // wait up to 20s for connection
//       receiveTimeout: const Duration(seconds: 30), // wait up to 30s for response
//       followRedirects: true, // follow HTTP redirects automatically
//       validateStatus: (status) => status != null && status < 500, // treat 4xx as error
//       headers: {
//         // Both 'apikey' and 'Authorization' are required for Supabase function
//         'apikey': _supabaseAnonKey,
//         'Authorization': 'Bearer $_supabaseAnonKey',
//         'Content-Type': 'application/json',
//       },
//     ),
//   );

//   // Fetch all crypto
//   Future<Response<dynamic>> getAllCryptoData() => _dio.get('$_nodeBase');

//   // Fetch top market cap coins
//   Future<Response<dynamic>> getTopMarketCapData() => _dio.get('$_nodeBase/topMarketCap');

//   // Fetch top gainers
//   Future<Response<dynamic>> getTopGainerData() => _dio.get('$_nodeBase/topGainer');

//   // Fetch top losers
//   Future<Response<dynamic>> getTopLoserData() => _dio.get('$_nodeBase/topLoser');
// }
// **************************************************************************************

// import 'package:dio/dio.dart';

// class ApiProvider {
//   // Cloudflare Worker URL
//   // This worker proxies requests to the real CoinMarketCap API
//   static const _workerBase =
//       'https://small-forest-a15e.instagrambay4u.workers.dev/?url=';

//   // If you used Option B (API key), set it here and pass as header or query param.
//   static const _proxyKey = null; // e.g. 'MY_SECRET' or null if not using key

//   Future<Response<dynamic>> getAllCryptoData() async {
//     //  Original CoinMarketCap API URL
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=100&sortBy=market_cap&sortType=desc'
//         '&convert=USD&cryptoType=all&tagType=all&audited=false'
//         '&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,'
//         'max_supply,circulating_supply,total_supply,volume_7d,volume_30d,'
//         'self_reported_circulating_supply,self_reported_market_cap';

//     //  Encode target URL to pass as a query parameter to Worker

//     final encodedTarget = Uri.encodeComponent(targetUrl);
//     // print(encodedTarget);

//     // If using query-key method:
//     //  Construct the final worker URL
//     // If _proxyKey is set, attach as a query parameter
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
//         '?start=1&limit=100&sortBy=market_cap&sortType=desc'
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

//   Future<Response<dynamic>> getTopGainerData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=100&sortBy=percent_change_24h&sortType=desc'
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

//   Future<Response<dynamic>> getTopLoserData() async {
//     final targetUrl =
//         'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing'
//         '?start=1&limit=100&sortBy=percent_change_24h&sortType=asc'
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
