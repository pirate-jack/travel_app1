import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SardarpatelMuseum extends StatefulWidget {
  const SardarpatelMuseum({super.key});

  @override
  State<SardarpatelMuseum> createState() => _SardarpatelMuseumState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _SardarpatelMuseumState extends State<SardarpatelMuseum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sardar Patel Museum',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore
              .collection('historical place')
              .doc('sardar patel museum')
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
      )
    );
  }
}
