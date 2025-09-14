// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:carpoolapp/screens/home_screen.dart';

import 'package:carpoolapp/apis/car_api.dart';

import '../models/car.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({super.key, required this.id});
  final String id;

  @override
  State<EditCarScreen> createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  late Future<Car>? futureCar;
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController energyTypeController = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItemsCarManufacturer {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "Chrysler", child: Text("Chrysler")),
      DropdownMenuItem(value: "Honda", child: Text("Honda")),
      DropdownMenuItem(value: "Mercedes-benz", child: Text("Mercedes-benz")),
      DropdownMenuItem(value: "Ford", child: Text("Ford")),
      DropdownMenuItem(value: "gmc", child: Text("gmc")),
      DropdownMenuItem(value: "audi", child: Text("audi")),
      DropdownMenuItem(value: "porsche", child: Text("porsche")),
      DropdownMenuItem(value: "bmw", child: Text("bmw")),
      DropdownMenuItem(value: "volvo", child: Text("volvo")),
      DropdownMenuItem(value: "maserati", child: Text("maserati")),
      DropdownMenuItem(value: "fiat", child: Text("fiat")),
      DropdownMenuItem(value: "volkswagen", child: Text("volkswagen")),
      DropdownMenuItem(value: "toyota", child: Text("toyota")),
      DropdownMenuItem(value: "jeep", child: Text("jeep")),
      DropdownMenuItem(value: "hyundai", child: Text("hyundai")),
      DropdownMenuItem(value: "alfa-romeo", child: Text("alfa-romeo")),
      DropdownMenuItem(value: "kia", child: Text("kia")),
      DropdownMenuItem(value: "mazda", child: Text("mazda")),
      DropdownMenuItem(value: "nissan", child: Text("nissan")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsColor {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "White", child: Text("White")),
      DropdownMenuItem(value: "Black", child: Text("Black")),
      DropdownMenuItem(value: "Gray", child: Text("Gray")),
      DropdownMenuItem(value: "Silver", child: Text("Silver")),
      DropdownMenuItem(value: "Red", child: Text("Red")),
      DropdownMenuItem(value: "Blue", child: Text("Blue")),
      DropdownMenuItem(value: "Brown", child: Text("Brown")),
      DropdownMenuItem(value: "Green", child: Text("Green")),
      DropdownMenuItem(value: "Beige", child: Text("Beige")),
      DropdownMenuItem(value: "Orange", child: Text("Orange")),
      DropdownMenuItem(value: "Gold", child: Text("Gold")),
      DropdownMenuItem(value: "Yellow", child: Text("Yellow")),
      DropdownMenuItem(value: "Purple", child: Text("Purple")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsEnergyType {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "Gasoline", child: Text("Gasoline")),
      DropdownMenuItem(value: "Diesel", child: Text("Diesel")),
      DropdownMenuItem(value: "Electric", child: Text("Electric")),
      DropdownMenuItem(
          value: "Hybrid Electric",
          child: Text("Hybrid Electric")),
      DropdownMenuItem(
          value: "Plug-in Hybrid Electric",
          child: Text("Plug-in Hybrid Electric")),
    ];
    return menuItems;
  }

  String brand = "";
  String model = "";
  String color = "";
  String energy_type = "";
  String id = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCar = CarApi.getCarById(widget.id);
    print(futureCar);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        centerTitle: true,
        leading: ElevatedButton.icon(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text("Back"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        title: const Text(
          'Edit Your Car Information',
          style: TextStyle(color: Colors.black),
        ),
        leadingWidth: 100,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        automaticallyImplyLeading: false,

      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FutureBuilder<Car>(
            future: futureCar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var carInformation = snapshot.data;
                id = carInformation!.id.toString();
                // String model = carInformation!.model.toString();
                // String color = carInformation.color.toString();
                // String energy_type = carInformation.energy_type.toString();
                // brandController.text = brand;
                String selectedValueManufacturer =
                    carInformation.brand.toString();
                String selectedValueModel = carInformation.model.toString();
                String selectedValueEnergy =
                    carInformation.energy_type.toString();
                return SafeArea(
                  child: SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Car brand',
                                    style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF008CFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                icon: const Icon(Icons.arrow_drop_down_circle,
                                    color: Color(0xFF008CFF)),
                                initialValue: carInformation.brand.toString(),
                                items: dropdownItemsCarManufacturer,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValueManufacturer = newValue!;
                                    if (newValue.isEmpty) {
                                      brand = selectedValueManufacturer;
                                    } else {
                                      brand = newValue;
                                      print(brand);
                                      // brandController.text = newValue;
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Car Color',
                                    style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF008CFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                icon: const Icon(Icons.arrow_drop_down_circle,
                                    color: Color(0xFF008CFF)),
                                initialValue: carInformation.color.toString(),
                                items: dropdownItemsColor,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValueManufacturer = newValue!;
                                    if (newValue.isEmpty) {
                                      color = selectedValueModel;
                                    } else {
                                      color = newValue;
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Car energy type',
                                    style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF008CFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                icon: const Icon(Icons.arrow_drop_down_circle,
                                    color: Color(0xFF008CFF)),
                                initialValue: carInformation.energy_type.toString(),
                                items: dropdownItemsEnergyType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValueEnergy = newValue!;
                                    if (newValue.isEmpty) {
                                      energy_type = selectedValueEnergy;
                                    } else {
                                      energy_type = newValue;
                                      // brandController.text = newValue;
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (brand.isEmpty) {
                                    brand = carInformation.brand.toString();
                                  }
                                  if (color.isEmpty) {
                                    color = carInformation.color.toString();
                                  }
                                  if (energy_type.isEmpty) {
                                    energy_type =
                                        carInformation.energy_type.toString();
                                  }
                                  print("#################");
                                  print(brand);
                                  print(color);
                                  print(energy_type);
                                  print(id);
                                  CarApi.editCar(id, brand, color, energy_type);
                                 // Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Color(0xFF008CFF),
                                  fixedSize: Size(150, 50),
                                  textStyle: TextStyle(
                                      fontFamily: 'DM Sans', fontSize: 19),
                                ),
                                child: const Text("Save changes"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text("Som"));
                }
              }
              return const CircularProgressIndicator(
                value: 20,
              );
            }),
      ),
    );
  }
}
