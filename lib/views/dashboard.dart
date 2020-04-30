import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gdg_uyo/models/travel_model.dart';
import 'package:gdg_uyo/store/database.dart';
// import 'package:google_fonts/google_fonts.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Travel> tr = List<Travel>();
  final depatureController = TextEditingController();
  final destinationController = TextEditingController();
  var _value;
  String _depDate = "Enter Date";
  String _depTime = "Enter Time";
  String _desDate = "Enter Date";
  String _desTime = "Enter Time";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, '/createTrip');},backgroundColor: Colors.blue,child: Icon(Icons.add),),
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                  Row(
                  children: <Widget>[
                    Text('Hello, Denzel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    SizedBox(width: 150,),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text('10 Trips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,))),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Create your\ntrips with us', style:TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 15,),
                Expanded(
                   child: FutureBuilder(
                    future: TravelDB.db.getTravels() ,
                    builder: (context, AsyncSnapshot<List<Travel>>snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      height: 140,
                      width: 400,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                              Container(
                                child: Column(children: <Widget>[
                                  Text('${snapshot.data[index].depature}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].depDate.toString()}',style: TextStyle(color: Colors.grey[400])),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].depTime.toString()}' , style: TextStyle(color: Colors.grey[400])),
                                  SizedBox(height: 35,),
                                  Container(height: 20,width: 70, child: Center(child: Text(getText('${snapshot.data[index].tripType}'), style: TextStyle(color: Colors.white),)), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: getColor(snapshot.data[index].tripType,),
                                  ))],),
                              ),
                              SizedBox(width: 10,),
                              Container(child: Icon(Icons.flight_takeoff)),
                              SizedBox(width: 10,),
                              Container(child: Column(
                                children: <Widget>[
                                  Text('${snapshot.data[index].destination}' , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].desDate.toString()}' , style: TextStyle(color: Colors.grey[400])),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].desTime.toString()}', style: TextStyle(color: Colors.grey[400])),
                                  SizedBox(height: 19,),
                                  PopupMenuButton<int>(
                                    itemBuilder: (context) =>[
                                      PopupMenuItem(
                                        value: 1,
                                        child: Text('Update'),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Text('Delete'),
                                      ),
                                    ],
                                    onSelected: (value)async{
                                      if(value == 2){
                                         await TravelDB.db.deleteTravel(snapshot.data[index].id);
                                      }
                                      else if(value == 1){
                                        setState(() async{
                                          TravelDB.db.updateTravel(
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
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ))
                          ],),
                        ],),
                          ),
                            );
                          }
                        );
                      }
                      return SpinKitRotatingCircle(color: Colors.blue[400], size: 50,);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Color getColor(String trs){
  switch(trs){
    case "1":
      return Colors.blue;
    break;
    case "2":
      return Colors.cyan;
    break;
    case "3":
      return Colors.pinkAccent;
    break;
    case "4":
      return Colors.amber;
    break;
    default:
      return Colors.grey[500];
      break;
    }
  }
  String getText(String trs){
  switch(trs){
    case "1":
      return "Business";
    break;
    case "2":
      return "Education";
    break;
    case "3":
      return "Vacation";
    break;
    case "4":
      return "Health";
    break;
    default:
      return "There is Nothing";
      break;
    }
  }
}

