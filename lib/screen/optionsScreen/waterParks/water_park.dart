import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/waterParks/water_park_options/Amaazia.dart';
import 'package:travel_app/screen/optionsScreen/waterParks/water_park_options/modi_resort.dart';

class WaterPark extends StatefulWidget {
  const WaterPark({super.key});

  @override
  State<WaterPark> createState() => _WaterParkState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _WaterParkState extends State<WaterPark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Water Parks',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body:  StreamBuilder(
        stream: _firestore.collection('water parks').snapshots(),
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
      case 'Amaazia':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Amaazia(),
            ));
        break;
      case 'Modi Resort':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModiResort(),
            ));
        break;

    }
  }
}
