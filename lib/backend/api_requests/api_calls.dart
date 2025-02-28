import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start lynaUserApis Group Code

class LynaUserApisGroup {
  static String getBaseUrl() => 'https://lyna-health.teexponent.com';
  static Map<String, String> headers = {
    'Accept': 'application/json',
  };
  static CreateUserCall createUserCall = CreateUserCall();
  static CreateProviderCall createProviderCall = CreateProviderCall();
  static GetAllServiceCall getAllServiceCall = GetAllServiceCall();
  static ForgetPasswordSendOtpCall forgetPasswordSendOtpCall =
      ForgetPasswordSendOtpCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static GetResourceByServiceIdCall getResourceByServiceIdCall =
      GetResourceByServiceIdCall();
  static GetAllProviderCall getAllProviderCall = GetAllProviderCall();
  static CreateBookingCall createBookingCall = CreateBookingCall();
  static UploadFileCall uploadFileCall = UploadFileCall();
  static GetBookingHistoryCall getBookingHistoryCall = GetBookingHistoryCall();
  static GetBookingHistoryOfAdvisorCall getBookingHistoryOfAdvisorCall =
      GetBookingHistoryOfAdvisorCall();
  static UploadDocCall uploadDocCall = UploadDocCall();
  static GetAllDocCall getAllDocCall = GetAllDocCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static TermConditionCall termConditionCall = TermConditionCall();
  static PrivacyPolicyCall privacyPolicyCall = PrivacyPolicyCall();
  static AboutUsCall aboutUsCall = AboutUsCall();
  static HelpSupportCall helpSupportCall = HelpSupportCall();
  static ContactusCall contactusCall = ContactusCall();
  static ChangeLAnguageCall changeLAnguageCall = ChangeLAnguageCall();
  static CreateFolderCall createFolderCall = CreateFolderCall();
  static AddDocInFolderCall addDocInFolderCall = AddDocInFolderCall();
  static ViewAllFolderCall viewAllFolderCall = ViewAllFolderCall();
  static ViewAllResourceCall viewAllResourceCall = ViewAllResourceCall();
  static ViewAllDocInFolderCall viewAllDocInFolderCall =
      ViewAllDocInFolderCall();
  static UserChangeEmailCall userChangeEmailCall = UserChangeEmailCall();
  static VerifyEmailOtpCall verifyEmailOtpCall = VerifyEmailOtpCall();
  static CallStartEndApiCall callStartEndApiCall = CallStartEndApiCall();
  static CancelBookingUserCall cancelBookingUserCall = CancelBookingUserCall();
  static CancelBookingAdvisorCall cancelBookingAdvisorCall =
      CancelBookingAdvisorCall();
  static AddReviewCall addReviewCall = AddReviewCall();
  static CreateTimeSlotCall createTimeSlotCall = CreateTimeSlotCall();
  static GetAllReviewsCall getAllReviewsCall = GetAllReviewsCall();
  static GetCreatedSlotByAdvisorCall getCreatedSlotByAdvisorCall =
      GetCreatedSlotByAdvisorCall();
  static UserGetAvailableSlotOfAdvisorCall userGetAvailableSlotOfAdvisorCall =
      UserGetAvailableSlotOfAdvisorCall();
  static DeleteSlotCall deleteSlotCall = DeleteSlotCall();
  static UserJoinCallCall userJoinCallCall = UserJoinCallCall();
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? password = '',
    String? contactNumber = '',
    String? gender = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "email": "${email}",
  "password": "${password}",
  "contact_number": "${contactNumber}",
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUser',
      apiUrl: '${baseUrl}/auth/user/register',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProviderCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? password = '',
    String? contactNumber = '',
    int? serviceId,
    String? ageGroup = '',
    String? gender = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "email": "${email}",
  "password": "${password}",
  "contact_number": "${contactNumber}",
  "service_id": ${serviceId},
  "gender": "${gender}",
  "age_group": "${ageGroup}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createProvider',
      apiUrl: '${baseUrl}/auth/service/register',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllServiceCall {
  Future<ApiCallResponse> call({
    String? search = '',
    int? page,
    int? limit,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllService',
      apiUrl: '${baseUrl}/service/list',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'search': search,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ForgetPasswordSendOtpCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'forgetPasswordSendOtp',
      apiUrl: '${baseUrl}/auth/otp/reset',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? otp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? email = '',
    String? otp = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "new_password": "${newPassword}",
  "email": "${email}",
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${baseUrl}/auth/reset/password',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetResourceByServiceIdCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? serviceId,
    String? search = '',
    int? page,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getResourceByServiceId',
      apiUrl: '${baseUrl}/user/service/view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'service_id': serviceId,
        'search': search,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllProviderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? search = '',
    int? page,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllProvider',
      apiUrl: '${baseUrl}/user/provider/view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'search': search,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CreateBookingCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? availableStartTime = '',
    String? availableEndTime = '',
    int? providerId,
    String? bookingDate = '',
    int? providerAvailableId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createBooking',
      apiUrl: '${baseUrl}/user/create/appointment',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'available_start_time': availableStartTime,
        'available_end_time': availableEndTime,
        'provider_id': providerId,
        'booking_date': bookingDate,
        'provider_available_id': providerAvailableId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? files,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'uploadFile',
      apiUrl: '${baseUrl}/auth/file',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'files': files,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingHistoryCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? past = '',
    String? status = '',
    String? isCompleted = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getBookingHistory',
      apiUrl: '${baseUrl}/user/booking/history',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'past': past,
        'status': status,
        'is_completed': isCompleted,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingHistoryOfAdvisorCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? past = '',
    String? status = '',
    String? isCompleted = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getBookingHistoryOfAdvisor',
      apiUrl: '${baseUrl}/advisor/booking-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'past': past,
        'status': status,
        'is_completed': isCompleted,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UploadDocCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? documents = '',
    String? fileName = '',
    String? fileType = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "documents": "${documents}",
  "file_name": "${fileName}",
  "file_type": "${fileType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadDoc',
      apiUrl: '${baseUrl}/user/upload/document',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllDocCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? search = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllDoc',
      apiUrl: '${baseUrl}/user/view/document',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? firstName = '',
    String? lastName = '',
    String? contactNumber = '',
    String? image = '',
    String? gender = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "image": "${image}",
  "contact_number": "${contactNumber}",
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateProfile',
      apiUrl: '${baseUrl}/user/profile/update',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TermConditionCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'termCondition',
      apiUrl: '${baseUrl}/crs/terms-condition-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? desc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].description''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class PrivacyPolicyCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'privacyPolicy',
      apiUrl: '${baseUrl}/crs/privacy-policy-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? desc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].description''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].title''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AboutUsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'aboutUs',
      apiUrl: '${baseUrl}/crs/about-us-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class HelpSupportCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'helpSupport',
      apiUrl: '${baseUrl}/crs/help-support-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ContactusCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? message = '',
    String? phoneNumber = '',
    int? serviceId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "email": "${email}",
  "message": "${message}",
  "phone_number": "${phoneNumber}",
  "service_id": ${serviceId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'contactus',
      apiUrl: '${baseUrl}/crs/contact-us',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ChangeLAnguageCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? language = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "language": "${language}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeLAnguage',
      apiUrl: '${baseUrl}/user/language/update',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class CreateFolderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? folderName = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createFolder',
      apiUrl: '${baseUrl}/user/create/folder',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'folder_name': folderName,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddDocInFolderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? folderId,
    String? documents = '',
    String? fileName = '',
    String? fileType = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'addDocInFolder',
      apiUrl: '${baseUrl}/user/add/folder/document',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'folder_id': folderId,
        'documents': documents,
        'file_name': fileName,
        'file_type': fileType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ViewAllFolderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'viewAllFolder',
      apiUrl: '${baseUrl}/user/view/folder',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewAllResourceCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'viewAllResource',
      apiUrl: '${baseUrl}/crs/resource-content-view',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewAllDocInFolderCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? folderId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'viewAllDocInFolder',
      apiUrl: '${baseUrl}/user/view/folder/document',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'folder_id': folderId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserChangeEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'userChangeEmail',
      apiUrl: '${baseUrl}/user/change/email/otp',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyEmailOtpCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? email = '',
    String? otp = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'verifyEmailOtp',
      apiUrl: '${baseUrl}/user/change/email/verify',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'email': email,
        'otp': otp,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallStartEndApiCall {
  Future<ApiCallResponse> call({
    int? bookingId,
    String? status = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'callStartEndApi',
      apiUrl: '${baseUrl}/advisor/call-status',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'booking_id': bookingId,
        'status': status,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? stat(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class CancelBookingUserCall {
  Future<ApiCallResponse> call({
    int? bookingId,
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelBookingUser',
      apiUrl: '${baseUrl}/user/booking/cancel',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'booking_id': bookingId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelBookingAdvisorCall {
  Future<ApiCallResponse> call({
    int? bookingId,
    String? accessToken = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelBookingAdvisor',
      apiUrl: '${baseUrl}/advisor/booking-cancel',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'booking_id': bookingId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddReviewCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? ratings,
    String? review = '',
    int? bookingId,
    int? providerId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'addReview',
      apiUrl: '${baseUrl}/user/booking/review',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'ratings': ratings,
        'review': review,
        'booking_id': bookingId,
        'provider_id': providerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTimeSlotCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? availableStartTime = '',
    String? availableEndTime = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'createTimeSlot',
      apiUrl: '${baseUrl}/advisor/available-create-time',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'available_start_time': availableStartTime,
        'available_end_time': availableEndTime,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? stat(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class GetAllReviewsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? providerId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllReviews',
      apiUrl: '${baseUrl}/user/provider/rating',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'provider_id': providerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCreatedSlotByAdvisorCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? date = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getCreatedSlotByAdvisor',
      apiUrl: '${baseUrl}/advisor/available-view-time',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserGetAvailableSlotOfAdvisorCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? date = '',
    String? providerId = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'userGetAvailableSlotOfAdvisor',
      apiUrl: '${baseUrl}/user/provider/available',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'date': date,
        'provider_id': providerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class DeleteSlotCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? providerAvailableId,
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteSlot',
      apiUrl: '${baseUrl}/advisor/delete-available-time',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'provider_available_id': providerAvailableId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserJoinCallCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? bookingId = '',
  }) async {
    final baseUrl = LynaUserApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'userJoinCall',
      apiUrl: '${baseUrl}/user/notification-advisor',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'booking_id': bookingId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? stat(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

/// End lynaUserApis Group Code

class LoginuserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginuser',
      apiUrl: 'https://lyna-health.teexponent.com/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user_role''',
      ));
  static String? refresh(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refresh_token''',
      ));
  static String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? access(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
