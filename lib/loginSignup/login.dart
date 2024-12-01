import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pill_mate/loginSignup/component/button.dart';
import 'package:pill_mate/loginSignup/component/textfield.dart';
import 'package:pill_mate/onboarding/onboarding_view.dart';

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
                        onPressed: (){
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
