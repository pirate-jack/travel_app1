
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoseAquarium extends StatefulWidget {
  const BoseAquarium({super.key});

  @override
  State<BoseAquarium> createState() => _BoseAquariumState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _BoseAquariumState extends State<BoseAquarium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Jagdishchandra Bose Aquarium',style: TextStyle(
            color: Colors.white
        ),),
      ),
      body:  StreamBuilder(
        stream: _firestore
            .collection('other places')
            .doc('bose aq')
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Timing',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: EdgeInsets.all(5),
                    child: Text('${snapshot.data?['time']}',
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
    );
  }
}
