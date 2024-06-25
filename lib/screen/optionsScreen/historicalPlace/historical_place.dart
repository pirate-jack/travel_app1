import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/info.dart';
import 'package:travel_app/screen/optionsScreen/historicalPlace/historical_options/dutchHouse.dart';
import 'package:travel_app/screen/optionsScreen/historicalPlace/historical_options/sardarpatel_museum.dart';
import 'package:travel_app/screen/optionsScreen/historicalPlace/historical_options/surat_castle.dart';
import 'package:travel_app/screen/optionsScreen/historicalPlace/historical_options/suratClockTower.dart';

class HistoricalPlace extends StatefulWidget {
  const HistoricalPlace({super.key});

  @override
  State<HistoricalPlace> createState() => _HistoricalPlaceState();
}

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _HistoricalPlaceState extends State<HistoricalPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Historical Places',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('historical place').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
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
      case 'Surat Castle':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuratCastle(),
            ));
        break;
      case 'Sardar Patel Museum':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SardarpatelMuseum(),
            ));
        break;
      case 'Surat Clock Tower':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuratClockTower(),
            ));
        break;
      case 'Dutch and Armenian Cemetery':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dutchhouse(),
            ));
        break;
    }
  }
}
