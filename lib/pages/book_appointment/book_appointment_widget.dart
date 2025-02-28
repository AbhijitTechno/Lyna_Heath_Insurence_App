import '/backend/api_requests/api_calls.dart';
import '/components/advisor_card/advisor_card_widget.dart';
import '/components/confirmation_component/confirmation_component_widget.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'book_appointment_model.dart';
export 'book_appointment_model.dart';

class BookAppointmentWidget extends StatefulWidget {
  const BookAppointmentWidget({
    super.key,
    required this.dataItem,
    this.rating,
  });

  final dynamic dataItem;
  final String? rating;

  static String routeName = 'bookAppointment';
  static String routePath = '/bookAppointment';

  @override
  State<BookAppointmentWidget> createState() => _BookAppointmentWidgetState();
}

class _BookAppointmentWidgetState extends State<BookAppointmentWidget> {
  late BookAppointmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookAppointmentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timeslotList = functions
          .createTimeslot(9, 18, getCurrentTimestamp)!
          .toList()
          .cast<dynamic>();
      _model.selectedDate = dateTimeFormat(
        "yyyy-MM-dd",
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      );
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
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Row(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'sbezl9zd' /* Book Appointment */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.advisorCardModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: AdvisorCardWidget(
                      dataObj: widget.dataItem,
                      rating: widget.rating,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ied2b6ci' /* Select Date */,
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
                          initialDate: getCurrentTimestamp,
                          rowHeight: 38.0,
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
                              _model.timeslotList = functions
                                  .createTimeslot(
                                      9, 18, _model.calendarSelectedDay!.start)!
                                  .toList()
                                  .cast<dynamic>();
                              _model.selectedSlotIndex = null;
                              _model.startTime = null;
                              _model.endTime = null;
                              _model.slotId = null;
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
                if (_model.selectedDate != null && _model.selectedDate != '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'ogf0ogo7' /* Select Time Slot */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                if (_model.selectedDate != null && _model.selectedDate != '')
                  FutureBuilder<ApiCallResponse>(
                    future: LynaUserApisGroup.userGetAvailableSlotOfAdvisorCall
                        .call(
                      accessToken: FFAppState().token,
                      date: _model.selectedDate,
                      providerId: getJsonField(
                        widget.dataItem,
                        r'''$.id''',
                      ).toString(),
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
                      final gridViewUserGetAvailableSlotOfAdvisorResponse =
                          snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final timeslotsObj = functions
                                  .sortArray(
                                      LynaUserApisGroup
                                          .userGetAvailableSlotOfAdvisorCall
                                          .data(
                                            gridViewUserGetAvailableSlotOfAdvisorResponse
                                                .jsonBody,
                                          )
                                          ?.toList(),
                                      'available_start_time')
                                  ?.toList() ??
                              [];
                          if (timeslotsObj.isEmpty) {
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
                            itemCount: timeslotsObj.length,
                            itemBuilder: (context, timeslotsObjIndex) {
                              final timeslotsObjItem =
                                  timeslotsObj[timeslotsObjIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedSlotIndex = timeslotsObjIndex;
                                  _model.startTime = '${getJsonField(
                                    timeslotsObjItem,
                                    r'''$.available_start_time''',
                                  ).toString()}';
                                  _model.endTime = '${getJsonField(
                                    timeslotsObjItem,
                                    r'''$.available_end_time''',
                                  ).toString()}';
                                  _model.slotId = getJsonField(
                                    timeslotsObjItem,
                                    r'''$.id''',
                                  );
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                    border: Border.all(
                                      color: timeslotsObjIndex ==
                                              _model.selectedSlotIndex
                                          ? FlutterFlowTheme.of(context)
                                              .sPrimaryColor
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
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
                                          timeslotsObjItem,
                                          r'''$.available_start_time''',
                                        ).toString())!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: timeslotsObjIndex ==
                                                      _model.selectedSlotIndex
                                                  ? FlutterFlowTheme.of(context)
                                                      .sPrimaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '6xp8gecy' /*  -  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        functions.utcToTimeFormat(getJsonField(
                                          timeslotsObjItem,
                                          r'''$.available_end_time''',
                                        ).toString())!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: timeslotsObjIndex ==
                                                      _model.selectedSlotIndex
                                                  ? FlutterFlowTheme.of(context)
                                                      .sPrimaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: ((_model.startTime == null ||
                                    _model.startTime == '') ||
                                (_model.selectedDate == null ||
                                    _model.selectedDate == '') ||
                                (_model.slotId == null))
                            ? null
                            : () async {
                                _model.loader = true;
                                safeSetState(() {});
                                _model.apiResultdsh1 = await LynaUserApisGroup
                                    .createBookingCall
                                    .call(
                                  accessToken: FFAppState().token,
                                  availableStartTime: _model.startTime,
                                  availableEndTime: _model.endTime,
                                  providerId: getJsonField(
                                    widget.dataItem,
                                    r'''$.id''',
                                  ),
                                  bookingDate: _model.selectedDate,
                                  providerAvailableId: _model.slotId,
                                );

                                if ((_model.apiResultdsh1?.succeeded ?? true)) {
                                  _model.loader = false;
                                  safeSetState(() {});
                                  await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: ConfirmationComponentWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResultdsh1?.jsonBody ??
                                              ''),
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
                                          (_model.apiResultdsh1?.jsonBody ??
                                              ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                          't7gyxr3q' /* Make an Appointment */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(10.0),
                          disabledColor: Color(0xFFD9DBDD),
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        showLoadingIndicator: _model.loader!,
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
