import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/advisor_book_card/advisor_book_card_widget.dart';
import '/components/advisor_book_card_copy/advisor_book_card_copy_widget.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_bookings_model.dart';
export 'my_bookings_model.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({super.key});

  static String routeName = 'MyBookings';
  static String routePath = '/myBookings';

  @override
  State<MyBookingsWidget> createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget>
    with TickerProviderStateMixin {
  late MyBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyBookingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      await Future.wait([
        Future(() async {
          _model.apiResultfkm =
              await LynaUserApisGroup.getBookingHistoryCall.call(
            accessToken: FFAppState().token,
            past: 'false',
          );

          if ((_model.apiResultfkm?.succeeded ?? true)) {
            _model.upbookingList = getJsonField(
                      (_model.apiResultfkm?.jsonBody ?? ''),
                      r'''$.data''',
                    ) !=
                    null
                ? getJsonField(
                    (_model.apiResultfkm?.jsonBody ?? ''),
                    r'''$.data''',
                    true,
                  )!
                : _model.upbookingList.toList().cast<dynamic>();
            _model.loader = false;
            safeSetState(() {});
          } else {
            _model.loader = false;
            safeSetState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultfkm?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString().toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            _navigate = () => context.goNamedAuth(
                OnboardingWidget.routeName, context.mounted);
            FFAppState().token = '';
            FFAppState().user = DataStruct();
            FFAppState().EnglishLocalized = true;
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiResultfkmCopy1 =
              await LynaUserApisGroup.getBookingHistoryCall.call(
            accessToken: FFAppState().token,
            isCompleted: 'true',
          );

          if ((_model.apiResultfkmCopy1?.succeeded ?? true)) {
            _model.loader = false;
            _model.cmpleteBookList = getJsonField(
              (_model.apiResultfkmCopy1?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                .toList()
                .cast<dynamic>();
            safeSetState(() {});
          } else {
            _model.loader = false;
            safeSetState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultfkmCopy1?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString().toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }
        }),
        Future(() async {
          _model.apiResultfkmCopy2 =
              await LynaUserApisGroup.getBookingHistoryCall.call(
            accessToken: FFAppState().token,
            status: 'cancel',
          );

          if ((_model.apiResultfkmCopy2?.succeeded ?? true)) {
            _model.loader = false;
            _model.cancelBookList = getJsonField(
              (_model.apiResultfkmCopy2?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                .toList()
                .cast<dynamic>();
            safeSetState(() {});
          } else {
            _model.loader = false;
            safeSetState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultfkmCopy2?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString().toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }
        }),
      ]);

      _navigate();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '9rz51j02' /* Bookings */,
                        ),
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
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.notifications_none,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 21.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor:
                              FlutterFlowTheme.of(context).sPrimaryColor,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).sPrimaryColor,
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'n2km3oc0' /* Upcoming */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'azysimdv' /* Completed */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'h0vl3ih1' /* Cancelled */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {
                                Function() _navigate = () {};
                                _model.loader = true;
                                safeSetState(() {});
                                _model.apiResultfkmCopyCopy =
                                    await LynaUserApisGroup
                                        .getBookingHistoryCall
                                        .call(
                                  accessToken: FFAppState().token,
                                  past: 'false',
                                );

                                if ((_model.apiResultfkmCopyCopy?.succeeded ??
                                    true)) {
                                  _model.upbookingList = getJsonField(
                                            (_model.apiResultfkmCopyCopy
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                          ) !=
                                          null
                                      ? getJsonField(
                                          (_model.apiResultfkmCopyCopy
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                          true,
                                        )!
                                      : _model.upbookingList
                                          .toList()
                                          .cast<dynamic>();
                                  _model.loader = false;
                                  safeSetState(() {});
                                } else {
                                  _model.loader = false;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResultfkmCopyCopy
                                                  ?.jsonBody ??
                                              ''),
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
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  _navigate = () => context.goNamedAuth(
                                      OnboardingWidget.routeName,
                                      context.mounted);
                                  FFAppState().token = '';
                                  FFAppState().user = DataStruct();
                                  FFAppState().EnglishLocalized = true;
                                  safeSetState(() {});
                                }

                                _navigate();

                                safeSetState(() {});
                              },
                              () async {},
                              () async {}
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        height: 1.0,
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          if (!_model.loader!)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final upcomingObj = _model
                                                        .upbookingList
                                                        .toList();
                                                    if (upcomingObj.isEmpty) {
                                                      return Center(
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.6,
                                                          child:
                                                              NodatafoundWidget(),
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 15.0),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          upcomingObj.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 15.0),
                                                      itemBuilder: (context,
                                                          upcomingObjIndex) {
                                                        final upcomingObjItem =
                                                            upcomingObj[
                                                                upcomingObjIndex];
                                                        return AdvisorBookCardWidget(
                                                          key: Key(
                                                              'Key5he_${upcomingObjIndex}_of_${upcomingObj.length}'),
                                                          dataObj:
                                                              upcomingObjItem,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          if (_model.loader ?? true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Lottie.asset(
                                                'assets/jsons/Animation_-_1723545637835.json',
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      height: 1.0,
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if (!_model.loader!)
                                          Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Builder(
                                              builder: (context) {
                                                final comopletedObj = _model
                                                    .cmpleteBookList
                                                    .toList();
                                                if (comopletedObj.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.6,
                                                      child:
                                                          NodatafoundWidget(),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      comopletedObj.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 15.0),
                                                  itemBuilder: (context,
                                                      comopletedObjIndex) {
                                                    final comopletedObjItem =
                                                        comopletedObj[
                                                            comopletedObjIndex];
                                                    return AdvisorBookCardCopyWidget(
                                                      key: Key(
                                                          'Keyejm_${comopletedObjIndex}_of_${comopletedObj.length}'),
                                                      dataObj:
                                                          comopletedObjItem,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        if (_model.loader ?? true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.asset(
                                              'assets/jsons/Animation_-_1723545637835.json',
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      height: 1.0,
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if (!_model.loader!)
                                          Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Builder(
                                              builder: (context) {
                                                final cancelledObj = _model
                                                    .cancelBookList
                                                    .toList();
                                                if (cancelledObj.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.6,
                                                      child:
                                                          NodatafoundWidget(),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      cancelledObj.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 15.0),
                                                  itemBuilder: (context,
                                                      cancelledObjIndex) {
                                                    final cancelledObjItem =
                                                        cancelledObj[
                                                            cancelledObjIndex];
                                                    return AdvisorBookCardWidget(
                                                      key: Key(
                                                          'Keyjn1_${cancelledObjIndex}_of_${cancelledObj.length}'),
                                                      dataObj: cancelledObjItem,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        if (_model.loader ?? true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.asset(
                                              'assets/jsons/Animation_-_1723545637835.json',
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
