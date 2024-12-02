/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pill_mate/loginSignup/auth/service.dart';
import 'package:pill_mate/loginSignup/component/button.dart';
import 'package:pill_mate/loginSignup/component/textfield.dart';
import 'package:pill_mate/onboarding/onboarding_view.dart';
import 'package:pill_mate/reminder/homme.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController= TextEditingController();

  final TextEditingController _passwordController= TextEditingController();

  final AuthServices _services =AuthServices();
  
  void login(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 10,
                  left: 230,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      shape: BoxShape.circle,
                    ),
                  ),
              ),
              Positioned(
                top: 10,
                left: 270,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                right: 280,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 320,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Login',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text(
                        'Please sign in to continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      MyTextField(
                        hintText: 'EMAIL',
                        icon:const Icon(Icons.mail_outline),
                        controller: _emailController,
                        obsecureText: false,
                      ),
                      const SizedBox(height: 10,),
                      MyTextField(
                        hintText: 'PASSWORD',
                        icon:const Icon(Icons.lock_outline),
                        controller: _passwordController,
                        obsecureText: true,
                      ),
                      const SizedBox(height: 25,),
                      Button(
                        text: 'LOGIN',
                        onPressed: () async{
                          await _services.signIn(_emailController.text, _passwordController.text, context,);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a member? ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          GestureDetector(
                            onTap: widget.onTap,

                            child: Text(
                              'Register now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],

      )),
    );
  }

}
*/

import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pill_mate/Navbar.dart';
import 'package:pill_mate/loginSignup/auth/service.dart';
import 'package:pill_mate/loginSignup/register.dart';

class LoginPage extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/signup.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 110.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 250.0,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[400],
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('Your PillMate is Ready. Sign In to Continue.', speed: Duration(milliseconds: 200)),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(top:16,left: 16.0, right: 16, bottom: 16),
                      child: TextField(

                        controller: _passController,
                        style: TextStyle(color: Colors.black87),
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white60),

                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(

                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[200]
                        ),
                        onPressed: () async {
                          User? user = await _auth.signInWithEmailAndPassword(
                            _emailController.text,
                            _passController.text,
                          );

                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => NavbarPage()),
                            );
                          }
                        },
                        child: Text(

                          'Log In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'New to PillMate? ',
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text("Sign Up Today!", style: TextStyle(color: Colors.green[300], fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}