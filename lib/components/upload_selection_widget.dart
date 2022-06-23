import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadSelectionWidget extends StatefulWidget {
  const UploadSelectionWidget({Key key}) : super(key: key);

  @override
  _UploadSelectionWidgetState createState() => _UploadSelectionWidgetState();
}

class _UploadSelectionWidgetState extends State<UploadSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: ListTile(
            title: Text(
              'Upload a new Video',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    color: Color(0x7FFFFFFF),
                  ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFF640D),
              size: 20,
            ),
            dense: false,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: ListTile(
            title: Text(
              'Upload a new Photo',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    color: Color(0x7FFFFFFF),
                  ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFF640D),
              size: 20,
            ),
            dense: false,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: ListTile(
            title: Text(
              'Upload new Text',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    color: Color(0x7FFFFFFF),
                  ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFF640D),
              size: 20,
            ),
            dense: false,
          ),
        ),
      ],
    );
  }
}
