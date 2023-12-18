import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autocid/dynamic_provider.dart';
import 'package:autocid/components/constants.dart';
import 'package:autocid/components/reusable_widgets.dart';

class TransactionsList extends StatefulWidget {
  static const page = '/transaction';

  const TransactionsList({Key? key, this.watt}) : super(key: key);
  final String? watt;
  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Recent Transaction History',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView(
                    children: [
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ' Previous Transaction History',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView(
                    children: [
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
