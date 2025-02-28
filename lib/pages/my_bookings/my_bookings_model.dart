import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_bookings_widget.dart' show MyBookingsWidget;
import 'package:flutter/material.dart';

class MyBookingsModel extends FlutterFlowModel<MyBookingsWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getBookingHistory)] action in MyBookings widget.
  ApiCallResponse? apiResultfkm;
  // Stores action output result for [Backend Call - API (getBookingHistory)] action in MyBookings widget.
  ApiCallResponse? apiResultfkmCopy1;
  // Stores action output result for [Backend Call - API (getBookingHistory)] action in MyBookings widget.
  ApiCallResponse? apiResultfkmCopy2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (getBookingHistory)] action in Tab widget.
  ApiCallResponse? apiResultfkmCopyCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
