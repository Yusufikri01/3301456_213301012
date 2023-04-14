import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hedefim/Widget/S%C4%B1navSureContainer.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Gecis_2 extends StatefulWidget {
  const Gecis_2({Key? key}) : super(key: key);

  @override
  State<Gecis_2> createState() => _Gecis_2State();
}

class _Gecis_2State extends State<Gecis_2> {
  String? secilenText;
  Timer? timer;
  double _percent = 1.0;
  int _secondsRemaining = 0; //int _secondsRemaining = 9900;
  bool _started = false;

  void Start() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_secondsRemaining == 0) {
          timer?.cancel();
        } else {
          _secondsRemaining--;
          _percent = _secondsRemaining / (secilenText == "TYT" ? 9900 : 10800);
        }
      });
    });
    _started = true;
  }

  void Pause() {
    timer?.cancel();
    _started = false;
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  //(_stared) ? stop() : start();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DENEME ZAMANI"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Pause();
                          secilenText = "TYT";
                          _secondsRemaining = 9900;
                        });
                      },
                      child: SinavSureContainer("TYT"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Pause();
                          secilenText = "AYT";
                          _secondsRemaining = 10800;
                        });
                      },
                      child: SinavSureContainer("AYT"),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                (_started) ? Pause() : Start();
              },
              child: Container(
                child: CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 10.0,
                  animation: false,
                  percent: _percent,
                  center: Text(
                    _formatTime(_secondsRemaining),
                    style: TextStyle(color: Colors.black, fontSize: 53),
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("BAŞLAMAK İÇİN TIKLA"),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromARGB(255, 205, 186, 150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
