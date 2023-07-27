import 'package:flutter/material.dart';
import 'package:tarea9/views/map.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Ubicación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(labelText: 'Apellido'),
          ),
          TextField(
            controller: latitudeController,
            decoration: InputDecoration(labelText: 'Latitud'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextField(
            controller: longitudeController,
            decoration: InputDecoration(labelText: 'Longitud'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: ((context) => MapScreen(firstName: firstNameController.text,
            lastName: lastNameController.text,
            latitude: double.tryParse(latitudeController.text) ?? 0.0,
            longitude: double.tryParse(longitudeController.text) ?? 0.0)),));
          }, child: Text('Siguiente'))
        ]),
      ),
    );
  }
}
