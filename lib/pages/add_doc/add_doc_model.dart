import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_doc_widget.dart' show AddDocWidget;
import 'package:flutter/material.dart';

class AddDocModel extends FlutterFlowModel<AddDocWidget> {
  ///  Local state fields for this page.

  List<dynamic> documentList = [];
  void addToDocumentList(dynamic item) => documentList.add(item);
  void removeFromDocumentList(dynamic item) => documentList.remove(item);
  void removeAtIndexFromDocumentList(int index) => documentList.removeAt(index);
  void insertAtIndexInDocumentList(int index, dynamic item) =>
      documentList.insert(index, item);
  void updateDocumentListAtIndex(int index, Function(dynamic) updateFn) =>
      documentList[index] = updateFn(documentList[index]);

  String? url;

  String? nameOfDOc;

  bool? loader = false;

  bool docstat = false;

  int? fId;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFile)] action in Container widget.
  ApiCallResponse? apiResultnk9Copy;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadFile)] action in CircleImage widget.
  ApiCallResponse? apiResultnk9;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8j36gnkp' /* File Name is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for FolderDropDown widget.
  String? folderDropDownValue;
  FormFieldController<String>? folderDropDownValueController;
  // Stores action output result for [Backend Call - API (addDocInFolder)] action in Button widget.
  ApiCallResponse? apiResult12tcopy;
  // Stores action output result for [Backend Call - API (uploadDoc)] action in Button widget.
  ApiCallResponse? apiResult12t;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
