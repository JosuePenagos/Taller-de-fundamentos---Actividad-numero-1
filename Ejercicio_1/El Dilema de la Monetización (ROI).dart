import 'package:flutter/material.dart';

void main() {
  
  
  // Lista de mapas: cada mapa es una plataforma con nombre y gasto mensual 
  //iOS $10.40/mes, Android $1.40/mes
  List<Map<String, dynamic>> plataformas = [
    {'nombre': 'iOS (App Store)',    'gastoMensual': 10.40, 'ingresos2025B': 142},
    {'nombre': 'Android (Play Store)', 'gastoMensual': 1.40, 'ingresos2025B': 65},
  ];

  // Mapa donde guardamos la recomendación final
  Map<String, String> recomendacionFinal = {};

  // Recorremos la lista con un ciclo for-in
  for (Map<String, dynamic> plataforma in plataformas) {
    String nombre     = plataforma['nombre'];
    double gasto      = plataforma['gastoMensual'];
    int    ingresos   = plataforma['ingresos2025B'];

    // Condicional: "Alta Rentabilidad" si gasto > $10
    String nivel;
    if (gasto > 10) {
      nivel = 'Alta Rentabilidad';
    } else {
      nivel = 'Rentabilidad Baja';
    }

    // Guardamos en el mapa de recomendación
    recomendacionFinal[nombre] =
        '$nivel | Gasto mensual: \$$gasto | Ingresos 2025: \$${ingresos}B';
  }

  // Mostramos el resultado
  print('RECOMENDACIÓN FINAL DE MONETIZACIÓN');
  recomendacionFinal.forEach((plataforma, detalle) {
    print('$plataforma → $detalle');
  });

  print('Conclusión: iOS supera el umbral de Alta Rentabilidad.');

}
