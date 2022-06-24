import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            autoPlay: false,
            looping: true,
            showControls: false,
            allowFullScreen: false,
            allowPlaybackSpeedMenu: false,
            lazyLoad: true,
          ),
        if ((widget.postRef.postType) == 'img')
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: CachedNetworkImage(
              imageUrl: widget.postRef.postImgUrl,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
