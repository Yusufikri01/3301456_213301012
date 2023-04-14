import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/S%C4%B1navSureContainer.dart';


class DenemeAnalizi extends StatefulWidget {
  const DenemeAnalizi({Key? key}) : super(key: key);

  @override
  State<DenemeAnalizi> createState() => _DenemeAnaliziState();
}

class _DenemeAnaliziState extends State<DenemeAnalizi> {
  final formKey = GlobalKey<FormState>();
  String girilen = "0";
  String girilen1 = "1";
  final _tfnetleri = TextEditingController();
  final _tfay = TextEditingController();

  _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("DENEMEDEKİ NETİNİZİ GİRİNİZ"),
            content: Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _tfay,
                          decoration: InputDecoration(
                            hintText: "HANGİ AY",
                            border: InputBorder.none,
                          ),
                          onSaved: (value) {
                            if (value != null &&
                                value.isNotEmpty &&
                                double.parse(value) > -1 &&
                                double.parse(value) < 11) {
                              setState(() {
                                girilen1 = value;
                              });
                            }
                          },
                        ),
                        TextFormField(
                          // BURDAKİ TEXTFORMDİELD NET SAYISINI TUTUYOR
                          keyboardType: TextInputType.number,
                          controller: _tfnetleri,
                          decoration: InputDecoration(
                            hintText: "NETİNİZİ GİRİNİZ",
                            border: InputBorder.none,
                          ),
                          onSaved: (value) {
                            if (value != null &&
                                value.isNotEmpty &&
                                double.parse(value) > -1 &&
                                double.parse(value) < 121) {
                              setState(() {
                                girilen = value;
                              });
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: EleButtonPro(
                            Text("KAYDET"),
                            () {
                              formKey.currentState!.save();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("KAYDEDİLEN NET: $girilen"),
                              ));
                            },
                          ),
                        ),
                        EleButtonPro(
                          Text("KAPAT"),
                          () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DENEME ANALİZİ"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: LineChart(
                    LineChartData(
                      minX: 1,
                      maxX: 10,
                      minY: 0,
                      maxY: 120,
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.red,
                            strokeWidth: 1,
                          );
                        },
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        // burda grafige çerçeve özelligi veriyor;
                        show: true,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(
                                double.parse(girilen1), double.parse(girilen)),
                            FlSpot(4, 79),
                            FlSpot(6, 65),
                            FlSpot(10, 120),
                          ],
                          color: Colors.blue,
                          barWidth: 4,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blueGrey, width: 1),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _showDialog,
                          child: SinavSureContainer("TYT"),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _showDialog,
                          child: SinavSureContainer("AYT"),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
