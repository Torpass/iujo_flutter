import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool trabaja = false;
  bool estudia = false;
  String genero = 'Masculino';
  bool notificaciones = false;
  double precioEstimado = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Captura de Datos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'IUJO ♥',
                    style: TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Extensión Barquisimeto',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Text(
                    'Formulario de captura de Datos',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Trabaja'),
              value: trabaja,
              onChanged: (value) {
                setState(() {
                  trabaja = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Estudia'),
              value: estudia,
              onChanged: (value) {
                setState(() {
                  estudia = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Género'),
            RadioListTile(
              title: Text('Masculino'),
              value: 'Masculino',
              groupValue: genero,
              onChanged: (value) {
                setState(() {
                  genero = value!;
                });
              },
            ),
            RadioListTile(
              title: Text('Femenino'),
              value: 'Femenino',
              groupValue: genero,
              onChanged: (value) {
                setState(() {
                  genero = value!;
                });
              },
            ),
            SwitchListTile(
              title: Text('Activar Notificaciones'),
              value: notificaciones,
              onChanged: (value) {
                setState(() {
                  notificaciones = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Seleccione Precio Estimado'),
            Slider(
              value: precioEstimado,
              min: 0,
              max: 100,
              divisions: 5,
              label: precioEstimado.round().toString(),
              onChanged: (value) {
                setState(() {
                  precioEstimado = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today),
                  label: Text(
                    selectedDate == null
                        ? 'Fecha'
                        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectTime(context),
                  icon: Icon(Icons.access_time),
                  label: Text(
                    selectedTime == null
                        ? 'Hora'
                        : '${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
