import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'advisor_book_card_copy2_model.dart';
export 'advisor_book_card_copy2_model.dart';

class AdvisorBookCardCopy2Widget extends StatefulWidget {
  const AdvisorBookCardCopy2Widget({
    super.key,
    this.dataObj,
  });

  final dynamic dataObj;

  @override
  State<AdvisorBookCardCopy2Widget> createState() =>
      _AdvisorBookCardCopy2WidgetState();
}

class _AdvisorBookCardCopy2WidgetState
    extends State<AdvisorBookCardCopy2Widget> {
  late AdvisorBookCardCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorBookCardCopy2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: (String var1) {
        return var1 == "pending"
            ? true
            : var1 == "confirmed"
                ? true
                : false;
      }(getJsonField(
        widget.dataObj,
        r'''$.status''',
      ).toString())
          ? 220.0
          : 190.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 2.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 12.0, 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: getJsonField(
                      widget.dataObj,
                      r'''$.user.image''',
                    ).toString(),
                    width: 105.0,
                    height: 105.0,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.jpg',
                      width: 105.0,
                      height: 105.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    functions.stringNullCheckCopy(getJsonField(
                                      widget.dataObj,
                                      r'''$.user.first_name''',
                                    ).toString()),
                                    ' N/A',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF31353B),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '7brirvp5' /*   */,
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    functions.stringNullCheckCopy(getJsonField(
                                      widget.dataObj,
                                      r'''$.user.last_name''',
                                    ).toString()),
                                    ' N/A',
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF31353B),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions.stringNullCheckCopy(getJsonField(
                                widget.dataObj,
                                r'''$.user.email''',
                              ).toString()),
                              ' N/A',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 18.0,
                                height: 18.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/location.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    functions.stringNullCheckCopy(getJsonField(
                                      widget.dataObj,
                                      r'''$.user.address''',
                                    ).toString()),
                                    'NA',
                                  ),
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 18.0,
                              height: 18.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/calendar.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: functions
                                          .utcToDateFormat(getJsonField(
                                        widget.dataObj,
                                        r'''$.booked_date''',
                                      ).toString())!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'a6oeqjkh' /* ,  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: functions
                                          .utcToTimeFormat(getJsonField(
                                        widget.dataObj,
                                        r'''$.availableStartTime''',
                                      ).toString())!,
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'wz84koov' /*  -  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: functions
                                          .utcToTimeFormat(getJsonField(
                                        widget.dataObj,
                                        r'''$.availableEndTime''',
                                      ).toString())!,
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (String var1) {
                        return var1 == "connected" ? true : false;
                      }(getJsonField(
                        widget.dataObj,
                        r'''$.call_connect''',
                      ).toString())
                          ? Color(0xFFB4EEE7)
                          : FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: valueOrDefault<Color>(
                          (String var1) {
                            return var1 == "connected" ? true : false;
                          }(getJsonField(
                            widget.dataObj,
                            r'''$.call_connect''',
                          ).toString())
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).primaryBackground,
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 26.0,
                        height: 26.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/video.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            indent: 16.0,
            endIndent: 16.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          if ((String var1) {
            return var1 == "pending"
                ? false
                : var1 == "confirmed"
                    ? false
                    : true;
          }(getJsonField(
            widget.dataObj,
            r'''$.status''',
          ).toString()))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '0zlp3l58' /* CANCELLED */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          if ((String var1) {
            return var1 == "pending"
                ? true
                : var1 == "confirmed"
                    ? true
                    : false;
          }(getJsonField(
            widget.dataObj,
            r'''$.status''',
          ).toString()))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Cancel Booking'),
                                  content: Text('Are you sure to cancel?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          _model.apiResult3q6 = await LynaUserApisGroup
                              .cancelBookingAdvisorCall
                              .call(
                            bookingId: getJsonField(
                              widget.dataObj,
                              r'''$.id''',
                            ),
                            accessToken: FFAppState().token,
                          );

                          if ((_model.apiResult3q6?.succeeded ?? true)) {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              AdvisorBookingsWidget.routeName,
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
                                    (_model.apiResult3q6?.jsonBody ?? ''),
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
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'svw3juce' /* Cancel */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.apiResultk14 =
                            await LynaUserApisGroup.callStartEndApiCall.call(
                          accessToken: FFAppState().token,
                          bookingId: getJsonField(
                            widget.dataObj,
                            r'''$.id''',
                          ),
                          status: 'connected',
                        );

                        if ((_model.apiResultk14?.succeeded ?? true)) {
                          if (LynaUserApisGroup.callStartEndApiCall.stat(
                                (_model.apiResultk14?.jsonBody ?? ''),
                              ) ==
                              true) {
                            context.pushNamed(
                              AgoraCallScreenWidget.routeName,
                              queryParameters: {
                                'callId': serializeParam(
                                  getJsonField(
                                    widget.dataObj,
                                    r'''$.id''',
                                  ),
                                  ParamType.int,
                                ),
                                'channelName': serializeParam(
                                  getJsonField(
                                    widget.dataObj,
                                    r'''$.channel_name''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getJsonField(
                                    (_model.apiResultk14?.jsonBody ?? ''),
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
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                getJsonField(
                                  (_model.apiResultk14?.jsonBody ?? ''),
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
                        'bgy4vq59' /* Start */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).warning,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
