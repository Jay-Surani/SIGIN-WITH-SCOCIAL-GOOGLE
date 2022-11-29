

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class singin extends StatefulWidget {
  const singin({Key? key}) : super(key: key);

  @override
  State<singin> createState() => _singinState();
}

class _singinState extends State<singin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: Text(
            "Sing In Methods",
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      //JAVA JDK 18 DOWNLOAD KARVI JDK 19 SUPPORT NAHI KARE
                      //ANE ANDROID FOLDER MA GRADLEW MA RIGHT CLICK KARI NE ONEN IN TERMINAL MA NICHE NA COMMAND MARVA
                      // SHA KEY GENRATE KARVI ./gradlew signingReport or gradlew signingReport
                      // ANE NICHE MATHI AA METHOD CALL KARVI BATHU AAYA LAKHVU NAHI
                      signInWithGoogle();

                    },
                    child: Image.asset(
                      "assets/google.png",
                      height: 100,
                    )),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/facebook.jpg",
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
