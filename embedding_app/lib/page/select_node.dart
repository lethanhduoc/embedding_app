import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SelectNode extends StatefulWidget {
  const SelectNode({super.key});

  @override
  State<SelectNode> createState() => _SelectNodeState();
}

class _SelectNodeState extends State<SelectNode> {
  Query dbRef = FirebaseDatabase.instance.ref().child("data");
  Widget listNode({required Map selectnode}){
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
                  onTap:() {
                    Navigator.pushNamed(context, "/dashboard");
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
                        //Image.asset("images/node.png", width: 55, color:Colors.white),
                        SizedBox(width:10),
                        Text(selectnode["name"], style: GoogleFonts.sarabun(fontSize: 22, color:Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,)
      ],
    );
            
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text("Chọn Khu Vực", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),),
      body: Container(
        padding: EdgeInsets.only(top:230),
        width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/Dashboard.png"), fit: BoxFit.fill)
          ),
        child: FirebaseAnimatedList(query: dbRef, itemBuilder: (context, snapshot, animation, index) {
          Map student = snapshot.value as Map;
          student['key'] = snapshot.key;
 
          return listNode(selectnode: student);
      },),
      ),
    );
  }
}