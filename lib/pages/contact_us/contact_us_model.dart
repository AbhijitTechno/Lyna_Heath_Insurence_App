import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contact_us_widget.dart' show ContactUsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactUsModel extends FlutterFlowModel<ContactUsWidget> {
  ///  Local state fields for this page.

  int? sId;

  bool? sStat = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  String? _fnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pyfg6aso' /* First name required */,
      );
    }

    return null;
  }

  // State field(s) for lname widget.
  FocusNode? lnameFocusNode;
  TextEditingController? lnameTextController;
  String? Function(BuildContext, String?)? lnameTextControllerValidator;
  String? _lnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rrv7yaeq' /* Last name required */,
      );
    }

    return null;
  }

  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactTextController;
  final contactMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? contactTextControllerValidator;
  String? _contactTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '65jtmdi2' /* Contact number required */,
      );
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }
    if (val.length > 14) {
      return 'Maximum 14 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ay139dzp' /* Email is required */,
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
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  String? _messageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h7hnnbfj' /* Message is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (contactus)] action in Button widget.
  ApiCallResponse? apiResultxgi;

  @override
  void initState(BuildContext context) {
    fnameTextControllerValidator = _fnameTextControllerValidator;
    lnameTextControllerValidator = _lnameTextControllerValidator;
    contactTextControllerValidator = _contactTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    messageTextControllerValidator = _messageTextControllerValidator;
  }

  @override
  void dispose() {
    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();

    contactFocusNode?.dispose();
    contactTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }
}
