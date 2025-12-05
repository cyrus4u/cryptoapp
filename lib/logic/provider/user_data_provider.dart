import 'package:cryptoapp/data/models/supabase_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cryptoapp/data/data_source/response_model.dart';

class UserDataProvider extends ChangeNotifier {
  ResponseModel? registerStatus;

  final supabase = Supabase.instance.client;

  Future<void> callRegisterApi(
      String username, String email, String password) async {
    registerStatus = ResponseModel.loading("Registering...");
    notifyListeners();

    try {
      // Check duplicate username
      final existing = await supabase
          .from('profiles')
          .select('id')
          .eq('username', username);

      if (existing.isNotEmpty) {
        registerStatus = ResponseModel.error("Username already taken");
        notifyListeners();
        return;
      }

      // Create user in Supabase Auth
      final authResponse = await supabase.auth.signUp(
        email: email.trim().toLowerCase(),
        password: password,
      );

      if (authResponse.user == null) {
        registerStatus = ResponseModel.error("Failed to create user.");
        notifyListeners();
        return;
      }

      final userId = authResponse.user!.id;

      // Insert username into profiles table
      final insertResponse = await supabase
          .from('profiles')
          .insert({'id': userId, 'username': username})
          .select();

      if (insertResponse == null || insertResponse.isEmpty) {
        registerStatus = ResponseModel.error("Failed to save user profile.");
        notifyListeners();
        return;
      }

      // Convert Supabase User -> our model
      final userModel = SupaUserModel.fromSupabase(
        authResponse.user!,
        username,
      );

      registerStatus = ResponseModel.completed(userModel);
    } catch (e) {
      registerStatus = ResponseModel.error("Error: $e");
    }

    notifyListeners();
  }
}


// class UserDataProvider extends ChangeNotifier {
//   ResponseModel? registerStatus;

//   /// Supabase client
//   final supabase = Supabase.instance.client;

//   /// Register user with username, email, and password
//   Future<void> callRegisterApi(
//       String username, String email, String password) async {
//     registerStatus = ResponseModel.loading("Registering...");
//     notifyListeners();

//     try {
//       print("Attempting to register user: $email");

//       // 1️⃣ Check if username already exists
//       final existing = await supabase
//           .from('profiles')
//           .select('id')
//           .eq('username', username);

//       if (existing.isNotEmpty) {
//         registerStatus = ResponseModel.error("Username already taken");
//         notifyListeners();
//         return;
//       }

//       // 2️⃣ Create user in Supabase Auth
//       final authResponse = await supabase.auth.signUp(
//         email: email.trim().toLowerCase(),
//         password: password,
//       );

//       print("AuthResponse: ${authResponse.user}");
//       print("AuthResponse session: ${authResponse.session}");

//       if (authResponse.user != null) {
//         final userId = authResponse.user!.id;
//         print("User created with ID: $userId");

//         // 3️⃣ Save username in 'profiles' table
//         final insertResponse = await supabase
//             .from('profiles')
//             .insert({'id': userId, 'username': username})
//             .select();

//         print("Insert response: $insertResponse");

//         if (insertResponse != null && insertResponse.isNotEmpty) {
//           registerStatus = ResponseModel.completed(authResponse.user);
//         } else {
//           registerStatus =
//               ResponseModel.error("Failed to insert profile into database.");
//         }
//       } else {
//         print("No user returned from Supabase.");
//         registerStatus = ResponseModel.error("Failed to create user.");
//       }
//     } catch (e, stackTrace) {
//       print("Exception during registration: $e");
//       print(stackTrace);
//       registerStatus = ResponseModel.error("Error: $e");
//     }

//     notifyListeners();
//   }
// }




  // callLoginApi(email, password) async {
  //
  //   loginStatus = Status.LOADING;
  //   notifyListeners();
  //
  //
  //   try{
  //     response = await apiProvider.loginApi(email, password);
  //     if(response.statusCode == 201){
  //       dataFuture = UserModel.fromJson(response.data);
  //       loginStatus = Status.COMPLETED;
  //     }else{
  //       dataFuture = ApiStatus.fromJson(response.data);
  //       loginStatus = Status.ERROR;
  //       error = dataFuture.message;
  //     }
  //
  //     notifyListeners();
  //
  //
  //   }catch(e) {
  //     loginStatus = Status.ERROR;
  //     error = "please check your connection...";
  //     notifyListeners();
  //
  //     print(e.toString());
  //   }
  // }

  // @override
  // void dispose() {
  //   loginStatus = null;
  // }
// }