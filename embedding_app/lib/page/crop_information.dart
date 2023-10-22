import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CropInformation extends StatefulWidget {
  const CropInformation({super.key});

  @override
  State<CropInformation> createState() => _CropInformationState();
}

class _CropInformationState extends State<CropInformation> {
  Query dbRef = FirebaseDatabase.instance.ref().child("data");
 
  Widget Contentdb({required Map embedding}){
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
          height: screenSize.height,
          width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/node_activities.png"), fit: BoxFit.fill)
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Text("Khuyến khích: Mở máy bơm nước", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25)),
          //SizedBox(height:100),
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
                    Image.asset("images/temperature.png", width: 55,),
                    SizedBox(width:10),
                    Text("${embedding['temperature']}°C", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.red)),
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
                    Text("${embedding['humidity']}%", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.lightBlue)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap:() {
                print(embedding['light']['isNotFound']);
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
                    Image.asset("images/light.png", width: 75, ),
                    SizedBox(width:10),
                    embedding['light']['isNotFound']==true?
                    Text(embedding['light']['isOn']==true?"On":"Off", style: GoogleFonts.sarabun(fontSize: 22,fontWeight: FontWeight.bold, color:const Color.fromARGB(255, 240, 218, 14))):
                    const Icon(Icons.error,color: Colors.red,),
                  ],
                ),
              ),
            )
          ],
        )
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Thông tin môi trường", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),),
      body: FirebaseAnimatedList(query: dbRef, itemBuilder: (context, snapshot, animation, index) {
        Map student = snapshot.value as Map;
          student['key'] = snapshot.key;
 
          return Contentdb(embedding: student);
      },)
    );
  }
}