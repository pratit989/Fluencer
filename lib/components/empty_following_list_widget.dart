import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyFollowingListWidget extends StatefulWidget {
  const EmptyFollowingListWidget({Key key}) : super(key: key);

  @override
  _EmptyFollowingListWidgetState createState() =>
      _EmptyFollowingListWidgetState();
}

class _EmptyFollowingListWidgetState extends State<EmptyFollowingListWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'You aren\'t following anyone',
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xB3FFFFFF),
          ),
    );
  }
}
