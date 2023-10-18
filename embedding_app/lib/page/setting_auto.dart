import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SettingAutomatic extends StatefulWidget {
  const SettingAutomatic({super.key});

  @override
  State<SettingAutomatic> createState() => _SettingAutomaticState();
}

class _SettingAutomaticState extends State<SettingAutomatic> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text("Cài đặt tự động", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),),
      body: SafeArea(
        child: Container(
          width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/node_activities.png"), fit: BoxFit.fill)
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    Image.asset("images/panel.png", width: 55, ),
                    SizedBox(width:20),
                   Text("Điều khiển", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.red)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap:() {
                _showDialog(context);
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
                    Image.asset("images/auto.png", width: 55),
                    SizedBox(width:10),
                   Text("Tự động", style: GoogleFonts.sarabun(fontSize: 22, color:Colors.red)),
                  ],
                ),
              ),
            ),
          ],
        )
      ))
    );
  }
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( backgroundColor: Colors.white,
          title: Text('Chọn tác vụ', style:GoogleFonts.sarabun(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Máy bom tự động', style: GoogleFonts.sarabun(fontSize: 16, color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, "/autowater");
                },
              ),
              ListTile(
                title: Text('Mở đèn tự động', style: GoogleFonts.sarabun(fontSize: 16, color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, "/autolight");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}