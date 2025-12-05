import 'package:supabase_flutter/supabase_flutter.dart';

class SupaUserModel {
  final String id;
  final String email;
  final String username;

  SupaUserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  factory SupaUserModel.fromSupabase(User user, String username) {
    return SupaUserModel(
      id: user.id,
      email: user.email ?? "",
      username: username,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'username': username,
      };
}
