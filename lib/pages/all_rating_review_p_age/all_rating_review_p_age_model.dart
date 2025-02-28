import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_rating_review_p_age_widget.dart' show AllRatingReviewPAgeWidget;
import 'package:flutter/material.dart';

class AllRatingReviewPAgeModel
    extends FlutterFlowModel<AllRatingReviewPAgeWidget> {
  ///  Local state fields for this page.

  List<dynamic> reviewList = [];
  void addToReviewList(dynamic item) => reviewList.add(item);
  void removeFromReviewList(dynamic item) => reviewList.remove(item);
  void removeAtIndexFromReviewList(int index) => reviewList.removeAt(index);
  void insertAtIndexInReviewList(int index, dynamic item) =>
      reviewList.insert(index, item);
  void updateReviewListAtIndex(int index, Function(dynamic) updateFn) =>
      reviewList[index] = updateFn(reviewList[index]);

  bool loader = true;

  String? averageRating = '0.0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllReviews)] action in allRatingReviewPAge widget.
  ApiCallResponse? apiResult07u;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
