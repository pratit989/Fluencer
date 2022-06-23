import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDisplayWidget extends StatefulWidget {
  const PostDisplayWidget({Key key}) : super(key: key);

  @override
  _PostDisplayWidgetState createState() => _PostDisplayWidgetState();
}

class _PostDisplayWidgetState extends State<PostDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: FlutterFlowVideoPlayer(
            path:
                'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
            videoType: VideoType.network,
            autoPlay: false,
            looping: true,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: false,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Image.network(
            'https://picsum.photos/seed/756/600',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
