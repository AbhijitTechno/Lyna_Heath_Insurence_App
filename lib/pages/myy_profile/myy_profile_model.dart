import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'myy_profile_widget.dart' show MyyProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyyProfileModel extends FlutterFlowModel<MyyProfileWidget> {
  ///  Local state fields for this page.

  String? imgUrl;

  String? imgPath;

  bool? loader = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFile)] action in Icon widget.
  ApiCallResponse? apiResultpue;
  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  String? _fnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd3db2ioc' /* First name is required */,
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
        'h7fbxnrv' /* Last name is required */,
      );
    }

    return null;
  }

  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for contactname widget.
  FocusNode? contactnameFocusNode;
  TextEditingController? contactnameTextController;
  final contactnameMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? contactnameTextControllerValidator;
  String? _contactnameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k7w29fs8' /* Contact number is required */,
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
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? apiResult6t3;

  @override
  void initState(BuildContext context) {
    fnameTextControllerValidator = _fnameTextControllerValidator;
    lnameTextControllerValidator = _lnameTextControllerValidator;
    contactnameTextControllerValidator = _contactnameTextControllerValidator;
  }

  @override
  void dispose() {
    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();

    contactnameFocusNode?.dispose();
    contactnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
