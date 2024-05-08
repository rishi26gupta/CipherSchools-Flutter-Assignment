import 'package:cipherx/screen/Exp/incom.dart';
import 'package:cipherx/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var month = "May";
var TotalMoney = 70000;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
              width: 410,
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFF6E6),
                    Color.fromARGB(255, 241, 239, 235)
                  ],
                  begin: FractionalOffset(0.1, 0.1),
                  end: FractionalOffset(0.0, 1.0),
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 80),
                        child: CircleAvatar(
                          radius: 28,
                          child: Image.asset('assets/images/profile.png'),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Icon(Icons.keyboard_arrow_down)),
                          Text("$month",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: textfontcolor1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 80.0,
                          right: 8.0,
                        ),
                        child: Image.asset('assets/images/notifiaction.png',
                            height: 55),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Account Balance',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Basecolor1,
                              fontSize: 20,
                              fontWeight: FontWeight.w400))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('₹',
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: titlefontcolor1,
                                    fontSize: 45,
                                    fontWeight: FontWeight.w600))),
                      ),
                      Text("$TotalMoney",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: titlefontcolor1,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w600))),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExpOrIncomScreen(
                                        isIncomeScreen: false,
                                      )));
                        },
                        child: Container(
                            width: 170,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Contcolor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                        'assets/images/income.png')),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Income',
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('₹',
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        Text("$TotalMoney",
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExpOrIncomScreen(isIncomeScreen: true)));
                        },
                        child: Container(
                            width: 170,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Contcolor2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                        'assets/images/expense.png')),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Expenses',
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('₹',
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        Text("$TotalMoney",
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Today',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w600))),
                Text('Week',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w600))),
                Text('Month',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w600))),
                Text('Year',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w600))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600))),
                Container(
                  width: 78,
                  height: 32,
                  decoration: BoxDecoration(
                      color: homcolor1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      )),
                  child: Center(
                    child: Text('See all',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: figmacolor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
