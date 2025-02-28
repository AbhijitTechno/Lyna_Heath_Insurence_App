import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resources_widget.dart' show ResourcesWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ResourcesModel extends FlutterFlowModel<ResourcesWidget> {
  ///  Local state fields for this page.

  List<dynamic> resourceList = [];
  void addToResourceList(dynamic item) => resourceList.add(item);
  void removeFromResourceList(dynamic item) => resourceList.remove(item);
  void removeAtIndexFromResourceList(int index) => resourceList.removeAt(index);
  void insertAtIndexInResourceList(int index, dynamic item) =>
      resourceList.insert(index, item);
  void updateResourceListAtIndex(int index, Function(dynamic) updateFn) =>
      resourceList[index] = updateFn(resourceList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getResourceByServiceId)] action in resources widget.
  ApiCallResponse? apiResultkkp;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getResourceByServiceId)] action in TextField widget.
  ApiCallResponse? apiResultv7qCopy;
  // Stores action output result for [Backend Call - API (getResourceByServiceId)] action in IconButton widget.
  ApiCallResponse? apiResultv7q;
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
    return controller
      ..addPageRequestListener(listViewGetResourceByServiceIdPage1);
  }

  void listViewGetResourceByServiceIdPage1(ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewGetResourceByServiceIdResponse) {
        final pageItems = (LynaUserApisGroup.getResourceByServiceIdCall.data(
                  listViewGetResourceByServiceIdResponse.jsonBody,
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
                  lastResponse: listViewGetResourceByServiceIdResponse,
                )
              : null,
        );
      });
}
