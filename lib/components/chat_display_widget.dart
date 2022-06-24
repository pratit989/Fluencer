import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDisplayWidget extends StatefulWidget {
  const ChatDisplayWidget({
    Key key,
    this.conversation,
    this.userDoc,
  }) : super(key: key);

  final ConversationRefsRecord conversation;
  final UserRecord userDoc;

  @override
  _ChatDisplayWidgetState createState() => _ChatDisplayWidgetState();
}

class _ChatDisplayWidgetState extends State<ChatDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ConversationsRecord>(
      future: ConversationsRecord.getDocumentOnce(
          widget.conversation.conversationRef),
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
        final containerConversationsRecord = snapshot.data;
        return Container(
          width: 100,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                    valueOrDefault<String>(
                      widget.userDoc.photoUrl,
                      'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.userDoc.displayName,
                        'Unknown',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                    StreamBuilder<List<MessagesRecord>>(
                      stream: queryMessagesRecord(
                        parent: containerConversationsRecord.reference,
                        queryBuilder: (messagesRecord) => messagesRecord
                            .orderBy('message_time', descending: true),
                        singleRecord: true,
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
                        List<MessagesRecord> textMessagesRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final textMessagesRecord =
                            textMessagesRecordList.isNotEmpty
                                ? textMessagesRecordList.first
                                : null;
                        return Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                                'relative', textMessagesRecord.messageTime),
                            'unknown',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0x67FFFFFF),
                                  ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
