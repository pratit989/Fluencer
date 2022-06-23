import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDisplayWidget extends StatefulWidget {
  const PostDisplayWidget({
    Key key,
    this.postRef,
  }) : super(key: key);

  final PostsRecord postRef;

  @override
  _PostDisplayWidgetState createState() => _PostDisplayWidgetState();
}

class _PostDisplayWidgetState extends State<PostDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if ((widget.postRef.postType) == 'video')
          FlutterFlowVideoPlayer(
            path: widget.postRef.postVideoUrl,
            videoType: VideoType.network,
            autoPlay: true,
            looping: true,
            showControls: false,
            allowFullScreen: false,
            allowPlaybackSpeedMenu: false,
          ),
        if ((widget.postRef.postType) == 'img')
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Image.network(
              widget.postRef.postImgUrl,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
