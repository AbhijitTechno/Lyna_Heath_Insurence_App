// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsStruct extends BaseStruct {
  UserDetailsStruct({
    bool? success,
    String? message,
    DataStruct? data,
  })  : _success = success,
        _message = message,
        _data = data;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "data" field.
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(_data ??= DataStruct());
  }

  bool hasData() => _data != null;

  static UserDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserDetailsStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: data['data'] is DataStruct
            ? data['data']
            : DataStruct.maybeFromMap(data['data']),
      );

  static UserDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDetailsStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDetailsStruct &&
        success == other.success &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([success, message, data]);
}

UserDetailsStruct createUserDetailsStruct({
  bool? success,
  String? message,
  DataStruct? data,
}) =>
    UserDetailsStruct(
      success: success,
      message: message,
      data: data ?? DataStruct(),
    );
