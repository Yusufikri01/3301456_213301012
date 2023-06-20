import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/OrtakDers.dart';



class Dersler extends StatefulWidget {
  const Dersler({Key? key}) : super(key: key);

  @override
  State<Dersler> createState() => _DerslerState();
}

class _DerslerState extends State<Dersler> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OTURUMLAR"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection("Lesson").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("BAĞLANTI HATASI");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.teal[500]),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrtakDers(docs[index]["oturum"])));
                        },
                        child: ListTile(
                          title: Text(docs[index]["oturum"]),
                        ),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
