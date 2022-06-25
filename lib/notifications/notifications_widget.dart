import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/notification_display_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<PushNotificationsRecord>>(
            stream: queryPushNotificationsRecord(
              queryBuilder: (pushNotificationsRecord) => pushNotificationsRecord
                  .where('user_refs', arrayContains: currentUserReference),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF640D),
                    ),
                  ),
                );
              }
              List<PushNotificationsRecord>
                  listViewPushNotificationsRecordList = snapshot.data;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewPushNotificationsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewPushNotificationsRecord =
                      listViewPushNotificationsRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: NotificationDisplayWidget(
                      notificationRef: listViewPushNotificationsRecord,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
