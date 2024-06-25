import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/otherplace/otheroptions/bose_aquarium.dart';
import 'package:travel_app/screen/optionsScreen/otherplace/otheroptions/woop_playgound.dart';

class OtherPlace extends StatefulWidget {
  const OtherPlace({super.key});

  @override
  State<OtherPlace> createState() => _OtherPlaceState();
}
FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _OtherPlaceState extends State<OtherPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Other Place',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('other places').snapshots(),
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
      case "Jagdishchandra Bose Aquarium":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BoseAquarium(),
            ));
        break;
      case 'Woop Playground':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WoopPlaygound(),
            ));
        break;

    }
  }
}
