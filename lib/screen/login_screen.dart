import 'package:cipherx/helper/global.dart';
import 'package:cipherx/screen/forgetscreen.dart';
import 'package:cipherx/screen/home_screen.dart';
import 'package:cipherx/screen/signup_screen.dart';
import 'package:cipherx/services/auth.dart';
import 'package:cipherx/styles/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}
 String email = "", password = "";
  
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

   final _formkey = GlobalKey<FormState>();

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In ',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: titlefontcolor1)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key:_formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: mq.height*.01, horizontal:  mq.width*.05),
                  child: TextFormField(
                    validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            }
                            return null;
                          },
            
                    controller: mailcontroller,
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Basecolor1),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: mq.height*.01, horizontal:  mq.width*.05),
                  child: TextFormField(
                     validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                    controller: passwordcontroller,
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Basecolor1),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap:(){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                    },
                    child: Text('Forget Password ?',
                        style: TextStyle(
                            color: figmacolor,
                            fontSize: 19,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:mq.height*.015, bottom:mq.height*.01 ),
                  child: Container(
                    width: mq.width*.90,
                    height:mq.height*.075,
                    child: FloatingActionButton(
                      onPressed: () {
                       if(_formkey.currentState!.validate()){
                            setState(() {
                              email= mailcontroller.text;
                              password=passwordcontroller.text;
                            });
                          }
                          userLogin();
            
                      },
                      backgroundColor: figmacolor,
                      child: Text('Log In',
                          style: TextStyle(color: fontcolor1, fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text('Or with',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w700)),
                ),
                InkWell(
                  onTap: (){
                                AuthMethods().signInWithGoogle(context);
                              },
                  child: Container(
                     width: mq.width*.90,
                    height:mq.height*.075,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                  
                          Padding(
                            padding: const EdgeInsets.only(right:15.0),
                            child: Image.asset('assets/images/googleicon.png'),
                          ),
                          Text('Log In with Google',
                              style: TextStyle(
                                  color: textfontcolor1,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600)),
                                  
                                  
                        ],
                                  
                      )),
                ),
            
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                
                                Text( "Don't have an account? Just",
                                style: TextStyle(
                                    color: Basecolor1,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                      
                                InkWell(
                                  onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
                                  },
                                  child: Text(' Signup',
                                  style: TextStyle(
                                      color: figmacolor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                                ),
                          ],
                        ),
                    ),
              ],
            ),
          )),
    );
  }

    userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Contcolor2,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }
}
