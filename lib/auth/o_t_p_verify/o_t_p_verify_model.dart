import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'o_t_p_verify_widget.dart' show OTPVerifyWidget;
import 'package:flutter/material.dart';

class OTPVerifyModel extends FlutterFlowModel<OTPVerifyWidget> {
  ///  Local state fields for this page.

  bool? loader = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gu0a6r7r' /* Field is required */,
      );
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (resetPassword)] action in Button widget.
  ApiCallResponse? apiResultymy;
  // Stores action output result for [Backend Call - API (forgetPasswordSendOtp)] action in RichText widget.
  ApiCallResponse? apiResultdjd;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
