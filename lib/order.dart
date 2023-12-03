import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("オーダー")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 3),
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.blue),
                children: <TextSpan>[
                  TextSpan(
                      text: '本日のメニュー',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(47, 90, 83, 83),
                            )
                          ])),
                ],
              ),
            ),
            const Spacer(flex: 2),
            //ボタン
            SizedBox(
              width: 175,
              height: 75,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 16,
                ),
                onPressed: () {},
                child: const Text('メインページ'),
              ),
            ),
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
                onPressed: () {},
                child: const Text('メインページ'),
              ),
            ),
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
                onPressed: () {},
                child: const Text('メインページ'),
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
