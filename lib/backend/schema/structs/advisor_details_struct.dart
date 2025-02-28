// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvisorDetailsStruct extends BaseStruct {
  AdvisorDetailsStruct({
    bool? success,
    String? message,
    AdDataStruct? data,
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
  AdDataStruct? _data;
  AdDataStruct get data => _data ?? AdDataStruct();
  set data(AdDataStruct? val) => _data = val;

  void updateData(Function(AdDataStruct) updateFn) {
    updateFn(_data ??= AdDataStruct());
  }

  bool hasData() => _data != null;

  static AdvisorDetailsStruct fromMap(Map<String, dynamic> data) =>
      AdvisorDetailsStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: data['data'] is AdDataStruct
            ? data['data']
            : AdDataStruct.maybeFromMap(data['data']),
      );

  static AdvisorDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? AdvisorDetailsStruct.fromMap(data.cast<String, dynamic>())
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

  static AdvisorDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdvisorDetailsStruct(
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
          structBuilder: AdDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AdvisorDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdvisorDetailsStruct &&
        success == other.success &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([success, message, data]);
}

AdvisorDetailsStruct createAdvisorDetailsStruct({
  bool? success,
  String? message,
  AdDataStruct? data,
}) =>
    AdvisorDetailsStruct(
      success: success,
      message: message,
      data: data ?? AdDataStruct(),
    );
