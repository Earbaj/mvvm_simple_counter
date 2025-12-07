
import 'package:shared_preferences/shared_preferences.dart';

abstract class CounterLocalDataSource {
  Future<int> load();
  Future<void> save(int value);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  static const key = 'counter_value';

  @override
  Future<int> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  @override
  Future<void> save(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
}
