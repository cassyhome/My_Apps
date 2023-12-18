import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.width,
      required this.maxHeight,
      required this.color,
      this.textColor = Colors.black,
      this.function});
  final Color color;
  final Color textColor;
  final String text;
  final int width;
  final int maxHeight;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      color: color,
      child: MaterialButton(
        minWidth: width.toDouble(),
        height: maxHeight.toDouble(),
        onPressed: function!,
        child: Text(text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      label: Text(label),
      labelStyle: TextStyle(color: Color(0xff057236), fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF0ec35e), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF10c662), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF10c662), width: 1),
      ),
    ));
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 50,
                  color: Colors.grey.shade200,
                  child: Image.asset('assets/carpin.png'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10W Paid Process',
                    style: TextStyle(fontSize: 20, fontFamily: 'oswald')),
                Text('Dec 15 2023 | 10:00 AM',
                    style: TextStyle(fontSize: 16, fontFamily: 'oswald'))
              ],
            ),
            SizedBox(width: 60),
            Column(
              children: [
                Text('120 Birr',
                    style: TextStyle(fontSize: 20, fontFamily: 'oswald')),
                Text('Completed',
                    style: TextStyle(fontSize: 16, fontFamily: 'oswald'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
