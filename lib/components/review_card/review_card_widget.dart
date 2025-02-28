import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_card_model.dart';
export 'review_card_model.dart';

class ReviewCardWidget extends StatefulWidget {
  const ReviewCardWidget({
    super.key,
    required this.dataItem,
  });

  final dynamic dataItem;

  @override
  State<ReviewCardWidget> createState() => _ReviewCardWidgetState();
}

class _ReviewCardWidgetState extends State<ReviewCardWidget> {
  late ReviewCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewCardModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(17.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 58.0,
                  height: 58.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: getJsonField(
                      widget.dataItem,
                      r'''$.user.image''',
                    ).toString(),
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getJsonField(
                        widget.dataItem,
                        r'''$.user.first_name''',
                      ).toString()} ${getJsonField(
                        widget.dataItem,
                        r'''$.user.last_name''',
                      ).toString()}',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          direction: Axis.horizontal,
                          rating: functions
                              .doubleToInt(getJsonField(
                                widget.dataItem,
                                r'''$.ratings''',
                              ).toString())
                              .toDouble(),
                          unratedColor: FlutterFlowTheme.of(context).accent1,
                          itemCount: 5,
                          itemSize: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'nr532xyx' /* ( */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: getJsonField(
                                    widget.dataItem,
                                    r'''$.ratings''',
                                  ).toString(),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '6ym24yei' /* ) */,
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
                      ],
                    ),
                  ],
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'uwdmuwvg' /* User */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: Text(
                getJsonField(
                  widget.dataItem,
                  r'''$.review''',
                ).toString(),
                maxLines: 6,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'bwg9cxss' /* Posted on:  */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        TextSpan(
                          text: valueOrDefault<String>(
                            functions.utcToDateFormat(getJsonField(
                              widget.dataItem,
                              r'''$.created_at''',
                            ).toString()),
                            ' N/A',
                          ),
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
