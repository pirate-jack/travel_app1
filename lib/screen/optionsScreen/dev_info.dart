import 'package:flutter/material.dart';

class DevInfo extends StatefulWidget {
  const DevInfo({super.key});

  @override
  State<DevInfo> createState() => _DevInfoState();
}

class _DevInfoState extends State<DevInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios_sharp))
                  ],
                ),
                CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage('assets/icons/Wolf.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Beast Devlopers',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                Text('Create by',style: TextStyle(
                  fontWeight: FontWeight.w500,fontSize: 30
                ),),
                Text('Kris Patel',style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
