import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSearchUsersWidget extends StatefulWidget {
  const AllSearchUsersWidget({Key key}) : super(key: key);

  @override
  _AllSearchUsersWidgetState createState() => _AllSearchUsersWidgetState();
}

class _AllSearchUsersWidgetState extends State<AllSearchUsersWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(),
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
        List<UserRecord> listViewUserRecordList =
            snapshot.data.where((u) => u.uid != currentUserUid).toList();
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: listViewUserRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewUserRecord = listViewUserRecordList[listViewIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Slidable(
                actionPane: const SlidableScrollActionPane(),
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Follow',
                    color: Color(0xFFFF640D),
                    icon: FontAwesomeIcons.userPlus,
                    onTap: () {
                      print('SlidableActionWidget pressed ...');
                    },
                  ),
                ],
                child: ListTile(
                  title: Text(
                    listViewUserRecord.displayName,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                  subtitle: Text(
                    listViewUserRecord.phoneNumber,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0x99FFFFFF),
                        ),
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
