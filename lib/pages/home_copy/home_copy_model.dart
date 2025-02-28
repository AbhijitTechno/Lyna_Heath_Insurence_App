import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_copy_widget.dart' show HomeCopyWidget;
import 'package:flutter/material.dart';

class HomeCopyModel extends FlutterFlowModel<HomeCopyWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
