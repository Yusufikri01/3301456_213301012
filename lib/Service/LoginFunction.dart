import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



  Future<void> SignUp(
      TextEditingController firstname,
      TextEditingController surname,
      TextEditingController email,
      TextEditingController password,
      BuildContext context,
      ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.uid)
            .set({
          "firstname": firstname.text.trim(),
          "surname": surname.text.trim(),
          "email": email.text.trim(),
          "password": password.text.trim(),
        });
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Your password must be at least 6 characters long"),
            );
          },
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("This email address is already in use"),
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User?> SignIn(
      TextEditingController email,
      TextEditingController password,
      BuildContext context,
      ) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      user = userCredential.user;

    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Incorrect Email or Password. Please Try Again"),
            );
          });

      print(e);
    }

    return user;
  }

  Future<void> ResetPassword(
      TextEditingController email, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link send! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("NO USER OR WRONG E-MAIL"),
            );
          });
    }
  }

  Future<String?> DisplayData(String email) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      var data = queryDocumentSnapshot.data();
      if (data['email'] == email) {
        return data['firstname'];
      }
    }
    return null;
  }

Future<void> signOutAndExitApp(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  } catch (e) {
    print("Çıkış yaparken bir hata oluştu: $e");
  }
}



