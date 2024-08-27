import 'package:flutter/material.dart';
import '../component_type_model/manufacturer_model.dart';

class ManufacturerDropdown extends StatefulWidget {
  final List<Manufacturer> manufacturers;
  final Function(Manufacturer) onSelected;

  ManufacturerDropdown({required this.manufacturers, required this.onSelected});

  @override
  _ManufacturerDropdownState createState() => _ManufacturerDropdownState();
}

class _ManufacturerDropdownState extends State<ManufacturerDropdown> {
  Manufacturer? selectedManufacturer;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Manufacturer>(
      hint: Text('Select Manufacturer'),
      value: selectedManufacturer,
      items: widget.manufacturers.map((Manufacturer manufacturer) {
        return DropdownMenuItem<Manufacturer>(
          value: manufacturer,
          child: Text(manufacturer.name),
        );
      }).toList(),
      onChanged: (Manufacturer? value) {
        setState(() {
          selectedManufacturer = value!;
        });
        widget.onSelected(value!);
      },
    );
  }
}
