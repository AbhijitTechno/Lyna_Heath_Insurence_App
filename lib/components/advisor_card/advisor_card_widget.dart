import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'advisor_card_model.dart';
export 'advisor_card_model.dart';

class AdvisorCardWidget extends StatefulWidget {
  const AdvisorCardWidget({
    super.key,
    this.dataObj,
    this.rating,
  });

  final dynamic dataObj;
  final String? rating;

  @override
  State<AdvisorCardWidget> createState() => _AdvisorCardWidgetState();
}

class _AdvisorCardWidgetState extends State<AdvisorCardWidget> {
  late AdvisorCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorCardModel());
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
      height: 120.0,
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
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: getJsonField(
                      widget.dataObj,
                      r'''$.image''',
                    ).toString(),
                    width: 105.0,
                    height: 190.0,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.jpg',
                      width: 105.0,
                      height: 190.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.stringNullCheckCopy('${getJsonField(
                              widget.dataObj,
                              r'''$.first_name''',
                            ).toString()} ${getJsonField(
                              widget.dataObj,
                              r'''$.last_name''',
                            ).toString()}'),
                            ' N/A',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF31353B),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 0.0, 0.0),
                        child: Text(
                          functions.stringNullCheckCopy(getJsonField(
                            widget.dataObj,
                            r'''$.service.name''',
                          ).toString())!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF8496B0),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            Text(
                              functions.stringNullCheckCopy(getJsonField(
                                widget.dataObj,
                                r'''$.address''',
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
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Container(
              width: 70.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Color(0xFF003A80),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 16.0,
                  ),
                  Text(
                    functions.stringNullCheck(widget.rating)!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 6.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
