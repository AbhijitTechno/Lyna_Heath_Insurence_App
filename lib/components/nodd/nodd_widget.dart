import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nodd_model.dart';
export 'nodd_model.dart';

class NoddWidget extends StatefulWidget {
  const NoddWidget({super.key});

  @override
  State<NoddWidget> createState() => _NoddWidgetState();
}

class _NoddWidgetState extends State<NoddWidget> {
  late NoddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoddModel());
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
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        FFLocalizations.of(context).getText(
          'm17xaxit' /* No Data Found! */,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              fontSize: 16.0,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
