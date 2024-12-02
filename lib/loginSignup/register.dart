/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pill_mate/loginSignup/auth/login_or_register.dart';
import 'package:pill_mate/loginSignup/auth/service.dart';
import 'package:pill_mate/loginSignup/component/button.dart';
import 'package:pill_mate/loginSignup/component/textfield.dart';
import 'package:pill_mate/loginSignup/login.dart';
import 'package:pill_mate/onboarding/onboarding_view.dart';
import 'package:pill_mate/reminder/homme.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({
    super.key,
    this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _emailController= TextEditingController();

  final TextEditingController _passwordController= TextEditingController();

  final TextEditingController _userNameController= TextEditingController();

  final AuthServices _services = AuthServices();
  
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
                        'CREAT ACCOUNT',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      MyTextField(
                        hintText: 'NAME SURNAME',
                        icon:const Icon(Icons.person_outline),
                        controller: _userNameController,
                        obsecureText: false,
                      ),
                      const SizedBox(height: 10,),
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
                        text: 'REGISTER',
                        onPressed: () async {
                          try {
                            await _services.signUp(
                              _userNameController.text,
                              _emailController.text,
                              _passwordController.text,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginOrRegister()),
                            );
                          } catch (e) {
                            print("Kayıt sırasında hata: $e");
                          }

                          _userNameController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                        },
                      ),

                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account? ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Login now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[400],
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


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pill_mate/Navbar.dart';
import 'package:pill_mate/loginSignup/auth/service.dart';
import 'package:pill_mate/loginSignup/login.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthServices _auth = AuthServices();
  final TextEditingController _nameController = TextEditingController();
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
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 250.0,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('Existing Member? Log In to Get Started!', speed: Duration(milliseconds: 200)),
                            ],
                            isRepeatingAnimation: false,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _nameController,
                        style: TextStyle(color: Colors.black),
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
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
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
                      SizedBox(height: 16),
                      TextField(

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
                      SizedBox(height: 16),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[200]
                          ),
                          onPressed: () async {
                            User? user = await _auth.registerWithEmailAndPassword(
                              _nameController.text,
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

                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Access Your Account',
                        style: TextStyle(color: Colors.grey[800], fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text("Log In Now!", style: TextStyle(color: Colors.green[300], fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}