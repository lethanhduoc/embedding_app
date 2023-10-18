import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AutoLight extends StatefulWidget {
  const AutoLight({super.key});

  @override
  State<AutoLight> createState() => _AutoLightState();
}

class _AutoLightState extends State<AutoLight> {
  DateTime _selectedDate = DateTime.now();
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Future<void> _showTimePicker(BuildContext context) async {
    showTimePicker(
      context: context,
      initialTime: DateTime.now().day == _selectedDate.day
          ? TimeOfDay.now()
          : const TimeOfDay(hour: 07, minute: 30),
    ).then((value) {
      _timeOfDay = value!;
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text("Cài đặt tự động", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: const Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),),
      body: SafeArea(
        child: Container(
          width:screenSize.width,
          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage("images/node_activities.png"), fit: BoxFit.fill)
          ),
        child: Column(
          
          children: [
            SizedBox(height: 50,),
            Text("Cài đặt tự động bắt đèn", style: GoogleFonts.sarabun(fontWeight: FontWeight.bold, color: Colors.white,
                                                                      fontSize: 25)),
            SizedBox(height: 80,),
            Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Chọn thời gian mở",
                                              style: GoogleFonts.sarabun(
                                                  fontSize:20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenSize.width < 651
                                                      ? 20
                                                      : 32),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                //padding: EdgeInsets.only(right: 20),
                                                width: screenSize.width < 651
                                                    ? screenSize.width / 2
                                                    : 385,
                                                height: screenSize.width < 651
                                                    ? 80
                                                    : 50,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 11),
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            // ignore: unrelated_type_equality_checks
                                                            _timeOfDay.minute ==
                                                                    DateTime.now()
                                                                        .minute
                                                                ? ' '
                                                                : screenSize.width <
                                                                        651
                                                                    ? _timeOfDay
                                                                        .format(
                                                                            context)
                                                                        .toString()
                                                                    : '${"  "}:${_timeOfDay.format(context).toString()}',
                                                            style: TextStyle(
                                                                fontSize:16,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color.fromARGB(255, 106, 111, 6)
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              _showTimePicker(
                                                                  context);
                                                              setState(() {});
                                                            },
                                                            child: Text(
                                                             "Chọn thời gian ",
                                                              style: GoogleFonts.sarabun(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Color.fromARGB(255, 9, 87, 99)
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
             Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Chọn thời gian tắt",
                                              style: GoogleFonts.sarabun(
                                                  fontSize:20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenSize.width < 651
                                                      ? 20
                                                      : 32),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                //padding: EdgeInsets.only(right: 20),
                                                width: screenSize.width < 651
                                                    ? screenSize.width / 2
                                                    : 385,
                                                height: screenSize.width < 651
                                                    ? 80
                                                    : 50,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 11),
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            // ignore: unrelated_type_equality_checks
                                                            _timeOfDay.minute ==
                                                                    DateTime.now()
                                                                        .minute
                                                                ? ' '
                                                                : screenSize.width <
                                                                        651
                                                                    ? _timeOfDay
                                                                        .format(
                                                                            context)
                                                                        .toString()
                                                                    : '${"  "}:${_timeOfDay.format(context).toString()}',
                                                            style: TextStyle(
                                                                fontSize:16,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color.fromARGB(255, 106, 111, 6)
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              _showTimePicker(
                                                                  context);
                                                              setState(() {});
                                                            },
                                                            child: Text(
                                                             "Chọn thời gian ",
                                                              style: GoogleFonts.sarabun(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Color.fromARGB(255, 9, 87, 99)
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
            SizedBox(height: 20,),
             Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Chọn ngày tự động",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenSize.width < 651 ? 20 : 32),
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 7),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      //padding: EdgeInsets.only(right: 20),
                                      width: screenSize.width < 651
                                          ? screenSize.width / 2
                                          : 385,
                                      height: screenSize.width < 651 ? 80 : 50,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 11),
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  // ignore: unrelated_type_equality_checks
                                                  _selectedDate.minute ==
                                                          DateTime.now().minute
                                                      ? ' '
                                                      : screenSize.width < 651
                                                          ? '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                                                          : '${" "}:${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                                  style: TextStyle(
                                                      fontSize:15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(255, 106, 111, 6)
                                                                    .withOpacity(
                                                                        0.8)),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _selectDate(context);
                                                  },
                                                  child: Text(
                                                    "Chọn ngày",
                                                    style: GoogleFonts.sarabun(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 9, 87, 99)
                                                                      .withOpacity(0.5)),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: InkWell(
                  onTap: () {
                    showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Thông báo"),
                content: Text("Chế độ mở đèn tự động hàng ngày đã mở", style: GoogleFonts.sarabun(fontSize: 16),),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
                  },
                  child: Container(
                    width: screenSize.width/2.5,
                    height:80,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                    child: Center(
                      child: Text("Hàng ngày",style: GoogleFonts.sarabun(color: Color.fromARGB(255, 106, 111, 6).withOpacity(0.8),
                                                                          fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              )
          ],
        )
      ))
    );
  }
}