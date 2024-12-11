import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Giriş (Login)
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        print("Kullanıcı giriş yaptı: ${user.email}");
      }
      return user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e); // Hata yönetimi
      return null;
    } catch (e) {
      print("Bilinmeyen bir hata oluştu: ${e.toString()}");
      return null;
    }
  }

  // Kayıt (Register)
  Future<User?> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      // Firebase Authentication'da kullanıcı oluştur
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        // Firestore'a kullanıcıyı ekle
        await _firestore.collection('user').doc(user.uid).set({
          'name': name,
          'email': email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });

        print("Kullanıcı başarıyla kaydedildi: ${user.email}");
        Fluttertoast.showToast(
          msg: "Kayıt başarılı!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e); // Hata yönetimi
      return null;
    } catch (e) {
      print("Bilinmeyen bir hata oluştu: ${e.toString()}");
      Fluttertoast.showToast(
        msg: "Kayıt Başarılı!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      return null;
    }
  }

  // Çıkış (Sign Out)
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("Kullanıcı çıkış yaptı.");
    } catch (e) {
      print("Çıkış işlemi sırasında bir hata oluştu: ${e.toString()}");
    }
  }

  // Şifre Sıfırlama
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: "Şifre sıfırlama e-postası gönderildi!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      print("Şifre sıfırlama sırasında bir hata oluştu: ${e.toString()}");
      Fluttertoast.showToast(
        msg: "Şifre sıfırlama işlemi başarısız!",
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }

  // Hata Yönetimi
  void _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        Fluttertoast.showToast(
          msg: "Bu e-posta adresi zaten kullanımda.",
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
        break;
      case 'user-not-found':
        Fluttertoast.showToast(
          msg: "Bu e-posta ile kayıtlı bir kullanıcı bulunamadı.",
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
        break;
      case 'wrong-password':
        Fluttertoast.showToast(
          msg: "Hatalı şifre girdiniz.",
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
        break;
      case 'weak-password':
        Fluttertoast.showToast(
          msg: "Şifre çok zayıf. Daha güçlü bir şifre girin.",
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
        break;
      default:
        Fluttertoast.showToast(
          msg: "Bir hata oluştu: ${e.message}",
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
        break;
    }
    print("FirebaseAuthException: ${e.message}");
  }
}
