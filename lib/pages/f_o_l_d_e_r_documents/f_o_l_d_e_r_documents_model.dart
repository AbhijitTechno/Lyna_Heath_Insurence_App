import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f_o_l_d_e_r_documents_widget.dart' show FOLDERDocumentsWidget;
import 'package:flutter/material.dart';

class FOLDERDocumentsModel extends FlutterFlowModel<FOLDERDocumentsWidget> {
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

  // Stores action output result for [Backend Call - API (viewAllDocInFolder)] action in FOLDERDocuments widget.
  ApiCallResponse? apiResultxov;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
