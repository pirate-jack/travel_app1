import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/devotionalPlace/devotionalOptions/ambika_tempel.dart';
import 'package:travel_app/screen/optionsScreen/devotionalPlace/devotionalOptions/iskon_temple.dart';
import 'package:travel_app/screen/optionsScreen/devotionalPlace/devotionalOptions/kanteshwar%20_temple.dart';

class DevotionalPlace extends StatefulWidget {
  const DevotionalPlace({super.key});

  @override
  State<DevotionalPlace> createState() => _DevotionalPlaceState();
}

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _DevotionalPlaceState extends State<DevotionalPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Devotional Place',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('devotional place').snapshots(),
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
      case 'Ambika Niketan Temple':
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AmbikaTempel(),
            ));
        break;
      case 'ISKCON Surat':
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IskonTemple(),
            ));
        break;
      case 'Kanteshwar Mahadev Temple':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KanteshwarTemple(),
            ));
        break;
      case 'Dutch and Armenian Cemetery':
      /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dutchhouse(),
            ));*/
        break;
    }
  }
}
