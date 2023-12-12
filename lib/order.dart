import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'dart:async';

Future<List<List<dynamic>>> loadCsvData() async {
  final csvData = await rootBundle.loadString('assets/menu.csv');
  List<List<dynamic>> menu = const CsvToListConverter().convert(csvData);
  return menu;
}

class Order extends StatefulWidget {
  const Order({super.key, required this.title});
  final String title;

  @override
  State<Order> createState() => _OrderPageState();
}

class _OrderPageState extends State<Order> {
  List<List<dynamic>> menu = [];

  @override
  void initState() {
    super.initState();
    loadCsvData().then((loadedMenu) {
      setState(() {
        menu = loadedMenu;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("オーダー")),
      body: (menu.isEmpty)
          //読み込むまでまつ
          ? const CircularProgressIndicator()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.blue),
                      children: <TextSpan>[
                        TextSpan(
                            text: '本日のメニュー',
                            style: TextStyle(
                                fontSize: 25,
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
                  const Spacer(),
                  //ボタン
                  SizedBox(
                    width: 325,
                    height: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 16,
                      ),
                      onPressed: () {},
                      child: Text(
                          '${menu[1][0]}\n金額:${menu[1][1]}\n残り${menu[1][3]}'),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 325,
                    height: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 16,
                      ),
                      onPressed: () {},
                      child: Text(
                          '${menu[2][0]}\n金額:${menu[2][1]}\n残り${menu[2][3]}'),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 325,
                    height: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 16,
                      ),
                      onPressed: () {},
                      child: Text(
                          '${menu[3][0]}\n金額:${menu[3][1]}\n残り${menu[3][3]}'),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
    );
  }
}
