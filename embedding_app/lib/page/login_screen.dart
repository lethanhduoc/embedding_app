import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          decoration: const BoxDecoration(
            //color: Colors.grey
            image:DecorationImage(image: AssetImage("images/Login.png"), fit: BoxFit.fill)
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only( bottom: 100),
                child: Text("Đăng nhập", 
                style: GoogleFonts.sarabun(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tên Đăng nhập", style:GoogleFonts.sarabun(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                  Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    //padding: EdgeInsets.only(right: 20),
                                    width:
                                        screenSize.width/1.3,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: TextFormField(
                                        // controller: fullNameController,
                                        // onChanged: (value) =>
                                        //     {widget.fullName(value)},
                                        cursorColor: const Color.fromARGB(
                                            255, 35, 3, 103),
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 35, 3, 103),
                                        ),
                                        decoration: InputDecoration(
                                            hintText: "Nhập tên đăng nhập",
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                            labelStyle: const TextStyle(
                                                color: Colors.black),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                ],
              ),
              SizedBox(height:50),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mật khẩu", style:GoogleFonts.sarabun(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                  Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    //padding: EdgeInsets.only(right: 20),
                                    width:
                                        screenSize.width/1.3,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: TextFormField(
                                        obscureText: true,
                                        // controller: fullNameController,
                                        // onChanged: (value) =>
                                        //     {widget.fullName(value)},
                                        cursorColor: const Color.fromARGB(
                                            255, 35, 3, 103),
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 35, 3, 103),
                                        ),
                                        decoration: InputDecoration(
                                            hintText: "Nhập mật khẩu",
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontSize: 14),
                                            labelStyle: const TextStyle(
                                                color: Colors.black),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:30),
                      
                ],
              ),
              Center(
                child: ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(
                                        const Size(200, 50)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF43584D)),
                                  ),
                                  onPressed: () {
                                  Navigator.pushNamed(context, "/dashboard");
                                  },
                                  child: Text(
                                    "Đăng nhập",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}