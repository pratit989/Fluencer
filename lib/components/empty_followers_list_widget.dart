import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyFollowersListWidget extends StatefulWidget {
  const EmptyFollowersListWidget({Key key}) : super(key: key);

  @override
  _EmptyFollowersListWidgetState createState() =>
      _EmptyFollowersListWidgetState();
}

class _EmptyFollowersListWidgetState extends State<EmptyFollowersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'No Followers',
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xB3FFFFFF),
          ),
    );
  }
}
