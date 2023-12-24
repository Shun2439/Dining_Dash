// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin extends StatelessWidget {
  const GoogleSignin({super.key});

  // ↓ここから公式の処理を丸パクリ
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Firebase.initializeApp();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // ↑ここまで公式の処理を丸パクリ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Googleログイン')),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              // サインイン画面を表示する
              signInWithGoogle();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Start()));
            },
            child: const Text('Google'),
          )
        ]),
      ),
    );
  }
}
