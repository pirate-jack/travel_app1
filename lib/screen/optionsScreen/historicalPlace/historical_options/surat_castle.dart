import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SuratCastle extends StatefulWidget {
  const SuratCastle({super.key});

  @override
  State<SuratCastle> createState() => _SuratCastleState();
}

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _SuratCastleState extends State<SuratCastle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Surat Castle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore
              .collection('historical place')
              .doc('surat castle')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      snapshot.data?['image'],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Info',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: Text('${snapshot.data?['info']}',
                          style: TextStyle(fontSize: 15)),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Center(
                  child: Text('No Data'),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
