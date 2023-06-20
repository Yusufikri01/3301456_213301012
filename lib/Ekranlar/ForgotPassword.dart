import 'package:flutter/material.dart';
import 'package:hedefim/Service/LoginFunction.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/TextFieldFor.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final tfResetPasswordEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 50, right: 15, left: 15),
              child: Text(
                "ENTER YOUR E-MAIL TO RESET PASSWORD",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFieldFor(text: "E-mail",icon: Icons.person,textEditingController: tfResetPasswordEmail,see: false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EleButtonPro(
                      Text("BACK"),
                      () {
                        Navigator.pop(context);
                      },
                    ),
                    EleButtonPro(
                      Text("SEND"),
                      () {
                        ResetPassword(tfResetPasswordEmail, context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
