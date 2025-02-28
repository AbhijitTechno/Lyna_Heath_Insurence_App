import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'terms_condition_model.dart';
export 'terms_condition_model.dart';

class TermsConditionWidget extends StatefulWidget {
  const TermsConditionWidget({super.key});

  static String routeName = 'termsCondition';
  static String routePath = '/termsCondition';

  @override
  State<TermsConditionWidget> createState() => _TermsConditionWidgetState();
}

class _TermsConditionWidgetState extends State<TermsConditionWidget> {
  late TermsConditionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsConditionModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 21.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ltqabo9z' /* Terms & Conditions */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(width: 15.0)),
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(19.0, 18.0, 18.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'y0kdpo3r' /* Terms & Conditions : */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                FutureBuilder<ApiCallResponse>(
                  future: LynaUserApisGroup.termConditionCall.call(
                    accessToken: FFAppState().token,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewTermConditionResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final dataObj = LynaUserApisGroup.termConditionCall
                                .data(
                                  listViewTermConditionResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: dataObj.length,
                          itemBuilder: (context, dataObjIndex) {
                            final dataObjItem = dataObj[dataObjIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  21.0, 0.0, 20.0, 21.0),
                              child: Text(
                                getJsonField(
                                  dataObjItem,
                                  r'''$.description''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
