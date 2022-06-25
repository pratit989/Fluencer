import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentDisplayWidget extends StatefulWidget {
  const CommentDisplayWidget({
    Key key,
    this.commentDoc,
    this.userRef,
  }) : super(key: key);

  final CommentsRecord commentDoc;
  final DocumentReference userRef;

  @override
  _CommentDisplayWidgetState createState() => _CommentDisplayWidgetState();
}

class _CommentDisplayWidgetState extends State<CommentDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: StreamBuilder<UserRecord>(
        stream: UserRecord.getDocument(widget.userRef),
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
          final rowUserRecord = snapshot.data;
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      rowUserRecord.photoUrl,
                      'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        rowUserRecord.displayName,
                        'Unknown',
                      ),
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      widget.commentDoc.text,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: StreamBuilder<CommentsRecord>(
                      stream: CommentsRecord.getDocument(
                          widget.commentDoc.reference),
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
                        final toggleIconCommentsRecord = snapshot.data;
                        return ToggleIcon(
                          onPressed: () async {
                            final likesElement = currentUserReference;
                            final likesUpdate = toggleIconCommentsRecord.likes
                                    .toList()
                                    .contains(likesElement)
                                ? FieldValue.arrayRemove([likesElement])
                                : FieldValue.arrayUnion([likesElement]);
                            final commentsUpdateData = {
                              'likes': likesUpdate,
                            };
                            await toggleIconCommentsRecord.reference
                                .update(commentsUpdateData);
                          },
                          value: toggleIconCommentsRecord.likes
                              .toList()
                              .contains(currentUserReference),
                          onIcon: Icon(
                            Icons.favorite,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 25,
                          ),
                          offIcon: Icon(
                            Icons.favorite_border,
                            color: Color(0x7FFFFFFF),
                            size: 25,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
