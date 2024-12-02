import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(child: Text("Hoş geldin ${auth.currentUser!.email}", style: TextStyle(color: Colors.black,fontSize: 40),)),
    );
  }
}
