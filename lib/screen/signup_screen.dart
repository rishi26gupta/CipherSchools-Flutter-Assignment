import 'package:cipherx/helper/global.dart';
import 'package:cipherx/screen/home_screen.dart';
import 'package:cipherx/screen/login_screen.dart';
import 'package:cipherx/services/auth.dart';
import 'package:cipherx/styles/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

// GlobalKey<ScaffoldMessengerState> _scaffoldKey =
//     GlobalKey<ScaffoldMessengerState>();
String email = "", password = "", name = "";
TextEditingController namecontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();
TextEditingController mailcontroller = new TextEditingController();

final _formkey = GlobalKey<FormState>();


class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: titlefontcolor1)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding:  EdgeInsets.symmetric(
                      vertical: mq.height*.015, horizontal:  mq.width*.05),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter Name';
                      }
                      return null;
                    },
                    controller: namecontroller,
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Basecolor1),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: mq.height*.015, horizontal:  mq.width*.05),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter Email';
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
                      vertical: mq.height*.015, horizontal:  mq.width*.05),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter Password';
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
                  padding:  EdgeInsets.all(mq.width*.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/checkboxblank.png'),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'By signing up, you agree to the',
                              style: TextStyle(
                                  color: textfontcolor1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: ' Terms of \n Service and Privacy Policy',
                              style: TextStyle(
                                  color: figmacolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )),
                    ],
                  ),
                ),
                Padding(
                    padding:  EdgeInsets.symmetric(
                      vertical: mq.height*.01, horizontal:  mq.width*.05),
                  child: Container(
                    width: mq.width*.95,
                    height:mq.height*.075,
                    child: FloatingActionButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            email=mailcontroller.text;
                            name= namecontroller.text;
                            password=passwordcontroller.text;
                          });
                        }
                        registration();
                      },
                      backgroundColor: figmacolor,
                      child: Text('Sign up',
                          style: TextStyle(color: fontcolor1, fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Image.asset('assets/images/googleicon.png'),
                          ),
                          Text('Sign up with Google',
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
                      Text('Already have an account?',
                          style: TextStyle(
                              color: Basecolor1,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: Text(' Login',
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
  registration() async {
   print("Error *******************************");
    if (password !=  " " && namecontroller.text!=" " && mailcontroller.text!=" ") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: figmacolor,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

}

//   registration() async {
//   if (password != null &&
//       namecontroller.text != "" &&
//       mailcontroller.text != "") {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       _scaffoldKey.currentState?.showSnackBar(
//         SnackBar(
//           content: Text(
//             "Registered Successfully",
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//       );
//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(
//     builder: (context) {
//       return HomeScreen();
//     },
//   ),
// );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         _scaffoldKey.currentState?.showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Password Provided is too Weak",
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         );
//       } else if (e.code == "email-already-in-use") {
//         _scaffoldKey.currentState?.showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Account Already exists",
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         );
//       }
//     }
//   }
// }
