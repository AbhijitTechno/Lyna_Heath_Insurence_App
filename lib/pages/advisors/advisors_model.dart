import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'advisors_widget.dart' show AdvisorsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AdvisorsModel extends FlutterFlowModel<AdvisorsWidget> {
  ///  Local state fields for this page.

  List<dynamic> advisorList = [];
  void addToAdvisorList(dynamic item) => advisorList.add(item);
  void removeFromAdvisorList(dynamic item) => advisorList.remove(item);
  void removeAtIndexFromAdvisorList(int index) => advisorList.removeAt(index);
  void insertAtIndexInAdvisorList(int index, dynamic item) =>
      advisorList.insert(index, item);
  void updateAdvisorListAtIndex(int index, Function(dynamic) updateFn) =>
      advisorList[index] = updateFn(advisorList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllProvider)] action in advisors widget.
  ApiCallResponse? apiResultfzl;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getAllProvider)] action in TextField widget.
  ApiCallResponse? apiResultvno;
  // Stores action output result for [Backend Call - API (getAllProvider)] action in IconButton widget.
  ApiCallResponse? apiResultvnoCopy;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAllProviderPage1);
  }

  void listViewGetAllProviderPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewGetAllProviderResponse) {
        final pageItems = (LynaUserApisGroup.getAllProviderCall.data(
                  listViewGetAllProviderResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetAllProviderResponse,
                )
              : null,
        );
      });
}
