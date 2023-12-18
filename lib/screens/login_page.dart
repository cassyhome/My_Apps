import 'package:autocid/screens/price_page.dart';
import 'package:flutter/material.dart';
import 'package:autocid/components/reusable_widgets.dart';
import 'package:autocid/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  static const page = '/login';

  const LoginPage({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Hero(
                tag: 'cargo',
                child: Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Image.asset(
                    'assets/carpin.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.drag_handle_outlined,
                              size: 30, color: Colors.grey),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'LogIn',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0daa53),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 50,
                          child: Divider(
                            color: Color(0xFF0ec35e),
                            height: 8,
                            thickness: 5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(label: 'Username'),
                              SizedBox(height: 15),
                              CustomTextField(label: 'Password'),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Remeber Me',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff586d62),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff586d62),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                                text: 'Login',
                                width: 150,
                                maxHeight: 50,
                                color: Color(0xFF0b984a),
                                textColor: Colors.white,
                                function: () {
                                  Navigator.pushNamed(context, HomePage.page);
                                }),
                            SizedBox(width: 20),
                            CustomButton(
                                text: 'SignUp',
                                width: 150,
                                maxHeight: 50,
                                color: Color(0xFF0b984a),
                                textColor: Colors.white,
                                function: () {})
                          ],
                        ),
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            print('oh');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.qr_code, size: 35),
                              Text('Use QR Scanner',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff586d62),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
