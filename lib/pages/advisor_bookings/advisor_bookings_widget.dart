import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/advisor_book_card_copy2/advisor_book_card_copy2_widget.dart';
import '/components/advisor_book_card_copy2_copy/advisor_book_card_copy2_copy_widget.dart';
import '/components/advisor_book_card_copy_copy/advisor_book_card_copy_copy_widget.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'advisor_bookings_model.dart';
export 'advisor_bookings_model.dart';

class AdvisorBookingsWidget extends StatefulWidget {
  const AdvisorBookingsWidget({super.key});

  static String routeName = 'AdvisorBookings';
  static String routePath = '/advisorBookings';

  @override
  State<AdvisorBookingsWidget> createState() => _AdvisorBookingsWidgetState();
}

class _AdvisorBookingsWidgetState extends State<AdvisorBookingsWidget>
    with TickerProviderStateMixin {
  late AdvisorBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvisorBookingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      await Future.wait([
        Future(() async {
          _model.apiResultfkm =
              await LynaUserApisGroup.getBookingHistoryOfAdvisorCall.call(
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
              await LynaUserApisGroup.getBookingHistoryOfAdvisorCall.call(
            accessToken: FFAppState().token,
            isCompleted: 'true',
          );

          if ((_model.apiResultfkmCopy1?.succeeded ?? true)) {
            _model.loader = false;
            _model.cmpleteBookList = getJsonField(
                      (_model.apiResultfkmCopy1?.jsonBody ?? ''),
                      r'''$.data''',
                    ) !=
                    null
                ? getJsonField(
                    (_model.apiResultfkmCopy1?.jsonBody ?? ''),
                    r'''$.data''',
                    true,
                  )!
                : _model.cmpleteBookList.toList().cast<dynamic>();
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
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            _navigate = () => context.goNamedAuth(
                OnboardingWidget.routeName, context.mounted);
            FFAppState().EnglishLocalized = true;
            FFAppState().token = '';
            safeSetState(() {});
            setAppLanguage(context, 'en');
          }
        }),
        Future(() async {
          _model.apiResultfkmCopy2 =
              await LynaUserApisGroup.getBookingHistoryOfAdvisorCall.call(
            accessToken: FFAppState().token,
            status: 'cancel',
          );

          if ((_model.apiResultfkmCopy2?.succeeded ?? true)) {
            _model.loader = false;
            _model.cancelBookList = getJsonField(
                      (_model.apiResultfkmCopy2?.jsonBody ?? ''),
                      r'''$.data''',
                    ) !=
                    null
                ? getJsonField(
                    (_model.apiResultfkmCopy2?.jsonBody ?? ''),
                    r'''$.data''',
                    true,
                  )!
                : _model.cancelBookList.toList().cast<dynamic>();
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
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            _navigate = () => context.goNamedAuth(
                OnboardingWidget.routeName, context.mounted);
            FFAppState().EnglishLocalized = true;
            FFAppState().token = '';
            safeSetState(() {});
            setAppLanguage(context, 'en');
          }
        }),
        Future(() async {
          _model.apiResultfkm1234 =
              await LynaUserApisGroup.getBookingHistoryOfAdvisorCall.call(
            accessToken: FFAppState().token,
            past: 'true',
          );

          if ((_model.apiResultfkm1234?.succeeded ?? true)) {
            _model.loader = false;
            _model.pastBookingList = getJsonField(
                      (_model.apiResultfkm1234?.jsonBody ?? ''),
                      r'''$.data''',
                    ) !=
                    null
                ? getJsonField(
                    (_model.apiResultfkm1234?.jsonBody ?? ''),
                    r'''$.data''',
                    true,
                  )!
                : _model.pastBookingList.toList().cast<dynamic>();
            safeSetState(() {});
          } else {
            _model.loader = false;
            safeSetState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultfkm1234?.jsonBody ?? ''),
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
      ]);

      _navigate();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
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
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 38.0,
                    buttonSize: 35.0,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.close,
                      color: Color(0xFF6C6D6D),
                      size: 18.0,
                    ),
                    onPressed: () async {
                      if (scaffoldKey.currentState!.isDrawerOpen ||
                          scaffoldKey.currentState!.isEndDrawerOpen) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ].addToEnd(SizedBox(width: 20.0)),
              ),
              Container(
                width: 110.0,
                height: 110.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: getJsonField(
                    currentUserData!.data.toMap(),
                    r'''$.image''',
                  ).toString(),
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: valueOrDefault<String>(
                        currentUserData?.data.firstName,
                        'N/A',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        '957i5nwn' /*   */,
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: currentUserData!.data.lastName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  currentUserData?.data.email,
                  'N/A',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).sPrimaryColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                AdvisorAvailabilityWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCalendarCheck,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 22.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'hq3dshe2' /* Schedule */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .sPrimaryColor,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 25.0))
                      .addToStart(SizedBox(height: 15.0)),
                ),
              ),
              Spacer(),
              FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  FFAppState().EnglishLocalized = true;
                  FFAppState().token = '';
                  safeSetState(() {});
                  setAppLanguage(context, 'en');

                  context.goNamedAuth(
                      OnboardingWidget.routeName, context.mounted);
                },
                text: FFLocalizations.of(context).getText(
                  'qzys9oho' /* Log Out */,
                ),
                icon: Icon(
                  Icons.logout,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).sPrimaryColor,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ]
                .divide(SizedBox(height: 18.0))
                .addToStart(SizedBox(height: 30.0))
                .addToEnd(SizedBox(height: 50.0)),
          ),
        ),
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
                        Icons.dehaze,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 21.0,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '7lndbioc' /* Bookings */,
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
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: 40.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              Icons.refresh_sharp,
                              color: FlutterFlowTheme.of(context).sPrimaryColor,
                              size: 21.0,
                            ),
                            onPressed: () async {
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
                            },
                          ),
                          if (false)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                FFAppState().EnglishLocalized = true;
                                FFAppState().token = '';
                                safeSetState(() {});
                                setAppLanguage(context, 'en');

                                context.goNamedAuth(OnboardingWidget.routeName,
                                    context.mounted);
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2.0),
                                    child: Image.asset(
                                      'assets/images/logout.png',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
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
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).sPrimaryColor,
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '6i3vyaa4' /* Upcoming */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'x267pk3v' /* Complete */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'czb5lqrj' /* Cancelled */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'as29xyfc' /* Past */,
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
                                        .getBookingHistoryOfAdvisorCall
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
                                          if ((_model
                                                  .upbookingList.isNotEmpty) &&
                                              !_model.loader!)
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
                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.6,
                                                        child:
                                                            NodatafoundWidget(),
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
                                                        return AdvisorBookCardCopy2Widget(
                                                          key: Key(
                                                              'Keyihm_${upcomingObjIndex}_of_${upcomingObj.length}'),
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
                                      if (!(_model.upbookingList.isNotEmpty) &&
                                          !_model.loader!)
                                        wrapWithModel(
                                          model: _model.nodatafoundModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: NodatafoundWidget(),
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
                                        if ((_model
                                                .cmpleteBookList.isNotEmpty) &&
                                            !_model.loader!)
                                          Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Builder(
                                              builder: (context) {
                                                final comopletedObj = _model
                                                    .cmpleteBookList
                                                    .toList();
                                                if (comopletedObj.isEmpty) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.6,
                                                    child: NodatafoundWidget(),
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
                                                    return AdvisorBookCardCopyCopyWidget(
                                                      key: Key(
                                                          'Keyb4d_${comopletedObjIndex}_of_${comopletedObj.length}'),
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
                                    if (!(_model.cmpleteBookList.isNotEmpty))
                                      wrapWithModel(
                                        model: _model.nodatafoundModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NodatafoundWidget(),
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
                                        if ((_model
                                                .cancelBookList.isNotEmpty) &&
                                            !_model.loader!)
                                          Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Builder(
                                              builder: (context) {
                                                final cancelledObj = _model
                                                    .cancelBookList
                                                    .toList();
                                                if (cancelledObj.isEmpty) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.6,
                                                    child: NodatafoundWidget(),
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
                                                    return AdvisorBookCardCopy2Widget(
                                                      key: Key(
                                                          'Key7aj_${cancelledObjIndex}_of_${cancelledObj.length}'),
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
                                    if (!(_model.cancelBookList.isNotEmpty))
                                      wrapWithModel(
                                        model: _model.nodatafoundModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NodatafoundWidget(),
                                      ),
                                  ],
                                ),
                              ),
                            ),
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
                                          if ((_model.pastBookingList
                                                  .isNotEmpty) &&
                                              !_model.loader!)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final pastObj = _model
                                                        .pastBookingList
                                                        .toList();
                                                    if (pastObj.isEmpty) {
                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.6,
                                                        child:
                                                            NodatafoundWidget(),
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
                                                      itemCount: pastObj.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 15.0),
                                                      itemBuilder: (context,
                                                          pastObjIndex) {
                                                        final pastObjItem =
                                                            pastObj[
                                                                pastObjIndex];
                                                        return AdvisorBookCardCopy2CopyWidget(
                                                          key: Key(
                                                              'Key50a_${pastObjIndex}_of_${pastObj.length}'),
                                                          dataObj: pastObjItem,
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
                                      if (!(_model.pastBookingList.isNotEmpty))
                                        wrapWithModel(
                                          model: _model.nodatafoundModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: NodatafoundWidget(),
                                        ),
                                    ],
                                  ),
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
