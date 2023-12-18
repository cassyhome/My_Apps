import 'package:autocid/screens/stream_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autocid/dynamic_provider.dart';
import 'package:autocid/components/constants.dart';
import 'package:autocid/components/reusable_widgets.dart';

class PaymentPage extends StatefulWidget {
  static const page = '/payment';

  const PaymentPage({Key? key, this.watt}) : super(key: key);
  final String? watt;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back, size: 30),
                        onPressed: () {
                          Provider.of<DynamicContentProvider>(context,
                                  listen: false)
                              .togglePreviousContent();
                          Navigator.pop(context);
                        }),
                    SizedBox(width: 10),
                    Text('My E-Wallet ', style: kmidTextStyle),
                  ]),
                  Row(
                    children: [
                      Icon(Icons.search, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.message, size: 30),
                    ],
                  )
                ],
              ),
              DynamicContentBox(watt: widget.watt),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Transaction History',
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

class DynamicContentBox extends StatelessWidget {
  const DynamicContentBox({Key? key, this.watt}) : super(key: key);
  final String? watt;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.all(30),
        constraints: BoxConstraints(
          maxHeight: 250,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Consumer<DynamicContentProvider>(
            builder: (context, provider, child) {
          if (provider.showNewContent == true) {
            return Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified_user, size: 30),
                        Text(
                          'Fill The Form',
                          style: kmidTextStyle,
                        ),
                      ],
                    ),
                    Text(' 125 Birr',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'oswald',
                            fontWeight: FontWeight.bold)),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 110,
                        maxWidth: 165,
                      ),
                      child: Image.asset('assets/carpin.png'),
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          CustomTextField(label: 'Acc Number'),
                          SizedBox(height: 20),
                          CustomTextField(label: 'Telebir'),
                        ],
                      ),
                      CustomButton(
                        text: 'Pay',
                        width: 120,
                        maxHeight: 50,
                        color: Color(0xFF0daa53),
                        textColor: Colors.white,
                        function: () =>
                            Navigator.pushNamed(context, StreamDisplay.page),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Selemawit Merd', style: kmidTextStyle),
                        Text('----- ----- --- ---298', style: kSmallTextStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${watt}',
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'oswald',
                                fontWeight: FontWeight.bold)),
                        Text('Charging Price', style: kSmallTextStyle),
                        Text(' 125 Birr',
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'oswald',
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 120,
                          minWidth: 175,
                        ),
                        child: Image.asset('assets/carpin.png'),
                      ),
                      CustomButton(
                        color: Color(0xFF0daa53),
                        width: 150,
                        maxHeight: 60,
                        function: () => provider.toggleNewContent(),
                        text: 'Make Payment',
                        textColor: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            );
            Provider.of<DynamicContentProvider>(context, listen: false)
                .togglePreviousContent();
          }
        }));
  }
}
