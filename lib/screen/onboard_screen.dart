import 'package:cipherx/helper/global.dart';
import 'package:cipherx/screen/signup_screen.dart';
import 'package:cipherx/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: figmacolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only( top: mq.width*0.14, left: mq.width*0.02, right: mq.width*0.26),
                    child: Image.asset(
                                    'assets/images/logo.png',
                                    width: mq.width*.28,
                                    height:mq.width*.28,
                                  ),
                  ),
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
              Padding(
                padding:  EdgeInsets.only(left: mq.width*0.08, bottom: mq.width*0.005),
                child: Text('Welcome to',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        color: fontcolor1,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400))),
              ),

             
              Stack(
                children: [
                  Positioned(
                    left: mq.width*0.72,
                    top: 0,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
                      },
                      child: CircleAvatar(radius: mq.height*0.048,
                      child: Image.asset('assets/images/arrow.png'),
                      ),
                    )),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mq.height*0.01,
                        ),
                      Padding(
                        padding:  EdgeInsets.only(left:mq.width*0.10, bottom:mq.width*0.015 ),
                        child: RichText(
                          
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
                      ),
                        
                  
                        Padding(
                          padding:  EdgeInsets.all(mq.width*.04),
                          child: Text('The best Way to track your Expenses',
                              style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: fontcolor1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400))),
                        ),
                      ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/lower2.png',
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