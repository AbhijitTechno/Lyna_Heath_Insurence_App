import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          final serializedData = prefs.getString('ff_user') ?? '{}';
          _user = DataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _EnglishLocalized = true;
  bool get EnglishLocalized => _EnglishLocalized;
  set EnglishLocalized(bool value) {
    _EnglishLocalized = value;
  }

  DataStruct _user = DataStruct();
  DataStruct get user => _user;
  set user(DataStruct value) {
    _user = value;
    prefs.setString('ff_user', value.serialize());
  }

  void updateUserStruct(Function(DataStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  List<String> _blanklist = [];
  List<String> get blanklist => _blanklist;
  set blanklist(List<String> value) {
    _blanklist = value;
  }

  void addToBlanklist(String value) {
    blanklist.add(value);
  }

  void removeFromBlanklist(String value) {
    blanklist.remove(value);
  }

  void removeAtIndexFromBlanklist(int index) {
    blanklist.removeAt(index);
  }

  void updateBlanklistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    blanklist[index] = updateFn(_blanklist[index]);
  }

  void insertAtIndexInBlanklist(int index, String value) {
    blanklist.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
