import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<dynamic> serviceList = [];
  void addToServiceList(dynamic item) => serviceList.add(item);
  void removeFromServiceList(dynamic item) => serviceList.remove(item);
  void removeAtIndexFromServiceList(int index) => serviceList.removeAt(index);
  void insertAtIndexInServiceList(int index, dynamic item) =>
      serviceList.insert(index, item);
  void updateServiceListAtIndex(int index, Function(dynamic) updateFn) =>
      serviceList[index] = updateFn(serviceList[index]);

  int? pageNo = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (changeLAnguage)] action in home widget.
  ApiCallResponse? apiResultnv6;
  // State field(s) for serviceTextField widget.
  FocusNode? serviceTextFieldFocusNode;
  TextEditingController? serviceTextFieldTextController;
  String? Function(BuildContext, String?)?
      serviceTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (getAllService)] action in serviceTextField widget.
  ApiCallResponse? apiResultf60Copy;
  // Stores action output result for [Backend Call - API (getAllService)] action in IconButton widget.
  ApiCallResponse? apiResultf60;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serviceTextFieldFocusNode?.dispose();
    serviceTextFieldTextController?.dispose();

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
    return controller..addPageRequestListener(listViewGetAllServicePage1);
  }

  void listViewGetAllServicePage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then((listViewGetAllServiceResponse) {
        final pageItems = (getJsonField(
                  listViewGetAllServiceResponse.jsonBody,
                  r'''$.data''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetAllServiceResponse,
                )
              : null,
        );
      });
}
