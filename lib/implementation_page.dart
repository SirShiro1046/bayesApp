import 'package:flutter/material.dart';

class ImplementationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implementación'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Algoritmo de Bayes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'El algoritmo de Bayes, basado en el "Teorema de Bayes", es una herramienta fundamental en estadística y aprendizaje automático. Su enfoque permite realizar predicciones probabilísticas basadas en datos previos.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '¿Qué es el Teorema de Bayes?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'El Teorema de Bayes establece cómo actualizar nuestras creencias sobre un evento dado, teniendo en cuenta nueva información. Su fórmula es:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'P(A|B) = (P(B|A) × P(A)) / P(B)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'P(A|B): Probabilidad de que ocurra A dado que ha ocurrido B (probabilidad posterior).\n'
                'P(B|A): Probabilidad de que ocurra B dado que ha ocurrido A (verosimilitud).\n'
                'P(A): Probabilidad de que ocurra A (probabilidad previa).\n'
                'P(B): Probabilidad de que ocurra B (evidencia).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Aplicaciones del Algoritmo de Bayes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'El algoritmo de Bayes es ampliamente utilizado en diversas áreas, como:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Clasificación de correos: Para identificar correos como spam o no spam.\n'
                '• Medicina: Diagnóstico de enfermedades basándose en síntomas.\n'
                '• Reconocimiento de voz: Interpretación de comandos hablados.\n'
                '• Sistemas de recomendación: Sugerencias personalizadas de productos o servicios.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Ejemplo Práctico',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Supongamos que queremos saber la probabilidad de que un paciente tenga gripe (A) dado que tiene fiebre (B).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'La probabilidad de que una persona tenga gripe: P(A) = 0.1 (10%).\n'
                'La probabilidad de que alguien con gripe tenga fiebre: P(B|A) = 0.8 (80%).\n'
                'La probabilidad de fiebre en la población general: P(B) = 0.2 (20%).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Usando el Teorema de Bayes, calculamos:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'P(A|B) = (P(B|A) × P(A)) / P(B) = (0.8 × 0.1) / 0.2 = 0.4 (40%)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Por lo tanto, hay un 40% de probabilidad de que una persona con fiebre tenga gripe.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
