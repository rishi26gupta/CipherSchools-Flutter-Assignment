import 'package:cipherx/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpOrIncomScreen extends StatefulWidget {
  
  bool isIncomeScreen ;
  
  ExpOrIncomScreen({super.key,required this.isIncomeScreen});

  @override
  State<ExpOrIncomScreen> createState() => _ExpOrIncomScreenState(isIncomeScreen:  isIncomeScreen);
}

var Category = TextEditingController();
var Description = TextEditingController();
var Money = TextEditingController();


var ExpenseMoney = 0;

class _ExpOrIncomScreenState extends State<ExpOrIncomScreen> {
 
  // bool isIncomeScreen ;
  bool isIncomeScreen ;
  
  _ExpOrIncomScreenState({required this.isIncomeScreen});
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isIncomeScreen ? 'Income': 'Expense', style: TextStyle(color: fontcolor1 )),
        centerTitle: true,
        backgroundColor:isIncomeScreen ? figmacolor : Expensecolor1,
        elevation: 0,
        ),

        body: Container(

          width: double.infinity,
          height:double.infinity,
          color: isIncomeScreen ? figmacolor : Expensecolor1,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('How much ?',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Expensecolor2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400))),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('₹',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color: Expensecolor2,
                                            fontSize: 64,
                                            fontWeight: FontWeight.w600))),
                  ),

                  Text("$ExpenseMoney", style:GoogleFonts.inter(
                  
                   textStyle: TextStyle(color: Expensecolor2, fontSize:64,fontWeight: FontWeight.w600))),
                ],
              ),
              SizedBox(
                height:20, 
              ),


            Container(
              height:380,
              width:420,
              decoration: BoxDecoration(
                color: fontcolor1,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                 
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal:20.0),
                child: TextFormField(
                  controller: Category,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      hintText: 'Category',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Basecolor1),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal:20.0),
                child: TextFormField(
                  controller: Description,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                     
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Basecolor1),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal:20.0),
                child: TextFormField(
                  controller: Money,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      hintText: 'Money',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Basecolor1),
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              ],
            )
            ),
            SizedBox(height:2),
            Container(
              height:90,
              width:420,
              decoration: BoxDecoration(
                color: fontcolor1,
                
                 
            ),

            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: isIncomeScreen ? figmacolor : Expensecolor1,
                  child: Text('Continue',
                      style: TextStyle(color: fontcolor1, fontSize: 20)),
                ),
              ),
            ),

            
          ],)
          
          
        )
    );
  }
}