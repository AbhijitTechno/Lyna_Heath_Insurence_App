import '/backend/api_requests/api_calls.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/components/review_card/review_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'all_rating_review_p_age_model.dart';
export 'all_rating_review_p_age_model.dart';

class AllRatingReviewPAgeWidget extends StatefulWidget {
  const AllRatingReviewPAgeWidget({
    super.key,
    required this.id,
    required this.avgRate,
  });

  final int? id;
  final String? avgRate;

  static String routeName = 'allRatingReviewPAge';
  static String routePath = '/allRatingReviewPAge';

  @override
  State<AllRatingReviewPAgeWidget> createState() =>
      _AllRatingReviewPAgeWidgetState();
}

class _AllRatingReviewPAgeWidgetState extends State<AllRatingReviewPAgeWidget> {
  late AllRatingReviewPAgeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllRatingReviewPAgeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult07u = await LynaUserApisGroup.getAllReviewsCall.call(
        accessToken: FFAppState().token,
        providerId: widget.id,
      );

      if ((_model.apiResult07u?.succeeded ?? true)) {
        _model.averageRating = functions.stringNullCheckCopyCopy(getJsonField(
          (_model.apiResult07u?.jsonBody ?? ''),
          r'''$.data.averageRating''',
        ).toString().toString());
        safeSetState(() {});
      }
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'hkf92pfa' /* Reviews */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'wmcwv3mp' /* Overall Rating */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        _model.averageRating,
                                        '0.0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pbah6of8' /* /5 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<ApiCallResponse>(
                    future: LynaUserApisGroup.getAllReviewsCall.call(
                      accessToken: FFAppState().token,
                      providerId: widget.id,
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
                      final listViewGetAllReviewsResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final reviewItem = (getJsonField(
                                            listViewGetAllReviewsResponse
                                                .jsonBody,
                                            r'''$.data.reviews''',
                                          ) !=
                                          null
                                      ? getJsonField(
                                          listViewGetAllReviewsResponse
                                              .jsonBody,
                                          r'''$.data.reviews''',
                                          true,
                                        )
                                      : _model.reviewList)
                                  ?.toList() ??
                              [];
                          if (reviewItem.isEmpty) {
                            return Container(
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              child: NodatafoundWidget(),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: reviewItem.length,
                            separatorBuilder: (_, __) => SizedBox(height: 16.0),
                            itemBuilder: (context, reviewItemIndex) {
                              final reviewItemItem =
                                  reviewItem[reviewItemIndex];
                              return ReviewCardWidget(
                                key: Key(
                                    'Key4o7_${reviewItemIndex}_of_${reviewItem.length}'),
                                dataItem: reviewItemItem,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
