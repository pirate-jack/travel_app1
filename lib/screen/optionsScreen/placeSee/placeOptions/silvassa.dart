import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Silvassa extends StatefulWidget {
  const Silvassa({super.key});

  @override
  State<Silvassa> createState() => _SilvassaState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _SilvassaState extends State<Silvassa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Silvassa',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection('place to see')
            .doc('silvassa')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(snapshot.data?['image']),
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
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Text('${snapshot.data?['info']}',style: TextStyle(fontSize: 15))),

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
    );
  }
}
