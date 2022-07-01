import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final Future<SharedPreferences> prefsData =
      SharedPreferences.getInstance();

  static Future<void> setNumberList(List<String> numberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("numberList", numberList);
  }

  static Future<List<String>> getNumberList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("numberList") ?? [];
  }

  static Future<void> setCountryNumberList(
      List<String> countryNumberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("countryNumberList", countryNumberList);
  }

  static Future<List<String>> getCountryNumberList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("countryNumberList") ?? [];
  }

  static Future<void> setCountryNameList(List<String> countryNumberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("countryNameList", countryNumberList);
  }

  static Future<List<String>> getCountryNameList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("countryNameList") ?? [];
  }

  static Future<void> setUserNameList(List<String> setUserNameList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("setUserNameList", setUserNameList);
  }

  static Future<List<String>> getUserNameList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("setUserNameList") ?? [];
  }

  static Future<void> setIconList(List<String> setIconList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("setIconList", setIconList);
  }

  static Future<List<String>> getIconList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("setIconList") ?? [];
  }

  static Future<void> setDateTimeList(List<String> dateTimeList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("dateTimeList", dateTimeList);
  }

  static Future<List<String>> getDateTimeList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("dateTimeList") ?? [];
  }


  static Future<void> setTypeList(List<String> dateTypeList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("type", dateTypeList);
  }

  static Future<List<String>> getTypeList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("type") ?? [];
  }

  static Future<void> setDayList(List<String> dayList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("dayList", dayList);
  }

  static Future<List<String>> getDayList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("dayList") ?? [];
  }

  static Future<void> setChatList(List<String> ChatList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("chatList", ChatList);
  }

  static Future<List<String>> getChatList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("chatList") ?? [];
  }




  static Future<void> remove() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.remove("numberList");
  }

  static Future<void> clear() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.clear();
  }
}

// class AppSharedPreference {
//   static final _getStorage = GetStorage();
//
//   static const _lastNumber = 'last_number';
//   static const _lastNumberCode = 'last_number_code';
//
//   static Future<void> setLastNumber(List<String> lastNumber) async => _getStorage.write(_lastNumber, lastNumber);
//
//   static List<String> get lastNumber => _getStorage.read('last_number') ?? [];
//
//   static Future<void> setLastNumberCode(String lastNumberCode) async => _getStorage.write(_lastNumberCode, lastNumberCode);
//
//   static String get lastNumberCode => _getStorage.read(_lastNumberCode) ?? "";
//
//   static Future<void> clear() async => _getStorage.erase();
// }

//
