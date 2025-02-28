import '/backend/api_requests/api_calls.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'advisor_bookings_widget.dart' show AdvisorBookingsWidget;
import 'package:flutter/material.dart';

class AdvisorBookingsModel extends FlutterFlowModel<AdvisorBookingsWidget> {
  ///  Local state fields for this page.

  List<dynamic> upbookingList = [];
  void addToUpbookingList(dynamic item) => upbookingList.add(item);
  void removeFromUpbookingList(dynamic item) => upbookingList.remove(item);
  void removeAtIndexFromUpbookingList(int index) =>
      upbookingList.removeAt(index);
  void insertAtIndexInUpbookingList(int index, dynamic item) =>
      upbookingList.insert(index, item);
  void updateUpbookingListAtIndex(int index, Function(dynamic) updateFn) =>
      upbookingList[index] = updateFn(upbookingList[index]);

  List<dynamic> cmpleteBookList = [];
  void addToCmpleteBookList(dynamic item) => cmpleteBookList.add(item);
  void removeFromCmpleteBookList(dynamic item) => cmpleteBookList.remove(item);
  void removeAtIndexFromCmpleteBookList(int index) =>
      cmpleteBookList.removeAt(index);
  void insertAtIndexInCmpleteBookList(int index, dynamic item) =>
      cmpleteBookList.insert(index, item);
  void updateCmpleteBookListAtIndex(int index, Function(dynamic) updateFn) =>
      cmpleteBookList[index] = updateFn(cmpleteBookList[index]);

  List<dynamic> cancelBookList = [];
  void addToCancelBookList(dynamic item) => cancelBookList.add(item);
  void removeFromCancelBookList(dynamic item) => cancelBookList.remove(item);
  void removeAtIndexFromCancelBookList(int index) =>
      cancelBookList.removeAt(index);
  void insertAtIndexInCancelBookList(int index, dynamic item) =>
      cancelBookList.insert(index, item);
  void updateCancelBookListAtIndex(int index, Function(dynamic) updateFn) =>
      cancelBookList[index] = updateFn(cancelBookList[index]);

  bool? loader = true;

  List<dynamic> pastBookingList = [];
  void addToPastBookingList(dynamic item) => pastBookingList.add(item);
  void removeFromPastBookingList(dynamic item) => pastBookingList.remove(item);
  void removeAtIndexFromPastBookingList(int index) =>
      pastBookingList.removeAt(index);
  void insertAtIndexInPastBookingList(int index, dynamic item) =>
      pastBookingList.insert(index, item);
  void updatePastBookingListAtIndex(int index, Function(dynamic) updateFn) =>
      pastBookingList[index] = updateFn(pastBookingList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getBookingHistoryOfAdvisor)] action in AdvisorBookings widget.
  ApiCallResponse? apiResultfkm;
  // Stores action output result for [Backend Call - API (getBookingHistoryOfAdvisor)] action in AdvisorBookings widget.
  ApiCallResponse? apiResultfkmCopy1;
  // Stores action output result for [Backend Call - API (getBookingHistoryOfAdvisor)] action in AdvisorBookings widget.
  ApiCallResponse? apiResultfkmCopy2;
  // Stores action output result for [Backend Call - API (getBookingHistoryOfAdvisor)] action in AdvisorBookings widget.
  ApiCallResponse? apiResultfkm1234;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (getBookingHistoryOfAdvisor)] action in Tab widget.
  ApiCallResponse? apiResultfkmCopyCopy;
  // Model for nodatafound component.
  late NodatafoundModel nodatafoundModel1;
  // Model for nodatafound component.
  late NodatafoundModel nodatafoundModel2;
  // Model for nodatafound component.
  late NodatafoundModel nodatafoundModel3;
  // Model for nodatafound component.
  late NodatafoundModel nodatafoundModel4;

  @override
  void initState(BuildContext context) {
    nodatafoundModel1 = createModel(context, () => NodatafoundModel());
    nodatafoundModel2 = createModel(context, () => NodatafoundModel());
    nodatafoundModel3 = createModel(context, () => NodatafoundModel());
    nodatafoundModel4 = createModel(context, () => NodatafoundModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nodatafoundModel1.dispose();
    nodatafoundModel2.dispose();
    nodatafoundModel3.dispose();
    nodatafoundModel4.dispose();
  }
}
