import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<Hotel> createState() => _HotelState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Hotels",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('Hotel').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.location_on_outlined),

                    title: Text('${snapshot.data?.docs[index]['name']}'),
                    isThreeLine: true,
                    subtitle: Text('${snapshot.data?.docs[index]['info']}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.hasError.toString()),
              );
            } else {
              return Text('No data');
            }
          } else {
            return
              Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
