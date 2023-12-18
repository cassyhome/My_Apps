import 'package:autocid/dynamic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autocid/components/constants.dart';
import 'package:autocid/screens/start_page.dart';
import 'package:autocid/screens/login_page.dart';
import 'package:autocid/screens/price_page.dart';
import 'package:autocid/screens/payment_page.dart';

class PricePage extends StatefulWidget {
  static const page = '/price';

  const PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pay the price',
                    style: kLargeTextStyle,
                  ),
                  Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    const PriceCard(watt: '26W', minutes: 20),
                    const PriceCard(watt: '45W', minutes: 30),
                    const PriceCard(watt: '60W', minutes: 55),
                    const PriceCard(watt: '110W', minutes: 120),
                    const PriceCard(watt: '165W', minutes: 145),
                    const PriceCard(watt: '210W', minutes: 165),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.watt, required this.minutes});
  final String watt;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<DynamicContentProvider>(context, listen: false)
            .togglePreviousContent();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentPage(watt: watt),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: const BoxConstraints(
          minHeight: 180,
        ),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white24,
                Colors.transparent,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      watt,
                      style: const TextStyle(
                          fontSize: 35,
                          fontFamily: 'oswald',
                          color: Color(0xFF0daa53),
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Proceed Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0daa53),
                      ),
                    ),
                    const Text(
                      'Will be reacharged ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0daa53),
                      ),
                    ),
                    Text(
                      'In the Next $minutes minutes',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0daa53),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    height: 150, child: Image.asset('assets/carpin.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
