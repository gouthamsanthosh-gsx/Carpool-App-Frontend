import 'package:flutter/material.dart';
import 'package:carpoolapp/models/rides.dart';

class RidesDisplay extends StatelessWidget {
  const RidesDisplay({super.key, this.model, this.onDelete});

  final Rides? model;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(model!.Destination ?? ""),
      ),
    );
  }
}
