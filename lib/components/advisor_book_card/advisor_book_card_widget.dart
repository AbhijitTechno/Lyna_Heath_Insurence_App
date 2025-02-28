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
import 'advisor_book_card_model.dart';
export 'advisor_book_card_model.dart';

class AdvisorBookCardWidget extends StatefulWidget {
  const AdvisorBookCardWidget({
    super.key,
    this.dataObj,
  });

  final dynamic dataObj;

  @override
  State<AdvisorBookCardWidget> createState() => _AdvisorBookCardWidgetState();
}

class _AdvisorBookCardWidgetState extends State<AdvisorBookCardWidget> {
  late AdvisorBookCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorBookCardModel());
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
                      r'''$.serviceProvider.image''',
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
                          child: Text(
                            functions.stringNullCheckCopy('${getJsonField(
                              widget.dataObj,
                              r'''$.serviceProvider.first_name''',
                            ).toString()} ${getJsonField(
                              widget.dataObj,
                              r'''$.serviceProvider.last_name''',
                            ).toString()}')!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF31353B),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: Text(
                            functions.stringNullCheckCopy(getJsonField(
                              widget.dataObj,
                              r'''$.serviceProvider.service.name''',
                            ).toString())!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8496B0),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
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
                                'assets/images/location.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                functions.stringNullCheckCopy(getJsonField(
                                  widget.dataObj,
                                  r'''$.serviceProvider.address''',
                                ).toString())!,
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
                                        'p1eo9nn8' /* ,  */,
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
                                        'ey90gijq' /*  -  */,
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
                      ].divide(SizedBox(height: 9.0)),
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
                  'qgxb3eo9' /* CANCELLED */,
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
                          _model.apiResultga5 = await LynaUserApisGroup
                              .cancelBookingUserCall
                              .call(
                            bookingId: getJsonField(
                              widget.dataObj,
                              r'''$.id''',
                            ),
                            accessToken: FFAppState().token,
                          );

                          if ((_model.apiResultga5?.succeeded ?? true)) {
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
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getJsonField(
                                    (_model.apiResultga5?.jsonBody ?? ''),
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
                        'x11guqxz' /* Cancel */,
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
                      onPressed: ((String var1) {
                        return var1 == "connected" ? false : true;
                      }(getJsonField(
                        widget.dataObj,
                        r'''$.call_connect''',
                      ).toString()))
                          ? null
                          : () async {
                              _model.apiResultk93 =
                                  await LynaUserApisGroup.userJoinCallCall.call(
                                accessToken: FFAppState().token,
                                bookingId: getJsonField(
                                  widget.dataObj,
                                  r'''$.id''',
                                ).toString(),
                              );

                              if ((_model.apiResultk93?.succeeded ?? true)) {
                                if (LynaUserApisGroup.userJoinCallCall.stat(
                                      (_model.apiResultk93?.jsonBody ?? ''),
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
                                          (_model.apiResultk93?.jsonBody ?? ''),
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
                                        (_model.apiResultk93?.jsonBody ?? ''),
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
                        'p6z5xqje' /* Join */,
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
                        disabledColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).secondaryText,
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
