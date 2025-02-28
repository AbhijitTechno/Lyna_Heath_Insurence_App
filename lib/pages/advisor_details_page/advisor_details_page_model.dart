import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'advisor_details_page_widget.dart' show AdvisorDetailsPageWidget;
import 'package:flutter/material.dart';

class AdvisorDetailsPageModel
    extends FlutterFlowModel<AdvisorDetailsPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> facilityList = [];
  void addToFacilityList(dynamic item) => facilityList.add(item);
  void removeFromFacilityList(dynamic item) => facilityList.remove(item);
  void removeAtIndexFromFacilityList(int index) => facilityList.removeAt(index);
  void insertAtIndexInFacilityList(int index, dynamic item) =>
      facilityList.insert(index, item);
  void updateFacilityListAtIndex(int index, Function(dynamic) updateFn) =>
      facilityList[index] = updateFn(facilityList[index]);

  List<dynamic> reviewList = [];
  void addToReviewList(dynamic item) => reviewList.add(item);
  void removeFromReviewList(dynamic item) => reviewList.remove(item);
  void removeAtIndexFromReviewList(int index) => reviewList.removeAt(index);
  void insertAtIndexInReviewList(int index, dynamic item) =>
      reviewList.insert(index, item);
  void updateReviewListAtIndex(int index, Function(dynamic) updateFn) =>
      reviewList[index] = updateFn(reviewList[index]);

  bool loader = false;

  String? averageRating = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllReviews)] action in advisorDetailsPage widget.
  ApiCallResponse? apiResult07u123;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
