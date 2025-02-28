// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? contactNumber,
    String? userRole,
    String? accessToken,
    String? refreshToken,
    String? image,
    String? gender,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _contactNumber = contactNumber,
        _userRole = userRole,
        _accessToken = accessToken,
        _refreshToken = refreshToken,
        _image = image,
        _gender = gender;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "contact_number" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  set contactNumber(String? val) => _contactNumber = val;

  bool hasContactNumber() => _contactNumber != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        id: castToType<int>(data['id']),
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
        contactNumber: data['contact_number'] as String?,
        userRole: data['user_role'] as String?,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
        image: data['image'] as String?,
        gender: data['gender'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'contact_number': _contactNumber,
        'user_role': _userRole,
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
        'image': _image,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'contact_number': serializeParam(
          _contactNumber,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        contactNumber: deserializeParam(
          data['contact_number'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        contactNumber == other.contactNumber &&
        userRole == other.userRole &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        image == other.image &&
        gender == other.gender;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        email,
        contactNumber,
        userRole,
        accessToken,
        refreshToken,
        image,
        gender
      ]);
}

DataStruct createDataStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? email,
  String? contactNumber,
  String? userRole,
  String? accessToken,
  String? refreshToken,
  String? image,
  String? gender,
}) =>
    DataStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      contactNumber: contactNumber,
      userRole: userRole,
      accessToken: accessToken,
      refreshToken: refreshToken,
      image: image,
      gender: gender,
    );
