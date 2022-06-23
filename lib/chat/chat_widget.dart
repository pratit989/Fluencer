import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/message_display_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key key,
    this.userDoc,
  }) : super(key: key);

  final UserRecord userDoc;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  ConversationRefsRecord conversationRef;
  ConversationsRecord newConversation;
  MessagesRecord firstMessage;
  TextEditingController textController;
  MessagesRecord lastMessage;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          valueOrDefault<String>(
            widget.userDoc.displayName,
            'Unknown',
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  widget.userDoc.photoUrl,
                  'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<List<ConversationRefsRecord>>(
                stream: queryConversationRefsRecord(
                  parent: currentUserReference,
                  queryBuilder: (conversationRefsRecord) =>
                      conversationRefsRecord.where('user_ref',
                          isEqualTo: widget.userDoc.reference),
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
                  List<ConversationRefsRecord>
                      containerConversationRefsRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final containerConversationRefsRecord =
                      containerConversationRefsRecordList.isNotEmpty
                          ? containerConversationRefsRecordList.first
                          : null;
                  return Container(
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<MessagesRecord>>(
                      stream: queryMessagesRecord(
                        parent: containerConversationRefsRecord.conversationRef,
                        queryBuilder: (messagesRecord) =>
                            messagesRecord.orderBy('message_time'),
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
                        List<MessagesRecord> listViewMessagesRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewMessagesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewMessagesRecord =
                                listViewMessagesRecordList[listViewIndex];
                            return MessageDisplayWidget(
                              messageDoc: listViewMessagesRecord,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xFF141A1F),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: TextFormField(
                          controller: textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Write a message...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          maxLines: 5,
                        ),
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
                            final conversationsCreateData =
                                createConversationsRecordData(
                              user1: currentUserReference,
                              user2: widget.userDoc.reference,
                            );
                            var conversationsRecordReference =
                                ConversationsRecord.collection.doc();
                            await conversationsRecordReference
                                .set(conversationsCreateData);
                            newConversation =
                                ConversationsRecord.getDocumentFromData(
                                    conversationsCreateData,
                                    conversationsRecordReference);

                            final conversationRefsCreateData =
                                createConversationRefsRecordData(
                              userRef: currentUserReference,
                              conversationRef: newConversation.reference,
                            );
                            var conversationRefsRecordReference =
                                ConversationRefsRecord.createDoc(
                                    currentUserReference);
                            await conversationRefsRecordReference
                                .set(conversationRefsCreateData);
                            conversationRef =
                                ConversationRefsRecord.getDocumentFromData(
                                    conversationRefsCreateData,
                                    conversationRefsRecordReference);

                            final messagesCreateData = createMessagesRecordData(
                              messageTime: getCurrentTimestamp,
                              messageText: textController.text,
                              messageType: 'text',
                            );
                            var messagesRecordReference =
                                MessagesRecord.createDoc(
                                    conversationRef.conversationRef);
                            await messagesRecordReference
                                .set(messagesCreateData);
                            firstMessage = MessagesRecord.getDocumentFromData(
                                messagesCreateData, messagesRecordReference);

                            setState(() {});
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: StreamBuilder<List<ConversationRefsRecord>>(
                          stream: queryConversationRefsRecord(
                            parent: currentUserReference,
                            queryBuilder: (conversationRefsRecord) =>
                                conversationRefsRecord.where('user_ref',
                                    isEqualTo: widget.userDoc.reference),
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
                            List<ConversationRefsRecord>
                                iconButtonConversationRefsRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final iconButtonConversationRefsRecord =
                                iconButtonConversationRefsRecordList.isNotEmpty
                                    ? iconButtonConversationRefsRecordList.first
                                    : null;
                            return FlutterFlowIconButton(
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
                                final messagesCreateData =
                                    createMessagesRecordData(
                                  messageTime: getCurrentTimestamp,
                                  messageText: textController.text,
                                  messageType: 'text',
                                  fromUserRef: currentUserReference,
                                );
                                var messagesRecordReference =
                                    MessagesRecord.createDoc(
                                        iconButtonConversationRefsRecord
                                            .conversationRef);
                                await messagesRecordReference
                                    .set(messagesCreateData);
                                lastMessage =
                                    MessagesRecord.getDocumentFromData(
                                        messagesCreateData,
                                        messagesRecordReference);

                                setState(() {});
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
