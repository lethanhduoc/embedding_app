import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(title:Text("Vườn thanh long", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),),
      body: SafeArea(
        child: Container(
          width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/Dashboard.png"), fit: BoxFit.fill)
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap:() {
                Navigator.pushNamed(context, "/cropinformation");
              },
              child: Container(
                width:screenSize.width/1.5,
                height:120,
                decoration:BoxDecoration(
                  color: Color(0xFF76937a),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/node.png", width: 55, color:Colors.white),
                    SizedBox(width:10),
                    Text("Thông tin môi trường", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap:() {
                Navigator.pushNamed(context, "/controlpanel");
              },
              child: Container(
                width:screenSize.width/1.5,
                height:120,
                decoration:BoxDecoration(
                  color: Color(0xFF76937a),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/control_panel.png", width: 55, color:Colors.white),
                    SizedBox(width:10),
                    Text("Trung tâm điều khiển", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap:() {
                Navigator.pushNamed(context, "/settingautomatic");
              },
              child: Container(
                width:screenSize.width/1.5,
                height:120,
                decoration:BoxDecoration(
                  color: Color(0xFF76937a),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/setting_auto_icon.png", width: 75, color:Colors.white),
                    SizedBox(width:10),
                    Text("Cài đặt tự động", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.white)),
                  ],
                ),
              ),
            )
          ],
        )
      ))
    );
  }
}