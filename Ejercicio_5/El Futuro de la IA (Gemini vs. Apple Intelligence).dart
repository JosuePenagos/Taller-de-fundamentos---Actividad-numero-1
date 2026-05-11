import 'package:flutter/material.dart';
// Retorna un String con el análisis completo
String generarReporteIA(
  List<String> capacidadesDeseadas,
  Map<String, List<String>> capacidadesPorAsistente,
) {
  //guardamos el resultado por asistente
  Map<String, Map<String, dynamic>> resultados = {};

  // Ciclo : recorremos cada asistente (Gemini, Siri)
  for (String asistente in capacidadesPorAsistente.keys) {
    List<String> capacidades = capacidadesPorAsistente[asistente]!;
    List<String> soportadas     = [];
    List<String> noSoportadas   = [];

    // Ciclo interno: verificamos cada capacidad deseada
    for (String capacidad in capacidadesDeseadas) {
      // condicional verifica si la capacidad existe en este asistente
      if (capacidades.contains(capacidad)) {
        soportadas.add(capacidad);
      } else {
        noSoportadas.add(capacidad);
      }
    }

    // Calculamos porcentaje de cobertura
    double cobertura = (soportadas.length / capacidadesDeseadas.length) * 100;

    resultados[asistente] = {
      'soportadas':   soportadas,
      'noSoportadas': noSoportadas,
      'cobertura':    cobertura.toStringAsFixed(1),
    };
  }

  // confirmamos el ganador
  String ganador = '';
  double maxCobertura = 0;
  resultados.forEach((asistente, datos) {
    double cobertura = double.parse(datos['cobertura']);
    if (cobertura > maxCobertura) {
      maxCobertura = cobertura;
      ganador = asistente;
    }
  });

  // respuesta final
  StringBuffer reporte = StringBuffer();
  reporte.writeln('COMPARATIVO DE IA MÓVIL 2025 ');
  reporte.writeln('Capacidades evaluadas: ${capacidadesDeseadas.join(', ')}\n');

  resultados.forEach((asistente, datos) {
    reporte.writeln(' $asistente ');
    reporte.writeln('Cobertura    : ${datos['cobertura']}%');
    reporte.writeln('Soporta   : ${(datos['soportadas'] as List).join(', ')}');
    reporte.writeln('No soporta: ${(datos['noSoportadas'] as List).join(', ')}');
    reporte.writeln('');
  });

  reporte.writeln('Asistente más versátil: $ganador ($maxCobertura% de cobertura)');
  reporte.writeln('Nota: Gemini lidera en capacidades multimodales y nube.');
  reporte.writeln('Siri/Apple Intelligence destaca en privacidad on-device.');

  return reporte.toString();
}

void main() {
  // Lista de capacidades que el desarrollador quiere en 2026
  List<String> capacidadesDeseadas = [
    'Traducción en vivo',
    'Generación de contenido',
    'Resumen de web',
    'Análisis de imágenes',
    'Integración con apps del sistema',
    'Procesamiento on-device',
  ];

  // Mapa que asocia cada asistente con sus capacidades reales (fuentes 2025)
  Map<String, List<String>> capacidadesPorAsistente = {
    'Google Gemini (Android)': [
      'Traducción en vivo',
      'Generación de contenido',
      'Resumen de web',
      'Análisis de imágenes',
      'Integración con apps del sistema',
    ],
    'Siri / Apple Intelligence (iOS)': [
      'Generación de contenido',     
      'Análisis de imágenes',        
      'Integración con apps del sistema',
      'Procesamiento on-device',      
    ],
  };

  // hacemos el reporte y lo imprimimos
  String reporte = generarReporteIA(capacidadesDeseadas, capacidadesPorAsistente);
  print(reporte);
}
