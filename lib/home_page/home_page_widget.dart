import '../auth/auth_util.dart';
import '../components/bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:mapbox_search/mapbox_search.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Iasi City Involve',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPageWidget(),
                  ),
                  (r) => false,
                );
              },
              child: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Stack(
                children: [
                  FlutterFlowStaticMap(
                    location: LatLng(47.1585, 27.6014),
                    apiKey:
                        'sk.eyJ1IjoidGNoaXJpbGVhbnUiLCJhIjoiY2txY25jODVkMHlnazJvb3Z2amd4dWR6dSJ9.eZn7nPAFsyvSJCWhlZwPFQ',
                    style: MapBoxStyle.Light,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(0),
                    cached: true,
                    zoom: 13,
                    tilt: 0,
                    rotation: 0,
                  ),
                  Align(
                    alignment: Alignment(0.05, 0.67),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BottomSheetWidget();
                            });
                      },
                      text: 'Button',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
