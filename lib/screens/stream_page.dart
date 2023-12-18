import 'package:flutter/material.dart';
import 'package:autocid/components/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:autocid/components/reusable_widgets.dart';

class StreamDisplay extends StatefulWidget {
  static const page = '/stream';

  const StreamDisplay({Key? key, this.watt}) : super(key: key);
  final String? watt;
  @override
  State<StreamDisplay> createState() => _StreamDisplayState();
}

class _StreamDisplayState extends State<StreamDisplay> {
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
              GaugeSimulator(),
              GaugeSimulator(),
            ],
          ),
        ),
      ),
    );
  }
}

class GaugeSimulator extends StatelessWidget {
  const GaugeSimulator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Expanded(
          child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: 90,
              needleColor: Colors.white,
              enableAnimation: true,
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: const Text('90.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ],
      )),
    );
  }
}
