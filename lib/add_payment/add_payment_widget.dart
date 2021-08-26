import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPaymentWidget extends StatefulWidget {
  AddPaymentWidget({Key key}) : super(key: key);

  @override
  _AddPaymentWidgetState createState() => _AddPaymentWidgetState();
}

class _AddPaymentWidgetState extends State<AddPaymentWidget> {
  TextEditingController textController;
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
      backgroundColor: Color(0xFF4B39EF),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF4B39EF),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  'Add to wallet',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFFFFFDFD),
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Amount in INR',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFADA4A4),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(2),
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFADA4A4),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(2),
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF8F4F4),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Pay now',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0xFF0C0F14),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFF5C5C5C),
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
