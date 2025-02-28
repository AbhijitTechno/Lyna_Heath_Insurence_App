import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      if (currentUserData?.data.userRole == 'provider') {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamedAuth(
          AdvisorBookingsWidget.routeName,
          context.mounted,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
          ignoreRedirect: true,
        );
      } else {
        _model.apiResultnv6 = await LynaUserApisGroup.changeLAnguageCall.call(
          accessToken: FFAppState().token,
          language:
              FFAppState().EnglishLocalized == true ? 'english' : 'spanish',
        );

        if ((_model.apiResultnv6?.succeeded ?? true)) {
          safeSetState(() {});

          safeSetState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Session expired, please login again',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          GoRouter.of(context).prepareAuthEvent(true);
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          FFAppState().token = '';
          FFAppState().user = DataStruct();
          FFAppState().EnglishLocalized = true;
          safeSetState(() {});
        }
      }
    });

    _model.serviceTextFieldTextController ??= TextEditingController();
    _model.serviceTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Opacity(
      opacity: currentUserData?.data.userRole == 'provider' ? 0.0 : 1.0,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 6.0, 6.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  MyyProfileWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 45.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: getJsonField(
                                        currentUserData!.data.toMap(),
                                        r'''$.image''',
                                      ).toString(),
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.jpg',
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'sgqn8skd' /* Welcome to MYPRSN */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF8496B0),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  'Hi, ${currentUserData?.data.firstName} ${functions.stringNullCheck(currentUserData?.data.lastName)}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF1C1F21),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.notifications_none,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 15.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 5.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 14,
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    child: TextFormField(
                                      controller:
                                          _model.serviceTextFieldTextController,
                                      focusNode:
                                          _model.serviceTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.serviceTextFieldTextController',
                                        Duration(milliseconds: 200),
                                        () async {
                                          _model.apiResultf60Copy =
                                              await LynaUserApisGroup
                                                  .getAllServiceCall
                                                  .call(
                                            search: functions.trimString(_model
                                                .serviceTextFieldTextController
                                                .text),
                                            page: 1,
                                            limit: 50,
                                          );

                                          if ((_model.apiResultf60Copy
                                                  ?.succeeded ??
                                              true)) {
                                            _model.serviceList = getJsonField(
                                              (_model.apiResultf60Copy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                              true,
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          } else {
                                            _model.serviceList = getJsonField(
                                              (_model.apiResultf60Copy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                              true,
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '6kkmyv1r' /* Search Services... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        suffixIcon: _model
                                                .serviceTextFieldTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .serviceTextFieldTextController
                                                      ?.clear();
                                                  _model.apiResultf60Copy =
                                                      await LynaUserApisGroup
                                                          .getAllServiceCall
                                                          .call(
                                                    search: functions
                                                        .trimString(_model
                                                            .serviceTextFieldTextController
                                                            .text),
                                                    page: 1,
                                                    limit: 50,
                                                  );

                                                  if ((_model.apiResultf60Copy
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.serviceList =
                                                        getJsonField(
                                                      (_model.apiResultf60Copy
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data''',
                                                      true,
                                                    )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.serviceList =
                                                        getJsonField(
                                                      (_model.apiResultf60Copy
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data''',
                                                      true,
                                                    )!
                                                            .toList()
                                                            .cast<dynamic>();
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 16.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            lineHeight: 1.7,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .serviceTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 10.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0xFF003A80),
                                    icon: Icon(
                                      Icons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: (_model.serviceTextFieldTextController
                                                    .text ==
                                                '')
                                        ? null
                                        : () async {
                                            _model.apiResultf60 =
                                                await LynaUserApisGroup
                                                    .getAllServiceCall
                                                    .call(
                                              search: functions.trimString(_model
                                                  .serviceTextFieldTextController
                                                  .text),
                                              page: 1,
                                              limit: 50,
                                            );

                                            if ((_model
                                                    .apiResultf60?.succeeded ??
                                                true)) {
                                              _model.serviceList = getJsonField(
                                                (_model.apiResultf60
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data''',
                                                true,
                                              )!
                                                  .toList()
                                                  .cast<dynamic>();
                                              safeSetState(() {});
                                            } else {
                                              _model.serviceList = [];
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 45.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 25.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: Image.asset(
                                        'assets/images/Mask_group_(4).png',
                                      ).image,
                                    ),
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
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 8.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xsxdwame' /* Best Health Insurance
for your... */
                                                ,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1gri2xt9' /* Lorem ipsum dolor sit amet.  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'q34r0xxc' /* Free Consultation */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/front-view-young-female-doctor-white-medical-suit-with-stethoscope-smiling-white_1.png',
                                  height: 225.0,
                                  fit: BoxFit.cover,
                                  alignment: Alignment(1.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.serviceTextFieldTextController.text == '')
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child:
                            PagedListView<ApiPagingParams, dynamic>.separated(
                          pagingController: _model.setListViewController1(
                            (nextPageMarker) =>
                                LynaUserApisGroup.getAllServiceCall.call(
                              page: nextPageMarker.nextPageNumber + 1,
                              limit: 10,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                child: NodatafoundWidget(),
                              ),
                            ),
                            itemBuilder: (context, _, serviceObjIndex) {
                              final serviceObjItem = _model
                                  .listViewPagingController1!
                                  .itemList![serviceObjIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ResourcesWidget.routeName,
                                    queryParameters: {
                                      'sID': serializeParam(
                                        getJsonField(
                                          serviceObjItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
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
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 8.0, 10.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl: getJsonField(
                                                    serviceObjItem,
                                                    r'''$.image''',
                                                  ).toString(),
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                functions.stringNullCheckCopy(
                                                    getJsonField(
                                                  serviceObjItem,
                                                  r'''$.name''',
                                                ).toString())!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    if (_model.serviceTextFieldTextController.text != '')
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Builder(
                          builder: (context) {
                            final serviceObj = _model.serviceList.toList();
                            if (serviceObj.isEmpty) {
                              return Center(
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  child: NodatafoundWidget(),
                                ),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: serviceObj.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, serviceObjIndex) {
                                final serviceObjItem =
                                    serviceObj[serviceObjIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ResourcesWidget.routeName,
                                      queryParameters: {
                                        'sID': serializeParam(
                                          getJsonField(
                                            serviceObjItem,
                                            r'''$.id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 8.0, 10.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: getJsonField(
                                                      serviceObjItem,
                                                      r'''$.image''',
                                                    ).toString(),
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  functions.stringNullCheckCopy(
                                                      getJsonField(
                                                    serviceObjItem,
                                                    r'''$.name''',
                                                  ).toString())!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
