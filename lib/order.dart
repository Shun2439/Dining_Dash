import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<List<dynamic>>> loadCsvData() async {
  final csvData = await rootBundle.loadString('assets/menu.csv');
  List<List<dynamic>> menu = const CsvToListConverter().convert(csvData);
  return menu;
}

void getData() async {
  var response = await http.get('http://localhost:5432/data' as Uri);
  if (response.statusCode == 200) {
    print('Data: ${response.body}');
  } else {
    print('Failed to load data');
  }
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
    getData();
    loadCsvData().then((loadedMenu) {
      setState(() {
        menu = loadedMenu;
      });
    });
  }

  @override //TODO クラスを切り分ける
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
                  _MenuButton(menu[1][0], menu[1][1], menu[1][3]),
                  const Spacer(),
                  _MenuButton(menu[2][0], menu[2][1], menu[2][3]),
                  const Spacer(),
                  _MenuButton(menu[3][0], menu[3][1], menu[3][3]),
                  const Spacer(),
                ],
              ),
            ),
    );
  }
}

// ignore: must_be_immutable
class _MenuButton extends StatelessWidget {
  _MenuButton(this.menu, this.value, this.stock);
  String menu;
  int value;
  int stock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      height: 125,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          elevation: 16,
        ),
        onPressed: () {},
        child: Text('$menu\n金額:$value\n残り$stock'),
      ),
    );
  }
}

/*
うどん
そば
カレー
カツカレー
丼物
らンチ
各種大盛り
デザート
ライス
からあげ
ポテト
*/