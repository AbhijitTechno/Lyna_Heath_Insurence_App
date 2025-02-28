import '/backend/api_requests/api_calls.dart';
import '/components/advisor_card/advisor_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_appointment_widget.dart' show BookAppointmentWidget;
import 'package:flutter/material.dart';

class BookAppointmentModel extends FlutterFlowModel<BookAppointmentWidget> {
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

  int? slotId;

  bool? loader = false;

  ///  State fields for stateful widgets in this page.

  // Model for advisorCard component.
  late AdvisorCardModel advisorCardModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (createBooking)] action in Button widget.
  ApiCallResponse? apiResultdsh1;

  @override
  void initState(BuildContext context) {
    advisorCardModel = createModel(context, () => AdvisorCardModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    advisorCardModel.dispose();
  }
}
