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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, '/createTrip');},backgroundColor: Colors.blue,child: Icon(Icons.add),),
        backgroundColor: Colors.grey[100],
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
                      child: Center(child: Text('Trips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,))),
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
                              padding: const EdgeInsets.all(12.0),
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
                                  Text('${snapshot.data[index].depature}'),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].depDate.toString()}'),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].depTime.toString()}'),
                                  SizedBox(height: 35,),
                                  Container(height: 20,width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),),
                                ],),
                              ),
                              SizedBox(width: 10,),
                              Container(child: Icon(Icons.flight_takeoff)),
                              SizedBox(width: 10,),
                              Container(child: Column(
                                children: <Widget>[
                                  Text('${snapshot.data[index].destination}'),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].desDate.toString()}'),
                                  SizedBox(height: 5,),
                                  Text('${snapshot.data[index].desTime.toString()}'),
                                  SizedBox(height: 22,),
                                  IconButton(icon: Icon(Icons.more_vert),onPressed:null ,)
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
}