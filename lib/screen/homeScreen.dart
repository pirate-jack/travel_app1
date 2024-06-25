import 'package:flutter/material.dart';
import 'package:travel_app/screen/model/item.dart';
import 'package:travel_app/screen/optionsScreen/about_Surat.dart';
import 'package:travel_app/screen/optionsScreen/cinema/cinema.dart';
import 'package:travel_app/screen/optionsScreen/damsAndlakes/dams_lake.dart';
import 'package:travel_app/screen/optionsScreen/dev_info.dart';
import 'package:travel_app/screen/optionsScreen/devotionalPlace/devotional_place.dart';
import 'package:travel_app/screen/optionsScreen/historicalPlace/historical_place.dart';
import 'package:travel_app/screen/optionsScreen/hotels/hotel.dart';
import 'package:travel_app/screen/optionsScreen/how_to_reach.dart';
import 'package:travel_app/screen/optionsScreen/mall/mall.dart';
import 'package:travel_app/screen/optionsScreen/otherplace/other_place.dart';
import 'package:travel_app/screen/optionsScreen/placeSee/place_to_around.dart';
import 'package:travel_app/screen/optionsScreen/surat_In_map/surat_in_map.dart';
import 'package:travel_app/screen/optionsScreen/waterParks/water_park.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

List<Options> options_list = [
  Options(text: 'ABOUT SURAT', color: Colors.orange, img: 'assets/icons/1.png'),
  Options(text: 'How TO REACH', color: Colors.grey, img: 'assets/icons/2.png'),
  Options(text: 'SURAT IN MAP', color: Colors.green, img: 'assets/icons/3.png'),
  Options(text: 'HISTORICAL PLACE', color: Colors.blue, img: 'assets/icons/4.png'),
  Options(
      text: 'DEVOTIONAL PLACES', color: Colors.lightGreen, img: 'assets/icons/5.png'),
  Options(text: 'WATER PARKS', color: Colors.brown, img: 'assets/icons/6.png'),
  Options(text: 'DAMS / LAKE', color: Colors.blue, img: 'assets/icons/7.png'),
  Options(text: 'OTHER PLACES', color: Colors.indigo, img: 'assets/icons/8.png'),
  Options(text: 'PLACE TO SEE AROUND', color: Colors.red, img: 'assets/icons/9.png'),
  Options(text: 'CINEMAS', color: Colors.purple, img: 'assets/icons/10.png'),
  Options(text: 'HOTELS', color: Colors.yellow.shade900, img: 'assets/icons/11.png'),
  Options(text: 'MALLS', color: Colors.green, img: 'assets/icons/12.png'),
  Options(
      text: 'TRAVEL GUIDE', color: Colors.purpleAccent, img: 'assets/icons/13.png'),
  Options(text: 'DISTANCES', color: Colors.redAccent, img: 'assets/icons/14.png'),
  Options(text: 'DEVELOPERS', color: Colors.purple, img: 'assets/icons/15.png'),
];

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: options_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 5 / 6),
          itemBuilder: (context, index) {
            Options options = options_list[index];
            return InkWell(
              onTap: () => _onTap(options,context),
              child: Container(
                color: options_list[index].color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            options_list[index].img,
                            height: 51,
                            width: 51,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            options_list[index].text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _onTap(Options option, BuildContext context) {
    switch (option.text){
      case'ABOUT SURAT' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => About_surat(),));
        break;
      case'How TO REACH' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => HowToReach(),));
        break;

      case'HISTORICAL PLACE' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlace(),));
        break;
      case'DEVOTIONAL PLACES' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => DevotionalPlace(),));
        break;
      case'WATER PARKS' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => WaterPark(),));
        break;
      case'DAMS / LAKE' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => DamsLake(),));
        break;
      case'OTHER PLACES' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtherPlace(),));
        break;
      case'PLACE TO SEE AROUND' :
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PlaceToAround(),));
        break;
      case'CINEMAS' :
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Cinema(),));
        break;
      case'HOTELS' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => Hotel(),));
        break;
      case'MALLS' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mall(),));
        break;
      case'DEVELOPERS' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => DevInfo(),));
        break;
      case'SURAT IN MAP' :
        Navigator.push(context, MaterialPageRoute(builder: (context) => SuratInMap(),));
        break;
    }
  }
}
