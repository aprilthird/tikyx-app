import 'package:remote/config/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiInitializer {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: ApiConfig.supabaseUrl,
      anonKey: ApiConfig.supabaseAnonKey,
    );
  }
}
