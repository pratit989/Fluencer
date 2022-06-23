import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadSelectionWidget extends StatefulWidget {
  const UploadSelectionWidget({Key key}) : super(key: key);

  @override
  _UploadSelectionWidgetState createState() => _UploadSelectionWidgetState();
}

class _UploadSelectionWidgetState extends State<UploadSelectionWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: InkWell(
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                  allowVideo: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  final downloadUrls = (await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes))))
                      .where((u) => u != null)
                      .toList();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrls != null &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() => uploadedFileUrl1 = downloadUrls.first);
                    showUploadMessage(
                      context,
                      'Success!',
                    );
                  } else {
                    showUploadMessage(
                      context,
                      'Failed to upload media',
                    );
                    return;
                  }
                }
              },
              child: ListTile(
                title: Text(
                  'Upload a new Video',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF640D),
                  size: 20,
                ),
                dense: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: InkWell(
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  textColor: FlutterFlowTheme.of(context).primaryBtnText,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  final downloadUrls = (await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes))))
                      .where((u) => u != null)
                      .toList();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrls != null &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() => uploadedFileUrl2 = downloadUrls.first);
                    showUploadMessage(
                      context,
                      'Success!',
                    );
                  } else {
                    showUploadMessage(
                      context,
                      'Failed to upload media',
                    );
                    return;
                  }
                }
              },
              child: ListTile(
                title: Text(
                  'Upload a new Photo',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF640D),
                  size: 20,
                ),
                dense: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
