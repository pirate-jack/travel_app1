import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/placeSee/placeOptions/saputara.dart';
import 'package:travel_app/screen/optionsScreen/placeSee/placeOptions/silvassa.dart';

class PlaceToAround extends StatefulWidget {
  const PlaceToAround({super.key});

  @override
  State<PlaceToAround> createState() => _PlaceToAroundState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _PlaceToAroundState extends State<PlaceToAround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Place To See Around',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('place to see').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                    title: Text('${snapshot.data?.docs[index]['name']}'),
                    onTap: () => _opTap(ViewList(tex: snapshot.data?.docs[index]['name']), context),
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
  _opTap(ViewList viewList, BuildContext context) {
    switch (viewList.tex) {
      case "Silvassa":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Silvassa(),
            ));
        break;
      case 'Saputara':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Saputara(),
            ));
        break;
    }
  }
}
