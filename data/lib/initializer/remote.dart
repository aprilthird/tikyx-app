import 'package:remote/initializer/api.dart';

class RemoteInitializer {
  static Future<void> initialize() async {
    await ApiInitializer.initialize();
  }
}
