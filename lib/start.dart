import 'package:dining_dash/order.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key, required this.title});
  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('スタート')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //ボタン
            // const Spacer(),
            // SizedBox(
            //   width: 175,
            //   height: 75,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.white,
            //       backgroundColor: Colors.green,
            //       elevation: 16,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const Settings()),
            //       );
            //     },
            //     child: const Text('設定'),
            //   ),
            // ),
            const Spacer(),
            SizedBox(
              width: 175,
              height: 75,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 16,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Order(
                              title: 'オーダー',
                            )),
                  );
                },
                child: const Text('注文'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
