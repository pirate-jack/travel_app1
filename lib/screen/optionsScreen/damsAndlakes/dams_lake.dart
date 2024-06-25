import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/damsAndlakes/damsoptions/tapi_lake.dart';
import 'package:travel_app/screen/optionsScreen/damsAndlakes/damsoptions/ukai_dam.dart';

class DamsLake extends StatefulWidget {
  const DamsLake({super.key});

  @override
  State<DamsLake> createState() => _DamsLakeState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _DamsLakeState extends State<DamsLake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dams And Lakes',style: TextStyle(color: Colors.white),),
      ),
      body:  StreamBuilder(
        stream: _firestore.collection('dams and lake').snapshots(),
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
                    onTap: () => _opTap(
                        ViewList(tex: snapshot.data?.docs[index]['name']),
                        context),
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
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  _opTap(ViewList viewList, BuildContext context) {
    switch (viewList.tex) {
      case 'Tapi Lake':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TapiLake(),
            ));
        break;
      case 'Ukai Dam':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UkaiDam(),
            ));
        break;

    }
  }
}
