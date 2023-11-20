import 'package:dining_dash/start.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Order extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //ボタン
            new SizedBox(
              width: 175,
              height: 75,
              child: ElevatedButton(
                child: const Text('メインページ'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  elevation: 16,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Start()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
