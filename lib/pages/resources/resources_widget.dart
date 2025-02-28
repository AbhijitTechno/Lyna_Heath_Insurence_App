import '/backend/api_requests/api_calls.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'resources_model.dart';
export 'resources_model.dart';

class ResourcesWidget extends StatefulWidget {
  const ResourcesWidget({
    super.key,
    required this.sID,
  });

  final int? sID;

  static String routeName = 'resources';
  static String routePath = '/resources';

  @override
  State<ResourcesWidget> createState() => _ResourcesWidgetState();
}

class _ResourcesWidgetState extends State<ResourcesWidget> {
  late ResourcesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourcesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultkkp =
          await LynaUserApisGroup.getResourceByServiceIdCall.call(
        accessToken: FFAppState().token,
        serviceId: widget.sID,
        page: 1,
      );

      if (!(_model.apiResultkkp?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultkkp?.jsonBody ?? ''),
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
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'h7x4rwmt' /* List Of Resources */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(17.0, 25.0, 17.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 14,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 200),
                                  () async {
                                    _model.apiResultv7qCopy =
                                        await LynaUserApisGroup
                                            .getResourceByServiceIdCall
                                            .call(
                                      accessToken: FFAppState().token,
                                      serviceId: widget.sID,
                                      search: _model.textController.text,
                                      page: 1,
                                    );

                                    if ((_model.apiResultv7qCopy?.succeeded ??
                                        true)) {
                                      _model.resourceList = LynaUserApisGroup
                                          .getResourceByServiceIdCall
                                          .data(
                                            (_model.apiResultv7qCopy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                      safeSetState(() {});
                                    } else {
                                      _model.resourceList = LynaUserApisGroup
                                          .getResourceByServiceIdCall
                                          .data(
                                            (_model.apiResultv7qCopy
                                                    ?.jsonBody ??
                                                ''),
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
                                  hintText: FFLocalizations.of(context).getText(
                                    'usdijvq6' /* Search topics... */,
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
                                          .textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController?.clear();
                                            _model.apiResultv7qCopy =
                                                await LynaUserApisGroup
                                                    .getResourceByServiceIdCall
                                                    .call(
                                              accessToken: FFAppState().token,
                                              serviceId: widget.sID,
                                              search:
                                                  _model.textController.text,
                                              page: 1,
                                            );

                                            if ((_model.apiResultv7qCopy
                                                    ?.succeeded ??
                                                true)) {
                                              _model.resourceList =
                                                  LynaUserApisGroup
                                                      .getResourceByServiceIdCall
                                                      .data(
                                                        (_model.apiResultv7qCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList()
                                                      .cast<dynamic>();
                                              safeSetState(() {});
                                            } else {
                                              _model.resourceList =
                                                  LynaUserApisGroup
                                                      .getResourceByServiceIdCall
                                                      .data(
                                                        (_model.apiResultv7qCopy
                                                                ?.jsonBody ??
                                                            ''),
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
                                            color: FlutterFlowTheme.of(context)
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
                                validator: _model.textControllerValidator
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
                              onPressed: () async {
                                _model.apiResultv7q = await LynaUserApisGroup
                                    .getResourceByServiceIdCall
                                    .call(
                                  accessToken: FFAppState().token,
                                  serviceId: widget.sID,
                                  search: _model.textController.text,
                                  page: 1,
                                );

                                if ((_model.apiResultv7q?.succeeded ?? true)) {
                                  _model.resourceList = LynaUserApisGroup
                                      .getResourceByServiceIdCall
                                      .data(
                                        (_model.apiResultv7q?.jsonBody ?? ''),
                                      )!
                                      .toList()
                                      .cast<dynamic>();
                                  safeSetState(() {});
                                } else {
                                  _model.resourceList = LynaUserApisGroup
                                      .getResourceByServiceIdCall
                                      .data(
                                        (_model.apiResultv7q?.jsonBody ?? ''),
                                      )!
                                      .toList()
                                      .cast<dynamic>();
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
                if (_model.textController.text == '')
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: PagedListView<ApiPagingParams, dynamic>.separated(
                      pagingController: _model.setListViewController1(
                        (nextPageMarker) =>
                            LynaUserApisGroup.getResourceByServiceIdCall.call(
                          accessToken: FFAppState().token,
                          serviceId: widget.sID,
                          page: nextPageMarker.nextPageNumber + 1,
                        ),
                      ),
                      padding: EdgeInsets.zero,
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
                        itemBuilder: (context, _, resourceObjIndex) {
                          final resourceObjItem = _model
                              .listViewPagingController1!
                              .itemList![resourceObjIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ServiceDetailsPageWidget.routeName,
                                    queryParameters: {
                                      'dataItem': serializeParam(
                                        resourceObjItem,
                                        ParamType.JSON,
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
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        resourceObjItem,
                                        r'''$.title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (_model.textController.text != '')
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Builder(
                      builder: (context) {
                        final resourceObj = _model.resourceList.toList();
                        if (resourceObj.isEmpty) {
                          return Center(
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: NodatafoundWidget(),
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: resourceObj.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, resourceObjIndex) {
                            final resourceObjItem =
                                resourceObj[resourceObjIndex];
                            return Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ServiceDetailsPageWidget.routeName,
                                      queryParameters: {
                                        'dataItem': serializeParam(
                                          resourceObjItem,
                                          ParamType.JSON,
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
                                    child: ListTile(
                                      title: Text(
                                        getJsonField(
                                          resourceObjItem,
                                          r'''$.title''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 18.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
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
    );
  }
}
