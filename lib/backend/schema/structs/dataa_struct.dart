// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataaStruct extends BaseStruct {
  DataaStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? image,
    String? password,
    String? userName,
    String? email,
    String? phoneNumber,
    String? address,
    String? about,
    String? status,
    String? gender,
    String? ageGroup,
    String? createdBy,
    int? serviceId,
    String? ratings,
    String? createdAt,
    String? updatedAt,
    String? userRole,
    String? accessToken,
    String? refreshToken,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _image = image,
        _password = password,
        _userName = userName,
        _email = email,
        _phoneNumber = phoneNumber,
        _address = address,
        _about = about,
        _status = status,
        _gender = gender,
        _ageGroup = ageGroup,
        _createdBy = createdBy,
        _serviceId = serviceId,
        _ratings = ratings,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _userRole = userRole,
        _accessToken = accessToken,
        _refreshToken = refreshToken;

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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  set about(String? val) => _about = val;

  bool hasAbout() => _about != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "age_group" field.
  String? _ageGroup;
  String get ageGroup => _ageGroup ?? '';
  set ageGroup(String? val) => _ageGroup = val;

  bool hasAgeGroup() => _ageGroup != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "service_id" field.
  int? _serviceId;
  int get serviceId => _serviceId ?? 0;
  set serviceId(int? val) => _serviceId = val;

  void incrementServiceId(int amount) => serviceId = serviceId + amount;

  bool hasServiceId() => _serviceId != null;

  // "ratings" field.
  String? _ratings;
  String get ratings => _ratings ?? '';
  set ratings(String? val) => _ratings = val;

  bool hasRatings() => _ratings != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

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

  static DataaStruct fromMap(Map<String, dynamic> data) => DataaStruct(
        id: castToType<int>(data['id']),
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        image: data['image'] as String?,
        password: data['password'] as String?,
        userName: data['user_name'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phone_number'] as String?,
        address: data['address'] as String?,
        about: data['about'] as String?,
        status: data['status'] as String?,
        gender: data['gender'] as String?,
        ageGroup: data['age_group'] as String?,
        createdBy: data['created_by'] as String?,
        serviceId: castToType<int>(data['service_id']),
        ratings: data['ratings'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        userRole: data['user_role'] as String?,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
      );

  static DataaStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'last_name': _lastName,
        'image': _image,
        'password': _password,
        'user_name': _userName,
        'email': _email,
        'phone_number': _phoneNumber,
        'address': _address,
        'about': _about,
        'status': _status,
        'gender': _gender,
        'age_group': _ageGroup,
        'created_by': _createdBy,
        'service_id': _serviceId,
        'ratings': _ratings,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'user_role': _userRole,
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
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
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'about': serializeParam(
          _about,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'age_group': serializeParam(
          _ageGroup,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'service_id': serializeParam(
          _serviceId,
          ParamType.int,
        ),
        'ratings': serializeParam(
          _ratings,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
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
      }.withoutNulls;

  static DataaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataaStruct(
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
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        about: deserializeParam(
          data['about'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        ageGroup: deserializeParam(
          data['age_group'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.String,
          false,
        ),
        serviceId: deserializeParam(
          data['service_id'],
          ParamType.int,
          false,
        ),
        ratings: deserializeParam(
          data['ratings'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
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
      );

  @override
  String toString() => 'DataaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataaStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        image == other.image &&
        password == other.password &&
        userName == other.userName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        address == other.address &&
        about == other.about &&
        status == other.status &&
        gender == other.gender &&
        ageGroup == other.ageGroup &&
        createdBy == other.createdBy &&
        serviceId == other.serviceId &&
        ratings == other.ratings &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        userRole == other.userRole &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        image,
        password,
        userName,
        email,
        phoneNumber,
        address,
        about,
        status,
        gender,
        ageGroup,
        createdBy,
        serviceId,
        ratings,
        createdAt,
        updatedAt,
        userRole,
        accessToken,
        refreshToken
      ]);
}

DataaStruct createDataaStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? image,
  String? password,
  String? userName,
  String? email,
  String? phoneNumber,
  String? address,
  String? about,
  String? status,
  String? gender,
  String? ageGroup,
  String? createdBy,
  int? serviceId,
  String? ratings,
  String? createdAt,
  String? updatedAt,
  String? userRole,
  String? accessToken,
  String? refreshToken,
}) =>
    DataaStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      image: image,
      password: password,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      about: about,
      status: status,
      gender: gender,
      ageGroup: ageGroup,
      createdBy: createdBy,
      serviceId: serviceId,
      ratings: ratings,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userRole: userRole,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
