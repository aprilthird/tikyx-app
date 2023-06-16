import 'package:remote/config/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiInstance {
  static ApiInstance? _instance;
  final SupabaseClient _client;

  static Future<ApiInstance> getInstance() async {
    if (_instance == null) {
      await Supabase.initialize(
        url: ApiConfig.supabaseUrl,
        anonKey: ApiConfig.supabaseAnonKey,
      );
      _instance = ApiInstance._(Supabase.instance.client);
    }
    return _instance!;
  }

  ApiInstance._(SupabaseClient client) : _client = client;

  SupabaseClient getClient() => _client;
}
