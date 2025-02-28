import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_passwod_widget.dart' show ResetPasswodWidget;
import 'package:flutter/material.dart';

class ResetPasswodModel extends FlutterFlowModel<ResetPasswodWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7xt9rnmy' /* Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'owh3fpc4' /* minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'r9bn73m2' /* 1 lowercase,1 uppercase,1 numb... */,
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
        '42oahux9' /* Confirm Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'b1pyh06q' /* minimum 8 characters required */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'a4g60xf4' /* 1 lowercase,1 uppercase,1 numb... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (resetPassword)] action in resetButton widget.
  ApiCallResponse? apiResultf87;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confpasswordVisibility = false;
    confpasswordTextControllerValidator = _confpasswordTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confpasswordFocusNode?.dispose();
    confpasswordTextController?.dispose();
  }
}
