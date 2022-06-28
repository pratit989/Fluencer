import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/comments_section_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostViewerWidget extends StatefulWidget {
  const PostViewerWidget({
    Key key,
    this.postRef,
  }) : super(key: key);

  final DocumentReference postRef;

  @override
  _PostViewerWidgetState createState() => _PostViewerWidgetState();
}

class _PostViewerWidgetState extends State<PostViewerWidget> {
  PageController pageViewController;
  PushNotificationsRecord newNotification;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            StreamBuilder<List<PostsRecord>>(
              stream: queryPostsRecord(),
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
                List<PostsRecord> pageViewPostsRecordList = snapshot.data;
                return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  child: PageView.builder(
                    controller: pageViewController ??= PageController(
                        initialPage: min(
                            functions.indexProvider(widget.postRef,
                                pageViewPostsRecordList.toList()),
                            pageViewPostsRecordList.length - 1)),
                    scrollDirection: Axis.vertical,
                    itemCount: pageViewPostsRecordList.length,
                    itemBuilder: (context, pageViewIndex) {
                      final pageViewPostsRecord =
                          pageViewPostsRecordList[pageViewIndex];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        child: Stack(
                          children: [
                            if ((pageViewPostsRecord.postType) == 'video')
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: FlutterFlowVideoPlayer(
                                  path: pageViewPostsRecord.postVideoUrl,
                                  videoType: VideoType.network,
                                  width: MediaQuery.of(context).size.width,
                                  autoPlay: true,
                                  looping: true,
                                  showControls: true,
                                  allowFullScreen: true,
                                  allowPlaybackSpeedMenu: true,
                                ),
                              ),
                            if ((pageViewPostsRecord.postType) == 'img')
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: CachedNetworkImage(
                                  imageUrl: pageViewPostsRecord.postImgUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                                child: StreamBuilder<UserRecord>(
                                  stream: UserRecord.getDocument(
                                      pageViewPostsRecord.parentReference),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                rowUserRecord.photoUrl,
                                                'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                rowUserRecord.displayName,
                                                'Unknown',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                            ),
                                            if ((rowUserRecord.reference) !=
                                                (currentUserReference))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!((currentUserDocument
                                                                  ?.following
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(rowUserRecord
                                                              .reference)) ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (!((currentUserDocument
                                                                        ?.following
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowUserRecord
                                                                        .reference))) {
                                                              final userUpdateData =
                                                                  {
                                                                'following':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  rowUserRecord
                                                                      .reference
                                                                ]),
                                                              };
                                                              await currentUserReference
                                                                  .update(
                                                                      userUpdateData);
                                                            }
                                                            if ((currentUserDocument
                                                                        ?.following
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowUserRecord
                                                                        .reference)) {
                                                              final userUpdateData =
                                                                  {
                                                                'followers':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              };
                                                              await rowUserRecord
                                                                  .reference
                                                                  .update(
                                                                      userUpdateData);
                                                            }

                                                            final pushNotificationsCreateData =
                                                                {
                                                              ...createPushNotificationsRecordData(
                                                                notificationImageUrl:
                                                                    rowUserRecord
                                                                        .photoUrl,
                                                                notificationText:
                                                                    '${valueOrDefault<String>(
                                                                  rowUserRecord
                                                                      .displayName,
                                                                  'Unknown',
                                                                )} started follwing you',
                                                                notificationTitle:
                                                                    'New Follower',
                                                                sender:
                                                                    currentUserReference,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                              ),
                                                              'user_refs': [
                                                                rowUserRecord
                                                                    .reference
                                                              ],
                                                            };
                                                            var pushNotificationsRecordReference =
                                                                PushNotificationsRecord
                                                                    .collection
                                                                    .doc();
                                                            await pushNotificationsRecordReference
                                                                .set(
                                                                    pushNotificationsCreateData);
                                                            newNotification =
                                                                PushNotificationsRecord
                                                                    .getDocumentFromData(
                                                                        pushNotificationsCreateData,
                                                                        pushNotificationsRecordReference);

                                                            setState(() {});
                                                          },
                                                          text: 'Follow',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 120,
                                                            height: 25,
                                                            color: Color(
                                                                0xFFFF640D),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if ((currentUserDocument
                                                                  ?.following
                                                                  ?.toList() ??
                                                              [])
                                                          ?.contains(
                                                              rowUserRecord
                                                                  .reference) ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if ((currentUserDocument
                                                                        ?.following
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowUserRecord
                                                                        .reference)) {
                                                              final userUpdateData =
                                                                  {
                                                                'following':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  rowUserRecord
                                                                      .reference
                                                                ]),
                                                              };
                                                              await currentUserReference
                                                                  .update(
                                                                      userUpdateData);
                                                            }
                                                            if (!((currentUserDocument
                                                                        ?.following
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    rowUserRecord
                                                                        .reference))) {
                                                              final userUpdateData =
                                                                  {
                                                                'followers':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  currentUserReference
                                                                ]),
                                                              };
                                                              await rowUserRecord
                                                                  .reference
                                                                  .update(
                                                                      userUpdateData);
                                                            }
                                                          },
                                                          text: 'Following',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 120,
                                                            height: 25,
                                                            color: Color(
                                                                0xFFFF640D),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ToggleIcon(
                                      onPressed: () async {
                                        final likesElement =
                                            currentUserReference;
                                        final likesUpdate = pageViewPostsRecord
                                                .likes
                                                .toList()
                                                .contains(likesElement)
                                            ? FieldValue.arrayRemove(
                                                [likesElement])
                                            : FieldValue.arrayUnion(
                                                [likesElement]);
                                        final postsUpdateData = {
                                          'likes': likesUpdate,
                                        };
                                        await pageViewPostsRecord.reference
                                            .update(postsUpdateData);
                                      },
                                      value: pageViewPostsRecord.likes
                                          .toList()
                                          .contains(currentUserReference),
                                      onIcon: Icon(
                                        Icons.favorite,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 40,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 40,
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.comment,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                child: CommentsSectionWidget(
                                                  postRef: widget.postRef,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        final fireElement =
                                            currentUserReference;
                                        final fireUpdate = pageViewPostsRecord
                                                .fire
                                                .toList()
                                                .contains(fireElement)
                                            ? FieldValue.arrayRemove(
                                                [fireElement])
                                            : FieldValue.arrayUnion(
                                                [fireElement]);
                                        final postsUpdateData = {
                                          'fire': fireUpdate,
                                        };
                                        await pageViewPostsRecord.reference
                                            .update(postsUpdateData);
                                      },
                                      value: pageViewPostsRecord.fire
                                          .toList()
                                          .contains(currentUserReference),
                                      onIcon: Icon(
                                        Icons.local_fire_department,
                                        color: Color(0xFFFF640D),
                                        size: 40,
                                      ),
                                      offIcon: Icon(
                                        Icons.local_fire_department_outlined,
                                        color: Color(0xFFFF640D),
                                        size: 40,
                                      ),
                                    ),
                                    if ((pageViewPostsRecord.parentReference) ==
                                        (currentUserReference))
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.delete,
                                          color: Color(0xFFFF0000),
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Confirm to delete'),
                                                        content: Text(
                                                            'Are you sure you want to delete this post?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            await widget.postRef.delete();
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
