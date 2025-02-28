import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'advisor_availability_widget.dart' show AdvisorAvailabilityWidget;
import 'package:flutter/material.dart';

class AdvisorAvailabilityModel
    extends FlutterFlowModel<AdvisorAvailabilityWidget> {
  ///  Local state fields for this page.

  List<dynamic> timeslotList = [];
  void addToTimeslotList(dynamic item) => timeslotList.add(item);
  void removeFromTimeslotList(dynamic item) => timeslotList.remove(item);
  void removeAtIndexFromTimeslotList(int index) => timeslotList.removeAt(index);
  void insertAtIndexInTimeslotList(int index, dynamic item) =>
      timeslotList.insert(index, item);
  void updateTimeslotListAtIndex(int index, Function(dynamic) updateFn) =>
      timeslotList[index] = updateFn(timeslotList[index]);

  int? selectedSlotIndex;

  String? startTime;

  String? endTime;

  String? selectedDate;

  DateTime? startDate;

  DateTime? end;

  DateTime? dtdt;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (createTimeSlot)] action in Button widget.
  ApiCallResponse? apiResult9qn;
  // Stores action output result for [Backend Call - API (deleteSlot)] action in Icon widget.
  ApiCallResponse? apiResultz1p;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
