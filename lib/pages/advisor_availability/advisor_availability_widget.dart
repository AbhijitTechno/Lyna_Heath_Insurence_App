import '/backend/api_requests/api_calls.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'advisor_availability_model.dart';
export 'advisor_availability_model.dart';

class AdvisorAvailabilityWidget extends StatefulWidget {
  const AdvisorAvailabilityWidget({
    super.key,
    this.date,
  });

  final DateTime? date;

  static String routeName = 'advisorAvailability';
  static String routePath = '/advisorAvailability';

  @override
  State<AdvisorAvailabilityWidget> createState() =>
      _AdvisorAvailabilityWidgetState();
}

class _AdvisorAvailabilityWidgetState extends State<AdvisorAvailabilityWidget> {
  late AdvisorAvailabilityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorAvailabilityModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timeslotList = functions
          .createTimeslot(9, 18, getCurrentTimestamp)!
          .toList()
          .cast<dynamic>();
      _model.selectedDate = widget.date != null
          ? dateTimeFormat(
              "yyyy-MM-dd",
              widget.date,
              locale: FFLocalizations.of(context).languageCode,
            )
          : dateTimeFormat(
              "yyyy-MM-dd",
              functions.getCurrentDate(),
              locale: FFLocalizations.of(context).languageCode,
            );
      _model.startDate =
          widget.date != null ? widget.date : functions.getCurrentDate();
      _model.startTime = getCurrentTimestamp.toString();
      safeSetState(() {});
    });
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'q34uhcjt' /* Schedule */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pr37yxx5' /* Select Date */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).sPrimaryColor,
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          weekFormat: false,
                          weekStartsMonday: true,
                          initialDate: widget.date != null
                              ? widget.date
                              : functions.getCurrentDate(),
                          rowHeight: 35.0,
                          onChange: (DateTimeRange? newSelectedDate) async {
                            if (_model.calendarSelectedDay == newSelectedDate) {
                              return;
                            }
                            _model.calendarSelectedDay = newSelectedDate;
                            if (_model.calendarSelectedDay!.start >=
                                functions.getCurrentDate()) {
                              _model.selectedDate = dateTimeFormat(
                                "yyyy-MM-dd",
                                _model.calendarSelectedDay?.start,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              );
                              _model.startDate =
                                  _model.calendarSelectedDay?.start;
                              _model.startTime = null;
                              _model.endTime = null;
                              _model.dtdt = _model.calendarSelectedDay?.start;
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Can\'t select previous date',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              _model.selectedDate = null;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          titleStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          dayOfWeekStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).sPrimaryColor,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'sx2yf2r1' /* Choose Time */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: 100.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_model.endTime == null ||
                                  _model.endTime == '')
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'q04b7047' /* Start Time */,
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'zk3dmbct' /*  -   */,
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'xq2ienqr' /* End Time */,
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              if ((_model.startTime != null &&
                                      _model.startTime != '') &&
                                  (_model.endTime != null &&
                                      _model.endTime != ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            functions.utcToTimeFormat(
                                                _model.startTime!),
                                            'Start Time',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'x83tyimb' /*  -   */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            functions.utcToTimeFormat(
                                                _model.endTime!),
                                            'End Time',
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 35.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidClock,
                                  color: FlutterFlowTheme.of(context)
                                      .sPrimaryColor,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  final _datePickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        (_model.startDate ?? DateTime.now())),
                                  );
                                  if (_datePickedTime != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        (_model.startDate ?? DateTime.now())
                                            .year,
                                        (_model.startDate ?? DateTime.now())
                                            .month,
                                        (_model.startDate ?? DateTime.now())
                                            .day,
                                        _datePickedTime.hour,
                                        _datePickedTime.minute,
                                      );
                                    });
                                  } else if (_model.datePicked != null) {
                                    safeSetState(() {
                                      _model.datePicked = _model.startDate;
                                    });
                                  }
                                  _model.startTime =
                                      _model.datePicked?.toString();
                                  safeSetState(() {});
                                  _model.endTime = functions
                                      .editTime(_model.datePicked!)
                                      .toString();
                                  safeSetState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: ((_model.startTime == null ||
                                  _model.startTime == '') ||
                              (_model.selectedDate == null ||
                                  _model.selectedDate == '') ||
                              (_model.endTime == null || _model.endTime == ''))
                          ? null
                          : () async {
                              _model.apiResult9qn = await LynaUserApisGroup
                                  .createTimeSlotCall
                                  .call(
                                accessToken: FFAppState().token,
                                availableStartTime: _model.startTime,
                                availableEndTime: _model.endTime,
                              );

                              if ((_model.apiResult9qn?.succeeded ?? true)) {
                                if (LynaUserApisGroup.createTimeSlotCall.stat(
                                      (_model.apiResult9qn?.jsonBody ?? ''),
                                    ) ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResult9qn?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResult9qn?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  AdvisorAvailabilityWidget.routeName,
                                  queryParameters: {
                                    'date': serializeParam(
                                      _model.dtdt,
                                      ParamType.DateTime,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResult9qn?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'twaulbb2' /* Create Time Slot */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        height: 42.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(10.0),
                        disabledColor: Color(0xFFD9DBDD),
                        disabledTextColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                ),
                if (_model.timeslotList.length != 0)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'sweekgfz' /* Created Slots */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (_model.selectedDate != null && _model.selectedDate != '')
                  FutureBuilder<ApiCallResponse>(
                    future: LynaUserApisGroup.getCreatedSlotByAdvisorCall.call(
                      accessToken: FFAppState().token,
                      date: _model.selectedDate,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final gridViewGetCreatedSlotByAdvisorResponse =
                          snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final timeslotObj = functions
                                  .sortArray(
                                      getJsonField(
                                        gridViewGetCreatedSlotByAdvisorResponse
                                            .jsonBody,
                                        r'''$.data''',
                                        true,
                                      ),
                                      'available_start_time')
                                  ?.toList() ??
                              [];
                          if (timeslotObj.isEmpty) {
                            return Container(
                              height: MediaQuery.sizeOf(context).height * 0.22,
                              child: NodatafoundWidget(),
                            );
                          }

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 3.8,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: timeslotObj.length,
                            itemBuilder: (context, timeslotObjIndex) {
                              final timeslotObjItem =
                                  timeslotObj[timeslotObjIndex];
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    (bool var1) {
                                      return var1 ? true : false;
                                    }(getJsonField(
                                      timeslotObjItem,
                                      r'''$.booked''',
                                    ))
                                        ? Color(0xFFB3E2CF)
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      (bool var1) {
                                        return var1 ? true : false;
                                      }(getJsonField(
                                        timeslotObjItem,
                                        r'''$.booked''',
                                      ))
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context)
                                              .sPrimaryColor,
                                      FlutterFlowTheme.of(context)
                                          .sPrimaryColor,
                                    ),
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      functions.utcToTimeFormat(getJsonField(
                                        timeslotObjItem,
                                        r'''$.available_start_time''',
                                      ).toString())!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              (bool var1) {
                                                return var1 ? true : false;
                                              }(getJsonField(
                                                timeslotObjItem,
                                                r'''$.booked''',
                                              ))
                                                  ? Color(0xFF1B7A50)
                                                  : FlutterFlowTheme.of(context)
                                                      .sPrimaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .sPrimaryColor,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7yy3hwtk' /*  -  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              (bool var1) {
                                                return var1 ? true : false;
                                              }(getJsonField(
                                                timeslotObjItem,
                                                r'''$.booked''',
                                              ))
                                                  ? Color(0xFF19995E)
                                                  : FlutterFlowTheme.of(context)
                                                      .sPrimaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .sPrimaryColor,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      functions.utcToTimeFormat(getJsonField(
                                        timeslotObjItem,
                                        r'''$.available_end_time''',
                                      ).toString())!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: valueOrDefault<Color>(
                                              (bool var1) {
                                                return var1 ? true : false;
                                              }(getJsonField(
                                                timeslotObjItem,
                                                r'''$.booked''',
                                              ))
                                                  ? Color(0xFF1B764D)
                                                  : FlutterFlowTheme.of(context)
                                                      .sPrimaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .sPrimaryColor,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text((bool
                                                                var1) {
                                                          return var1
                                                              ? true
                                                              : false;
                                                        }(getJsonField(
                                                          timeslotObjItem,
                                                          r'''$.booked''',
                                                        ))
                                                            ? 'Delete Booked Slot'
                                                            : 'Delete Time Slot'),
                                                        content: Text((bool
                                                                var1) {
                                                          return var1
                                                              ? true
                                                              : false;
                                                        }(getJsonField(
                                                          timeslotObjItem,
                                                          r'''$.booked''',
                                                        ))
                                                            ? 'Are you sure to delete the booked slot?'
                                                            : 'Are you sure to delete?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            _model.apiResultz1p =
                                                await LynaUserApisGroup
                                                    .deleteSlotCall
                                                    .call(
                                              accessToken: FFAppState().token,
                                              providerAvailableId: getJsonField(
                                                timeslotObjItem,
                                                r'''$.id''',
                                              ),
                                            );

                                            if ((_model
                                                    .apiResultz1p?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.apiResultz1p
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                AdvisorAvailabilityWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'date': serializeParam(
                                                    _model.dtdt,
                                                    ParamType.DateTime,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.apiResultz1p
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
