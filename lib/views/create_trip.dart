import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gdg_uyo/models/travel_model.dart';
import 'package:gdg_uyo/store/database.dart';
// import 'package:flutter/src/material/date_picker.dart';

class CreateTrip extends StatefulWidget {
  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  
  final depatureController = TextEditingController();
  final destinationController = TextEditingController();
  var _value;
  String _depDate = "Enter Date";
  String _depTime = "Enter Time";
  String _desDate = "Enter Date";
  String _desTime = "Enter Time";
  

  @override
  void initState() {
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Create a trip', style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,elevation: 0,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){},),),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.text,
                  controller: depatureController,
                  decoration: InputDecoration(hintText: 'Enter Depature',hintStyle: TextStyle(color: Colors.grey[500])),
                ),
                SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                         DatePicker.showDatePicker(
                         context, 
                         theme: DatePickerTheme(containerHeight: 210.0),
                         showTitleActions: true,
                         minTime: DateTime(1900, 1, 1),
                         maxTime: DateTime(2050, 12, 12),
                         onConfirm: (date){
                           _depDate = '${date.year} - ${date.month} - ${date.day}';
                           setState(() {});
                         }
                         );
                       },
                        child: Container(
                        width: 120,
                        height: 60,
                        child: Text(
                          '$_depDate',style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ), 
                    SizedBox(width: 60,),
                     GestureDetector(
                       onTap: (){
                         DatePicker.showTimePicker(
                           context,
                             theme: DatePickerTheme(
                            containerHeight: 210.0,
                               ),
                            showTitleActions: true, onConfirm: (time) {
                           _depTime = '${time.hour} : ${time.minute} : ${time.second}';
                            setState(() {});
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                            setState(() {});
                          },
                        child: Container(
                        width: 120,
                        height: 60,
                        child: Text(
                            '$_depTime',style: TextStyle(color: Colors.grey[500]),
                        ),
                    ),
                     ), 
                ],
                ),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.text,
                  controller: destinationController,
                  decoration: InputDecoration(hintText: 'Enter Destination',hintStyle: TextStyle(color: Colors.grey[500])),
                ),
                SizedBox(height: 30,),
                 Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                         DatePicker.showDatePicker(
                         context, 
                         theme: DatePickerTheme(containerHeight: 210.0),
                         showTitleActions: true,
                         minTime: DateTime(1900, 1, 1),
                         maxTime: DateTime(2050, 12, 12),
                         onConfirm: (date){
                           _desDate = '${date.year} - ${date.month} - ${date.day}';
                           setState(() {});
                         }
                         );
                       },
                      child: Container(
                        width: 120,
                        height: 60,
                        child: Text(
                          '$_desDate',style: TextStyle(color: Colors.grey[500])
                        ),
                      ),
                    ), 
                    SizedBox(width: 60,),
                     GestureDetector(
                       onTap:(){
                         DatePicker.showTimePicker(
                           context,
                             theme: DatePickerTheme(
                            containerHeight: 210.0,
                               ),
                            showTitleActions: true, onConfirm: (time) {
                           _desTime = '${time.hour} : ${time.minute} : ${time.second}';
                            setState(() {});
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                            setState(() {});
                          }, 
                        child: Container(
                        width: 120,
                        height: 60,
                        child: Text(
                           '$_desTime',style: TextStyle(color: Colors.grey[500],),
                        ),
                    ),
                  ), 
                ],
                ),
                SizedBox(height: 10,),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      value: "1",
                      child: Text('Business'),
                    ),
                    DropdownMenuItem<String>(
                      value: "2",
                      child: Text('Education'),
                    ),
                    DropdownMenuItem<String>(
                      value: "3",
                      child: Text('Health'),
                    ),
                    DropdownMenuItem<String>(
                      value: "4",
                      child: Text('Vacation'),
                    ),
                  ],
                  onChanged: (value){
                    setState(() {
                      _value = value;
                    });
                  },
                  hint: Text('Trip Type', style: TextStyle(color: Colors.grey[500],),),
                  value: _value,
                  isExpanded: true,
                  ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    TravelDB.db.newTravel(
                      Travel(
                        depature: depatureController.text,
                        depDate: _depDate,
                        depTime: _depTime,
                        destination: destinationController.text,
                        desDate: _desDate,
                        desTime: _desTime,
                        tripType: _value
                      )
                    );
                    Navigator.pop(context);
                  },
                    child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('Add Trip', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 15),),),
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}

