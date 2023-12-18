import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autocid/screens/start_page.dart';
import 'package:autocid/screens/home_page.dart';
import 'package:autocid/screens/login_page.dart';
import 'package:autocid/screens/stream_page.dart';
import 'package:autocid/screens/price_page.dart';
import 'package:autocid/screens/payment_page.dart';
import 'package:flutter/services.dart';
import 'package:autocid/dynamic_provider.dart';

void main() {
  runApp(const Autocid());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class Autocid extends StatelessWidget {
  const Autocid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DynamicContentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: StartPage.page,
        routes: {
          StreamDisplay.page: (context) => const StreamDisplay(),
          StartPage.page: (context) => const StartPage(),
          HomePage.page: (context) => const HomePage(),
          LoginPage.page: (context) => const LoginPage(),
          PaymentPage.page: (context) => const PaymentPage(),
          PricePage.page: (context) => const PricePage(),
        },
      ),
    );
  }
}
