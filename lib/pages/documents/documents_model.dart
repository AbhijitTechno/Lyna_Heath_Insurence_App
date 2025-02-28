import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'documents_widget.dart' show DocumentsWidget;
import 'package:flutter/material.dart';

class DocumentsModel extends FlutterFlowModel<DocumentsWidget> {
  ///  Local state fields for this page.

  List<dynamic> documentList = [];
  void addToDocumentList(dynamic item) => documentList.add(item);
  void removeFromDocumentList(dynamic item) => documentList.remove(item);
  void removeAtIndexFromDocumentList(int index) => documentList.removeAt(index);
  void insertAtIndexInDocumentList(int index, dynamic item) =>
      documentList.insert(index, item);
  void updateDocumentListAtIndex(int index, Function(dynamic) updateFn) =>
      documentList[index] = updateFn(documentList[index]);

  bool? loader = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllDoc)] action in Documents widget.
  ApiCallResponse? apiResultxov;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getAllDoc)] action in TextField widget.
  ApiCallResponse? apiResultxovCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
