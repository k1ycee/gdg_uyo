import 'package:flutter/material.dart';
import 'package:gdg_uyo/models/travel_model.dart';
import 'package:gdg_uyo/store/database.dart';

class CreateTrip extends StatefulWidget {
  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  
  final depatureController = TextEditingController();
  final depTimeController = TextEditingController();
  final depDateController = TextEditingController();
  final destinationController = TextEditingController();
  final desTimeController = TextEditingController();
  final desDateController = TextEditingController();
  var _value;
  
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
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 60,
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.datetime,
                        controller: depTimeController,
                        decoration: InputDecoration(hintText: 'Enter Date',hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ), 
                    SizedBox(width: 60,),
                     Container(
                      width: 120,
                      height: 60,
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.datetime,
                        controller: depDateController,
                        decoration: InputDecoration(hintText: 'Enter Time',hintStyle: TextStyle(color: Colors.grey[500])),
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
                SizedBox(height: 20,),
                 Row(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 60,
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.datetime,
                        controller: desTimeController,
                        decoration: InputDecoration(hintText: 'Enter Date',hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                    ), 
                    SizedBox(width: 60,),
                     Container(
                      width: 120,
                      height: 60,
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.datetime,
                        controller: desDateController,
                        decoration: InputDecoration(hintText: 'Enter Time',hintStyle: TextStyle(color: Colors.grey[500],)),
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
                        depDate: depDateController.text,
                        depTime: depTimeController.text,
                        desDate: desDateController.text,
                        desTime: desTimeController.text,
                        depature: depatureController.text,
                        destination: destinationController.text,
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