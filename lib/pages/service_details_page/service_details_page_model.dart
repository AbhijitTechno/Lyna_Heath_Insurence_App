import '/components/advisor_card/advisor_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'service_details_page_widget.dart' show ServiceDetailsPageWidget;
import 'package:flutter/material.dart';

class ServiceDetailsPageModel
    extends FlutterFlowModel<ServiceDetailsPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> facilityList = [];
  void addToFacilityList(dynamic item) => facilityList.add(item);
  void removeFromFacilityList(dynamic item) => facilityList.remove(item);
  void removeAtIndexFromFacilityList(int index) => facilityList.removeAt(index);
  void insertAtIndexInFacilityList(int index, dynamic item) =>
      facilityList.insert(index, item);
  void updateFacilityListAtIndex(int index, Function(dynamic) updateFn) =>
      facilityList[index] = updateFn(facilityList[index]);

  List<dynamic> advisorList = [];
  void addToAdvisorList(dynamic item) => advisorList.add(item);
  void removeFromAdvisorList(dynamic item) => advisorList.remove(item);
  void removeAtIndexFromAdvisorList(int index) => advisorList.removeAt(index);
  void insertAtIndexInAdvisorList(int index, dynamic item) =>
      advisorList.insert(index, item);
  void updateAdvisorListAtIndex(int index, Function(dynamic) updateFn) =>
      advisorList[index] = updateFn(advisorList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for advisorCard component.
  late AdvisorCardModel advisorCardModel;

  @override
  void initState(BuildContext context) {
    advisorCardModel = createModel(context, () => AdvisorCardModel());
  }

  @override
  void dispose() {
    advisorCardModel.dispose();
  }
}
