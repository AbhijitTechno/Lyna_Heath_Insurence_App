import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  int? tabIndex = 0;

  int? sId;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getAllService)] action in SignUp widget.
  ApiCallResponse? apiResultcoj;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3k1i0jkc' /* First Name is required */,
      );
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0rfgdyk6' /* Last Name is required */,
      );
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '60pnkwhu' /* Contact Number is required */,
      );
    }

    if (val.length < 14) {
      return 'Requires at least 14 characters.';
    }
    if (val.length > 14) {
      return 'Maximum 14 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'urfyk48z' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ageDropDown widget.
  String? ageDropDownValue;
  FormFieldController<String>? ageDropDownValueController;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '81cfaogw' /* Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '36sbhjgi' /* minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ln0ybuen' /* 1 lowercase,1 uppercase,1 numb... */,
      );
    }
    return null;
  }

  // State field(s) for confpassword widget.
  FocusNode? confpasswordFocusNode;
  TextEditingController? confpasswordTextController;
  late bool confpasswordVisibility;
  String? Function(BuildContext, String?)? confpasswordTextControllerValidator;
  String? _confpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4wzbs69b' /* Confirm password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'k2i5km08' /* minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'djc9r851' /* 1 lowercase,1 uppercase,1 numb... */,
      );
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (createUser)] action in Button widget.
  ApiCallResponse? apiResultrpi;
  // Stores action output result for [Backend Call - API (createProvider)] action in Button widget.
  ApiCallResponse? apiResultrpicopy;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confpasswordVisibility = false;
    confpasswordTextControllerValidator = _confpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confpasswordFocusNode?.dispose();
    confpasswordTextController?.dispose();
  }
}
