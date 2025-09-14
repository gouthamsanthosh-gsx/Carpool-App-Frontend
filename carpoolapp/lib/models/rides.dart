class Rides {
  /// ? Supports null values */
  late String? id;
  late String? carId;
  late String? Destination;
  late String? Departure_Location;
  late String? Departure_Date;
  late String? Departure_Time;
  late int? Ride_Fees;

  Rides({
    this.id,
    required this.carId,
    required this.Destination,
    required this.Departure_Date,
    required this.Departure_Location,
    required this.Departure_Time,
    required this.Ride_Fees,
  });

  Rides.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    carId = json["carId"];
    Destination = json["Destination"];
    Departure_Date = json["Departure_Date"];
    Departure_Location = json["Departure_Location"];
    Departure_Time = json["Departure_Time"];
    Ride_Fees = json["Ride_Fees"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["_id"] = id;
    data["carId"] = carId;
    data["Destination"] = Destination;
    data["Departure_Date"] = Departure_Date;
    data["Departure_Location"] = Departure_Location;
    data["Departure_Time"] = Departure_Time;
    data["Ride_Fees"] = Ride_Fees;

    return data;
  }

// Get data from backend
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carId': carId,
      'Destination': Destination,
      'Departure_Date': Departure_Date,
      'Departure_Location': Departure_Location,
      'Departure_Time': Departure_Time,
      'Ride_Fees': Ride_Fees,
    };
  }
}
