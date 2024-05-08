import 'dart:async';

import 'package:cipherx/helper/global.dart';
import 'package:cipherx/screen/onboard_screen.dart';
import 'package:cipherx/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    Timer(Duration(seconds: 3), () {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoardScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    // Intialize an size of app
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: figmacolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/upper2.png',
                      ),
                      Positioned(
                          right: 0,
                          child: Image.asset(
                            'assets/images/upper1.png',
                          )),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/images/logo.png',
                width: 98.68,
                height: 98.68,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: 'C',
                      style: GoogleFonts.brunoAceSc(
                          textStyle: TextStyle(
                              color: fontcolor1,
                              fontWeight: FontWeight.w400,
                              fontSize: 40))),
                  TextSpan(
                      text: 'IPHER',
                      style: GoogleFonts.brunoAceSc(
                          textStyle: TextStyle(
                              color: fontcolor1,
                              fontWeight: FontWeight.w400,
                              fontSize: 30))),
                  TextSpan(
                      text: 'X',
                      style: GoogleFonts.brunoAceSc(
                          textStyle: TextStyle(
                              color: fontcolor1,
                              fontWeight: FontWeight.w400,
                              fontSize: 40))),
                ],
              )),
              
              Spacer(),
              Stack(
                children: [
                  Positioned(
                    left: 100,
                    top: 45,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('By',
                              style: GoogleFonts.cambay(
                                  textStyle: TextStyle(
                                      color: lowerfontcolor1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Open Source',
                                  style: GoogleFonts.cambay(
                                      textStyle: TextStyle(
                                          color: lowerfontcolor1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400))),
                              Text(' Community',
                                  style: GoogleFonts.cambay(
                                      textStyle: TextStyle(
                                          color: lowerfontcolor2,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                        ]),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/lower2.png',
                            ),
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/lower1.png',
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
