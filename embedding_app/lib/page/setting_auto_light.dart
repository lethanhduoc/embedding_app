import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class AutoLight extends StatefulWidget {
  const AutoLight({super.key});

  @override
  State<AutoLight> createState() => _AutoLightState();
}

class _AutoLightState extends State<AutoLight> {
  DatabaseReference dbRefLight = FirebaseDatabase.instance.ref().child("data/Farming_area/light/auto_setting");
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
  TimeOfDay _timeOfDayOn = TimeOfDay.now();
  TimeOfDay _timeOfDayOff = TimeOfDay.now();
  Future<void> _showTimePickerOn(BuildContext context) async {
    showTimePicker(
      context: context,
      initialTime: DateTime.now().day == _selectedDate.day
          ? TimeOfDay.now()
          : const TimeOfDay(hour: 07, minute: 30),
    ).then((value) {
      _timeOfDayOn = value!;
      setState(() {
        if (DateTime.now().day == _selectedDate.day &&
                _timeOfDayOn.hour < TimeOfDay.now().hour ||
            DateTime.now().day == _selectedDate.day &&
                // ignore: unrelated_type_equality_checks
                _timeOfDayOn.hour == TimeOfDay.now() &&
                _timeOfDayOn.minute < TimeOfDay.now().minute) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Thông báo lỗi"),
                content: Text("Thời gian không hợp lệ!"),
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
        } 
        // else {
        //   widget.seltetedDatetime(
        //       '${DateFormat('dd-MM-yyyy').format(_selectedDate)}  ${_timeOfDay.format(context).toString()}');
        // }
      });
    });
  }
  void saveAutoSetting(DateTime selectedDate, TimeOfDay timeOn, TimeOfDay timeOff) {
  // Định dạng ngày tháng
  String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

  // Định dạng thời gian
  String formattedTimeOn = "${timeOn.hour}:${timeOn.minute}";
  String formattedTimeOff = "${timeOff.hour}:${timeOff.minute}";

  // Lưu giá trị vào Firebase
  dbRefLight.update({
    "date": formattedDate,
    "timeOn": formattedTimeOn,
    "timeOff": formattedTimeOff,
  });
}

  Future<void> _showTimePickerOff(BuildContext context) async {
    showTimePicker(
      context: context,
      initialTime: DateTime.now().day == _selectedDate.day
          ? TimeOfDay.now()
          : const TimeOfDay(hour: 07, minute: 30),
    ).then((value) {
      _timeOfDayOff = value!;
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Text("Cài đặt tự động", style: GoogleFonts.sarabun(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                      backgroundColor: const Color.fromARGB(255, 133, 246, 3).withOpacity(0.3),
                      actions: [
                        IconButton(onPressed: (){
                          saveAutoSetting(_selectedDate, _timeOfDayOn, _timeOfDayOff);
                          showAlertDialog(context);
                        }, icon: Icon(Icons.check), iconSize: 35,)
                      ],),
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
                                              padding: EdgeInsets.only(left:20),
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
                                                            '${"  "}${_timeOfDayOn.format(context).toString()}',
                                                            style: TextStyle(
                                                                fontSize:16,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color.fromARGB(255, 106, 111, 6)
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              _showTimePickerOn(
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
                                                            '${"  "}${_timeOfDayOff.format(context).toString()}',
                                                            style: TextStyle(
                                                                fontSize:16,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color.fromARGB(255, 106, 111, 6)
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              _showTimePickerOff(
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
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK", style: TextStyle(color: Colors.black)),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Thông báo"),
    content: Text("Cài đặt tự động mở đèn thành công"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}