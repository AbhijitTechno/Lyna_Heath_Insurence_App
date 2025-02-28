import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agora_call_screen_widget.dart' show AgoraCallScreenWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class AgoraCallScreenModel extends FlutterFlowModel<AgoraCallScreenWidget> {
  ///  Local state fields for this page.

  double? time;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (callStartEndApi)] action in AgoraCallScreen widget.
  ApiCallResponse? apiResultqko;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
