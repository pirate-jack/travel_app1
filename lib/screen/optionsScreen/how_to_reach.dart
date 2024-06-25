import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HowToReach extends StatefulWidget {
  const HowToReach({super.key});

  @override
  State<HowToReach> createState() => _HowToReachState();
}

class _HowToReachState extends State<HowToReach> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('How to Reach',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore
              .collection('travel_app')
              .doc('how to reach')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(snapshot.data?['image'],width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'By Train',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: Text('${snapshot.data?['info']}',style: TextStyle(fontSize: 15)),
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
