import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'rating_comp_widget.dart' show RatingCompWidget;
import 'package:flutter/material.dart';

class RatingCompModel extends FlutterFlowModel<RatingCompWidget> {
  ///  Local state fields for this component.

  int? rating = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jmw4jb9g' /* Review is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (addReview)] action in Button widget.
  ApiCallResponse? apiResultw8a;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
