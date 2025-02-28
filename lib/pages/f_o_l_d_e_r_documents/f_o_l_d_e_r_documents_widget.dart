import '/backend/api_requests/api_calls.dart';
import '/components/nodatafound/nodatafound_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'f_o_l_d_e_r_documents_model.dart';
export 'f_o_l_d_e_r_documents_model.dart';

class FOLDERDocumentsWidget extends StatefulWidget {
  const FOLDERDocumentsWidget({
    super.key,
    required this.otem,
  });

  final dynamic otem;

  static String routeName = 'FOLDERDocuments';
  static String routePath = '/fOLDERDocuments';

  @override
  State<FOLDERDocumentsWidget> createState() => _FOLDERDocumentsWidgetState();
}

class _FOLDERDocumentsWidgetState extends State<FOLDERDocumentsWidget> {
  late FOLDERDocumentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FOLDERDocumentsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultxov = await LynaUserApisGroup.viewAllDocInFolderCall.call(
        accessToken: FFAppState().token,
        folderId: getJsonField(
          widget.otem,
          r'''$.folder_id''',
        ),
      );

      if ((_model.apiResultxov?.succeeded ?? true)) {
        _model.documentList = getJsonField(
                  (_model.apiResultxov?.jsonBody ?? ''),
                  r'''$.data''',
                ) !=
                null
            ? getJsonField(
                (_model.apiResultxov?.jsonBody ?? ''),
                r'''$.data''',
                true,
              )!
            : _model.documentList.toList().cast<dynamic>();
        _model.loader = false;
        safeSetState(() {});
      } else {
        _model.documentList = [];
        _model.loader = false;
        safeSetState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultxov?.jsonBody ?? ''),
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

      _model.loader = false;
      safeSetState(() {});
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
                      borderRadius: 39.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 19.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget.otem,
                          r'''$.folder_name''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                              letterSpacing: 1.0,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.notifications_none,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
        body: Padding(
          padding: EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (!_model.loader!)
                      Builder(
                        builder: (context) {
                          final documentObj = _model.documentList.toList();
                          if (documentObj.isEmpty) {
                            return Center(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                child: NodatafoundWidget(),
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: documentObj.length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.0),
                            itemBuilder: (context, documentObjIndex) {
                              final documentObjItem =
                                  documentObj[documentObjIndex];
                              return Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: getJsonField(
                                              documentObjItem,
                                              r'''$.file_name''',
                                            ) !=
                                            null
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : Color(0xFFF8F0DA),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 13.0, 11.0, 13.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Container(
                                            width: 45.0,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 300),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 300),
                                                  imageUrl: () {
                                                    if ((String var1) {
                                                      return var1 == "PDF" ||
                                                              var1 == "pdf"
                                                          ? true
                                                          : false;
                                                    }(getJsonField(
                                                      documentObjItem,
                                                      r'''$.file_type''',
                                                    ).toString())) {
                                                      return 'https://play-lh.googleusercontent.com/kIwlXqs28otssKK_9AKwdkB6gouex_U2WmtLshTACnwIJuvOqVvJEzewpzuYBXwXQQ=w600-h300-pc0xffffff-pd';
                                                    } else if ((String var1) {
                                                      return var1 == "Other"
                                                          ? true
                                                          : false;
                                                    }(getJsonField(
                                                      documentObjItem,
                                                      r'''$.file_type''',
                                                    ).toString())) {
                                                      return 'https://cdn.pixabay.com/photo/2017/03/08/21/19/file-2127825_640.png';
                                                    } else if ((String var1) {
                                                      return var1 == "EXCEL"
                                                          ? true
                                                          : var1 == "excel"
                                                              ? true
                                                              : false;
                                                    }(getJsonField(
                                                      documentObjItem,
                                                      r'''$.file_type''',
                                                    ).toString())) {
                                                      return 'https://cdn.pixabay.com/photo/2023/06/01/12/02/excel-logo-8033473_640.png';
                                                    } else if ((String var1) {
                                                      return var1 == "DOC"
                                                          ? true
                                                          : var1 == "doc"
                                                              ? true
                                                              : false;
                                                    }(getJsonField(
                                                      documentObjItem,
                                                      r'''$.file_type''',
                                                    ).toString())) {
                                                      return 'https://cdn.pixabay.com/photo/2017/03/08/21/19/file-2127825_640.png';
                                                    } else if ((String var1) {
                                                      return var1 == "IMAGE"
                                                          ? true
                                                          : var1 == "Image"
                                                              ? true
                                                              : false;
                                                    }(getJsonField(
                                                      documentObjItem,
                                                      r'''$.file_type''',
                                                    ).toString())) {
                                                      return 'https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png';
                                                    } else {
                                                      return 'https://w7.pngwing.com/pngs/763/637/png-transparent-directory-icon-folder-miscellaneous-angle-rectangle-thumbnail.png';
                                                    }
                                                  }(),
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                          documentObjItem,
                                                          r'''$.file_name''',
                                                        ) !=
                                                        null
                                                    ? getJsonField(
                                                        documentObjItem,
                                                        r'''$.file_name''',
                                                      ).toString()
                                                    : getJsonField(
                                                        documentObjItem,
                                                        r'''$.folder_name''',
                                                      ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: functions
                                                          .utcToDateFormat(
                                                              getJsonField(
                                                        documentObjItem,
                                                        r'''$.created_at''',
                                                      ).toString())!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ea0c7p1q' /*  /  */,
                                                      ),
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: getJsonField(
                                                                documentObjItem,
                                                                r'''$.file_type''',
                                                              ) !=
                                                              null
                                                          ? getJsonField(
                                                              documentObjItem,
                                                              r'''$.file_type''',
                                                            ).toString()
                                                          : 'Folder',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await downloadFile(
                                                          filename:
                                                              getCurrentTimestamp
                                                                  .millisecondsSinceEpoch
                                                                  .toString(),
                                                          url: getJsonField(
                                                            documentObjItem,
                                                            r'''$.documents''',
                                                          ).toString(),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: getJsonField(
                                                                    documentObjItem,
                                                                    r'''$.file_type''',
                                                                  ) !=
                                                                  null
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .alternate
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            if (getJsonField(
                                                                  documentObjItem,
                                                                  r'''$.file_type''',
                                                                ) !=
                                                                null)
                                                              Icon(
                                                                Icons
                                                                    .file_download_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sPrimaryColor,
                                                                size: 18.0,
                                                              ),
                                                            Text(
                                                              getJsonField(
                                                                        documentObjItem,
                                                                        r'''$.file_type''',
                                                                      ) !=
                                                                      null
                                                                  ? 'Download'
                                                                  : 'Open',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: getJsonField(
                                                                              documentObjItem,
                                                                              r'''$.file_type''',
                                                                            ) !=
                                                                            null
                                                                        ? FlutterFlowTheme.of(context).sPrimaryColor
                                                                        : FlutterFlowTheme.of(context).primaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (getJsonField(
                                                        documentObjItem,
                                                        r'''$.file_type''',
                                                      ) !=
                                                      null)
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Share.share(
                                                              getJsonField(
                                                                documentObjItem,
                                                                r'''$.documents''',
                                                              ).toString(),
                                                              sharePositionOrigin:
                                                                  getWidgetBoundingBox(
                                                                      context),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 75.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .ios_share_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sPrimaryColor,
                                                                  size: 18.0,
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'l2tyujo6' /* Share */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .sPrimaryColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 15.0)),
                                              ),
                                            ].divide(SizedBox(height: 6.0)),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 17.0))
                                          .around(SizedBox(width: 17.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if (_model.loader ?? true)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
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
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
