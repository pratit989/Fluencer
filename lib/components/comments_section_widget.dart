import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/comment_display_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsSectionWidget extends StatefulWidget {
  const CommentsSectionWidget({
    Key key,
    this.postRef,
  }) : super(key: key);

  final DocumentReference postRef;

  @override
  _CommentsSectionWidgetState createState() => _CommentsSectionWidgetState();
}

class _CommentsSectionWidgetState extends State<CommentsSectionWidget> {
  CommentsRecord newComment;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: StreamBuilder<List<CommentsRecord>>(
              stream: queryCommentsRecord(
                queryBuilder: (commentsRecord) =>
                    commentsRecord.where('post_ref', isEqualTo: widget.postRef),
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
                List<CommentsRecord> listViewCommentsRecordList = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewCommentsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewCommentsRecord =
                        listViewCommentsRecordList[listViewIndex];
                    return CommentDisplayWidget(
                      commentDoc: listViewCommentsRecord,
                      userRef: listViewCommentsRecord.userRef,
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: AuthUserStreamWidget(
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Write a comment...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Color(0xFF4C4F62),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.send,
                        color: Color(0xFFFF640D),
                        size: 30,
                      ),
                      onPressed: () async {
                        final commentsCreateData = createCommentsRecordData(
                          text: textController.text,
                          commentTime: getCurrentTimestamp,
                          userRef: currentUserReference,
                          postRef: widget.postRef,
                        );
                        var commentsRecordReference =
                            CommentsRecord.collection.doc();
                        await commentsRecordReference.set(commentsCreateData);
                        newComment = CommentsRecord.getDocumentFromData(
                            commentsCreateData, commentsRecordReference);

                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
