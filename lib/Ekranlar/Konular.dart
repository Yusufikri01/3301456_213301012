import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Konular extends StatefulWidget {
  String ders;
  Konular(this.ders, {Key? key}) : super(key: key);

  @override
  State<Konular> createState() => _KonularState();
}

class _KonularState extends State<Konular> {
  double value = 0;
  int totalItems = 0; // totalItems değişkeni eklendi
  List<bool> isContainerEnabled = [];

  @override
  void initState() {
    super.initState();
    getProgress(widget.ders);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ders),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(widget.ders).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Connection Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var docs = snapshot.data!.docs;

          if (isContainerEnabled.isEmpty) {
            isContainerEnabled = List<bool>.generate(docs.length, (index) => true);
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LinearProgressIndicator(
                  value: value / docs.length,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 25.0,
                  semanticsLabel: 'Loading',
                  semanticsValue: '${(value / docs.length * 100).toStringAsFixed(0)}%',
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (isContainerEnabled[index]) {
                            setState(() {
                              value++;
                              isContainerEnabled[index] = false;
                              updateProgress(value, widget.ders); // İlerlemeyi Firebase'e kaydet
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: isContainerEnabled[index] ? Colors.deepOrange : Colors.green, // Etkin olmayan container'ları gri renkte göster
                          ),
                          child: GridTile(
                            child: Center(
                              child: Text(
                                docs[index]["ders"],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void updateProgress(double value, String lesson) async {
    try {
      await FirebaseFirestore.instance
          .collection("ilerleme")
          .doc(lesson)
          .update({'value': value});
      print('Progress updated successfully');

      setState(() {
        this.value = value;
        isContainerEnabled = List<bool>.generate(totalItems, (index) => index >= value);
      });
    } catch (error) {
      print('Error updating progress: $error');
    }
  }

  void getProgress(String lesson) async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("ilerleme")
          .doc(lesson)
          .get();

      if (doc.exists) {
        setState(() {
          value = doc.get("value") ?? 0;
          totalItems = doc.get("totalItems") ?? 0;
          isContainerEnabled = List<bool>.generate(totalItems, (index) => index >= value);
        });
      }
    } catch (error) {
      print('Error getting progress: $error');
    }
  }
}
