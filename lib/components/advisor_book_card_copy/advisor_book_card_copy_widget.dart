import '/auth/custom_auth/auth_util.dart';
import '/components/rating_comp/rating_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'advisor_book_card_copy_model.dart';
export 'advisor_book_card_copy_model.dart';

class AdvisorBookCardCopyWidget extends StatefulWidget {
  const AdvisorBookCardCopyWidget({
    super.key,
    this.dataObj,
  });

  final dynamic dataObj;

  @override
  State<AdvisorBookCardCopyWidget> createState() =>
      _AdvisorBookCardCopyWidgetState();
}

class _AdvisorBookCardCopyWidgetState extends State<AdvisorBookCardCopyWidget> {
  late AdvisorBookCardCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorBookCardCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.0,
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
                            functions.stringNullCheckCopy(getJsonField(
                              widget.dataObj,
                              r'''$.serviceProvider.user_name''',
                            ).toString())!,
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
                            maxLines: 2,
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
                                        'oobrir1c' /* ,  */,
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
                                        '31ifwueh' /*  -  */,
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
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
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
          if (currentUserData?.data.userRole == 'provider')
            Expanded(
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'adbrj4m3' /* COMPLETED */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF2AAA9B),
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.5,
                      ),
                ),
                maxLines: 1,
              ),
            ),
          if (currentUserData?.data.userRole == 'client')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          BookAppointmentWidget.routeName,
                          queryParameters: {
                            'dataItem': serializeParam(
                              getJsonField(
                                widget.dataObj,
                                r'''$.serviceProvider''',
                              ),
                              ParamType.JSON,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'oe9gwbrq' /* Book Again */,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.97,
                                  child: RatingCompWidget(
                                    id: getJsonField(
                                      widget.dataObj,
                                      r'''$.id''',
                                    ),
                                    pID: getJsonField(
                                      widget.dataObj,
                                      r'''$.service_provider_id''',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'jkw0rda6' /* Leave Review */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
