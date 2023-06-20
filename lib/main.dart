import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/Giris_Ekrani.dart';
import 'package:hedefim/Service/Provider.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  BenimUygulamam({Key? key}) : super(key: key);
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prefs,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(
                darkThemeOn: snapshot.data!.getBool("darkTheme") ?? false,
              ),
            ),
          ],
          child: Builder(builder: (BuildContext context) {
            var themechange = Provider.of<ThemeProvider>(context);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themechange.getTheme(),
                home: BenimUygulamam_2());
          }),
        );
      },
    );
  }
}

class BenimUygulamam_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                    child: Text(
                  "HEP BERABER BU MACERAYA BAŞLAYALIM MI ?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
              ),
            ),
            SizedBox(
                width: 250,
                height: 230,
                child: Lottie.network(
                    "https://assets6.lottiefiles.com/private_files/lf30_TBKozE.json")),
            EleButtonPro(
              Text("MACERAYA BAŞLA"),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Giris_Ekrani())),
            ),
          ],
        ),
      ),
    );
  }
}
