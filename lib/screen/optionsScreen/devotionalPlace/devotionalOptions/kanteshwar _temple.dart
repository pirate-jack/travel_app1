import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KanteshwarTemple extends StatefulWidget {
  const KanteshwarTemple({super.key});

  @override
  State<KanteshwarTemple> createState() => _KanteshwarTempleState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _KanteshwarTempleState extends State<KanteshwarTemple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanteshwar Mahadev Temple',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore
              .collection('devotional place')
              .doc('Kanteshwar Mahadev Temple')
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
                      fit: BoxFit.contain,
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
