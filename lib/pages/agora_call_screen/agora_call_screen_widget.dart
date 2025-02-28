import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'agora_call_screen_model.dart';
export 'agora_call_screen_model.dart';

class AgoraCallScreenWidget extends StatefulWidget {
  const AgoraCallScreenWidget({
    super.key,
    required this.callId,
    required this.channelName,
  });

  final int? callId;
  final String? channelName;

  static String routeName = 'agoraCallScreen';
  static String routePath = '/agoraCallScreen';

  @override
  State<AgoraCallScreenWidget> createState() => _AgoraCallScreenWidgetState();
}

class _AgoraCallScreenWidgetState extends State<AgoraCallScreenWidget> {
  late AgoraCallScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgoraCallScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.AgoraCallScreen(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                channelName: widget.channelName!,
                userName:
                    '${currentUserData?.data.firstName} ${currentUserData?.data.lastName}',
                role: currentUserData!.data.userRole,
                callEndFunc: () async {
                  if (currentUserData?.data.userRole == 'provider') {
                    _model.apiResultqko =
                        await LynaUserApisGroup.callStartEndApiCall.call(
                      accessToken: FFAppState().token,
                      bookingId: widget.callId,
                      status: 'disconnected',
                    );

                    if ((_model.apiResultqko?.succeeded ?? true)) {
                      safeSetState(() {});
                    }
                  } else {
                    safeSetState(() {});
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      MyBookingsWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }

                  safeSetState(() {});
                },
              ),
            ),
            if (false)
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 90.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 80.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                      _model.timerController.onStopTimer();
                    },
                  ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Container(
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(11.0),
                          child: FlutterFlowTimer(
                            initialTime: _model.timerInitialTimeMs,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              milliSecond: false,
                            ),
                            controller: _model.timerController,
                            updateStateInterval: Duration(milliseconds: 1000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) safeSetState(() {});
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
