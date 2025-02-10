import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool _vertebral = false;
  bool _poneHuevos = false;
  bool _tienePelo = false;
  bool _respiraAire = false;
  int _patas = 0;

  Future<void> _showPrediction() async {
    final response = await http.post(
      Uri.parse('https://sirshiro146.pythonanywhere.com/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'tiene_columna_vertebral': _vertebral ? 1 : 0,
        'pone_huevos': _poneHuevos ? 1 : 0,
        'tiene_pelo': _tienePelo ? 1 : 0,
        'respira_aire': _respiraAire ? 1 : 0,
        'cuantas_patas_tiene': _patas,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String animalType = data['tipo_de_animal'];
      String imagePath = _getRandomImagePath(animalType);
      String description = _getAnimalDescription(animalType);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Resultado de la Predicción'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  imagePath,
                  width: 200, // Ancho máximo de la imagen
                  height: 200, // Altura máxima de la imagen
                  fit: BoxFit.contain, // Ajusta la imagen dentro de los límites
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Tipo de Animal: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: data['tipo_de_animal'],
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Precisión de la Predicción: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: data['probabilidad'].toString(),
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Manejo de errores
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('No se pudo obtener la predicción.'),
            actions: <Widget>[
              TextButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  String _getRandomImagePath(String animalType) {
    final random = Random();
    List<String> images;

    switch (animalType) {
      case 'amphibian':
        images = [
          'assets/images/animales/amphibian/1.jpg',
          'assets/images/animales/amphibian/2.jpg',
          'assets/images/animales/amphibian/3.jpg',
          'assets/images/animales/amphibian/4.jpg',
          'assets/images/animales/amphibian/5.jpg',
        ];
        break;
      case 'bird':
        images = [
          'assets/images/animales/bird/1.jpg',
          'assets/images/animales/bird/2.jpg',
          'assets/images/animales/bird/3.jpg',
          'assets/images/animales/bird/4.jpg',
          'assets/images/animales/bird/5.jpg',
        ];
        break;
      case 'fish':
        images = [
          'assets/images/animales/fish/1.jpg',
          'assets/images/animales/fish/2.jpg',
          'assets/images/animales/fish/3.jpg',
          'assets/images/animales/fish/4.jpg',
          'assets/images/animales/fish/5.jpg',
        ];
        break;
      case 'insect':
        images = [
          'assets/images/animales/insect/1.jpg',
          'assets/images/animales/insect/2.jpg',
          'assets/images/animales/insect/3.jpg',
          'assets/images/animales/insect/4.jpg',
          'assets/images/animales/insect/5.jpg',
        ];
        break;
      case 'invertebrate':
        images = [
          'assets/images/animales/invertebrate/1.jpg',
          'assets/images/animales/invertebrate/2.jpg',
          'assets/images/animales/invertebrate/3.jpg',
          'assets/images/animales/invertebrate/4.jpg',
          'assets/images/animales/invertebrate/5.jpg',
        ];
        break;
      case 'mammal':
        images = [
          'assets/images/animales/mammal/1.jpg',
          'assets/images/animales/mammal/2.jpg',
          'assets/images/animales/mammal/3.jpg',
          'assets/images/animales/mammal/4.jpg',
          'assets/images/animales/mammal/5.jpg',
        ];
        break;
      case 'reptile':
        images = [
          'assets/images/animales/reptile/1.jpg',
          'assets/images/animales/reptile/2.jpg',
          'assets/images/animales/reptile/3.jpg',
          'assets/images/animales/reptile/4.jpg',
          'assets/images/animales/reptile/5.jpg',
        ];
        break;
      default:
        images = [
          'assets/images/icono.png',
          'assets/images/animals_17904093.png',
          'assets/images/machine-learning_18830559.png',
        ];
        break;
    }

    return images[random.nextInt(images.length)];
  }

  String _getAnimalDescription(String animalType) {
    switch (animalType) {
      case 'mammal':
        return 'Mamíferos: Tienen pelo, producen leche para alimentar a sus crías, poseen columna vertebral y son vivíparos. Respiran aire.';
      case 'fish':
        return 'Pez: Viven en el agua, tienen branquias para respirar y escamas en su cuerpo. Se reproducen mediante huevos.';
      case 'bird':
        return 'Pájaro: Tienen plumas, alas y pico. La mayoría pone huevos y es capaz de volar.';
      case 'invertebrate':
        return 'Invertebrado: No tienen columna vertebral y suelen tener cuerpos blandos o exoesqueletos. Son diversos en tamaños y formas.';
      case 'insect':
        return 'Insecto: Tienen seis patas, antenas y un exoesqueleto. Algunos tienen alas y son muy pequeños.';
      case 'amphibian':
        return 'Anfibio: Pasan por una metamorfosis de acuático a terrestre, tienen branquias en su fase juvenil y pulmones cuando adultos, y viven en ambientes húmedos.';
      case 'reptile':
        return 'Reptil: Son animales con escamas, de sangre fría, que ponen huevos y viven principalmente en tierra.';
      default:
        return 'Descripción no disponible.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildQuestionCard(
            '¿Tiene columna vertebral?',
            _vertebral,
            (bool? value) {
              setState(() {
                _vertebral = value!;
              });
            },
          ),
          buildQuestionCard(
            '¿Pone huevos?',
            _poneHuevos,
            (bool? value) {
              setState(() {
                _poneHuevos = value!;
              });
            },
          ),
          buildQuestionCard(
            '¿Tiene pelo?',
            _tienePelo,
            (bool? value) {
              setState(() {
                _tienePelo = value!;
              });
            },
          ),
          buildQuestionCard(
            '¿Respira aire?',
            _respiraAire,
            (bool? value) {
              setState(() {
                _respiraAire = value!;
              });
            },
          ),
          buildNumericQuestionCard(
            '¿Cuántas patas tiene?',
            _patas,
            (String value) {
              setState(() {
                _patas = int.tryParse(value) ?? 0;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showPrediction,
            child: Text('Mostrar Resultado'),
          ),
        ],
      ),
    );
  }

  Widget buildQuestionCard(
      String question, bool value, ValueChanged<bool?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    title: Text(
                      'Sí',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: value,
                    onChanged: onChanged,
                    activeColor: Colors.white,
                    checkColor: Colors.blue,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: !value,
                    onChanged: (bool? newValue) {
                      onChanged(!value);
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumericQuestionCard(
      String question, int value, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese el número de patas',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
