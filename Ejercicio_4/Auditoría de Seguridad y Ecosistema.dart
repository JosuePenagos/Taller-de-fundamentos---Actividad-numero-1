import 'package:flutter/material.dart';
void main() {
  // Lista de mapas: cada plataforma tiene bool esCerrado y bool tiendasTerceros
  List<Map<String, dynamic>> plataformas = [
    {
      'nombre':          'iOS (Apple)',
      'esCerrado':       true,
      'tiendasTerceros': false, 
    },
    {
      'nombre':          'Android (Google)',
      'esCerrado':       false,
      'tiendasTerceros': true, 
    },
    {
      'nombre':          'Android Enterprise (Samsung Knox)',
      'esCerrado':       true,  
      'tiendasTerceros': false,
    },
  ];

  // Lista donde guardaremos las plataformas aprobadas para empresa
  List<String> aprobadasParaEmpresa = [];

  // Función que analiza cada plataforma
  void auditarPlataforma(Map<String, dynamic> plataforma) {
    String nombre          = plataforma['nombre'];
    bool   esCerrado       = plataforma['esCerrado'];
    bool   tiendasTerceros = plataforma['tiendasTerceros'];

    print('$nombre');
    print('  ¿Sistema cerrado?       : $esCerrado');
    print('  ¿Permite tiendas 3ros?  : $tiendasTerceros');

    // Condicional: aprueba SOLO si es cerrada Y no tiene tiendas de terceros
    if (esCerrado && !tiendasTerceros) {
      aprobadasParaEmpresa.add(nombre);
      print('  APROBADA para entorno empresarial\n');
    } else {
      print('  NO APROBADA (riesgo de malware por sideloading)\n');
    }
  }

  print(' AUDITORÍA DE SEGURIDAD ENTERPRISE ');

  // Ciclo para analizar cada plataforma
  for (Map<String, dynamic> p in plataformas) {
    auditarPlataforma(p);
  }

  // Mostramos la lista final con forEach
  print(' PLATAFORMAS APROBADAS PARA EMPRESA ');
  if (aprobadasParaEmpresa.isEmpty) {
    print('Ninguna plataforma cumple los criterios.');
  } else {
    aprobadasParaEmpresa.forEach((plataforma) {
      print(' $plataforma');
    });
  }
}
