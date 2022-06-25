import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationDisplayWidget extends StatefulWidget {
  const NotificationDisplayWidget({
    Key key,
    this.notificationRef,
  }) : super(key: key);

  final PushNotificationsRecord notificationRef;

  @override
  _NotificationDisplayWidgetState createState() =>
      _NotificationDisplayWidgetState();
}

class _NotificationDisplayWidgetState extends State<NotificationDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if ((widget.notificationRef.notificationImageUrl != null) &&
              (widget.notificationRef.notificationImageUrl != ''))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  widget.notificationRef.notificationImageUrl,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.notificationRef.notificationTitle,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                ),
                AutoSizeText(
                  widget.notificationRef.notificationText,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0x67FFFFFF),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              dateTimeFormat('relative', widget.notificationRef.timestamp),
              textAlign: TextAlign.end,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
