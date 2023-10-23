import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  DatabaseReference dbRefLight = FirebaseDatabase.instance.ref().child("data");
  bool isSwichedLight = false;
  bool isSwichedWater = false;
  @override
  void initState(){
    super.initState();
  }
  void updateLightIsOn(bool newValue) {
  DatabaseReference lightRef = dbRefLight.child("Farming_area/light");
  lightRef.update({
    "isOn": newValue,
  });
}
void updatePumbIsOn(bool newValue) {
  DatabaseReference lightRef = dbRefLight.child("Farming_area/pump");
  lightRef.update({
    "isOn": newValue,
  });
}
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Color.fromARGB(255, 19, 12, 230);
        }
        return null;

      },
    );
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text("Trung tâm điều khiển", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),
                      actions: [
                        IconButton(onPressed: (){
                          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Thông báo"),
                content: Text("Đã cập nhật tác vụ", style: GoogleFonts.sarabun(fontSize: 16),),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
                        }, icon: Icon(Icons.check), iconSize: 35,)
                      ],),
      body: SafeArea(
        child: Container(
          width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/node_activities.png"), fit: BoxFit.fill)
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chế độ: Điều khiển", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25)),
          SizedBox(height:100),
            InkWell(
              onTap:() {
                
              },
              child: Container(
                width:screenSize.width/1.5,
                height:120,
                decoration:BoxDecoration(
                  color: Color(0xFFf4ffd7),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("images/light.png", width: 55, ),
                    SizedBox(width:20),
                    Switch(
                      trackColor: trackColor,
                      overlayColor: overlayColor,
                      value: isSwichedLight, onChanged: (value){
                      setState(() {
                        isSwichedLight = value;
                        updateLightIsOn(value);
                      });
                    })
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap:() {
                
              },
              child: Container(
                width:screenSize.width/1.5,
                height:120,
                decoration:BoxDecoration(
                  color: Color(0xFFf4ffd7),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("images/water.png", width: 55),
                    SizedBox(width:10),
                   Switch(
                      trackColor: trackColor,
                      overlayColor: overlayColor,
                      value: isSwichedWater, onChanged: (value){
                      setState(() {
                        isSwichedWater= value;
                        updatePumbIsOn(value);
                      });
                    })
                  ],
                ),
              ),
            ),
          ],
        )
      ))
    );
  }
}