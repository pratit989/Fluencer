import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'About Fluncer',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xCDFFFFFF),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Here’s how it works:',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at aliquet sapien. Morbi in mollis nunc, vitae placerat purus. Pellentesque vitae dolor ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean ultricies, libero quis porttitor aliquam, velit risus pellentesque risus, vel hendrerit lectus turpis sed eros. Integer massa sem, sollicitudin quis rhoncus sit amet, consectetur in arcu. Mauris at mattis nulla, eu bibendum diam. Integer vel tortor accumsan, auctor velit in, dapibus mi. Al',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xCDFFFFFF),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
