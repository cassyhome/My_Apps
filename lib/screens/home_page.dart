import 'package:flutter/material.dart';
import 'package:autocid/screens/stream_page.dart';
import 'package:autocid/screens/start_page.dart';
import 'package:autocid/screens/transaction_page.dart';
import 'package:autocid/screens/price_page.dart';
import 'package:autocid/screens/payment_page.dart';

class HomePage extends StatefulWidget {
  static const page = '/start';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PaymentPage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor: Color(0xFF88e1ae),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black, size: 30),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, color: Colors.black, size: 30),
                label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.map, color: Colors.black, size: 30),
                label: 'Map'),
          ],
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0b984a),
                Color(0xFF0daa53),
                Color(0xFF0ec35e),
                Color(0xFF10c662),
                Color(0xFF88e1ae),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: routeThroughPages(_selectedIndex),
        ));
  }
}

Widget routeThroughPages(int value) {
  Widget? widget;

  switch (value) {
    case 0:
      widget = PricePage();
      break;
    case 1:
      widget = TransactionsList();
      break;
    case 2:
      widget = StreamDisplay();
      break;
  }
  return widget!;
}
