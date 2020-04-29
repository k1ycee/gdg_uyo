class Travel{
  final int id;
  final String depature;
  final String depDate;
  final String depTime;
  final String destination;
  final String desDate;
  final String desTime;
  final String tripType;
  Travel({this.id, this.depature, this.depDate, this.depTime, this.destination, this.desDate, this.desTime, this.tripType});

  Travel.fromMap(Map <String, dynamic> data)
   : id = data["id"],
     depature = data["depature"],
     depDate = data["depDate"],
     depTime = data["depTime"],
     destination = data["destination"],
     desDate = data["desDate"],
     desTime = data["desTime"],
     tripType = data["tripType"];


  Map<String,dynamic> toJson(){
    return{
      'id': id,
      'depature': depature,
      'depDate': depDate,
      'depTime': depTime,
      'destination': destination,
      'desDate': desDate,
      'desTime': desTime,
      'tripType': tripType
    };
  }
}