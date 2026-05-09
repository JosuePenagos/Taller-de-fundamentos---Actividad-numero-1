void main() {

  // iOS 18 en 82% de todos los iPhones activos
  // Android 15 en ~28.5% de dispositivos Android
  List<Map<String, dynamic>> adopcionOS = [
    {'plataforma': 'iOS 18',      'porcentaje': 82.0},
    {'plataforma': 'Android 15',  'porcentaje': 28.5},
  ];

  // Umbral crítico: si una versión tiene menos del 50% de adopción,
  // el app con IA avanzada no llegaría a la mayoría de usuarios
  double umbralCritico = 50.0;

  // Mapa de estrategias para plataformas que no superan el umbral
  Map<String, String> estrategias = {};

  print(' ANÁLISIS DE ADOPCIÓN DE OS ');
  print('Umbral Crítico definido: $umbralCritico%\n');

  // Ciclo para evaluar cada versión
  for (Map<String, dynamic> os in adopcionOS) {
    String plataforma  = os['plataforma'];
    double porcentaje  = os['porcentaje'];

    print('$plataforma: $porcentaje% de adopción');

    // Condicional: si está POR DEBAJO del umbral  necesita estrategia
    if (porcentaje < umbralCritico) {
      estrategias[plataforma] = 'Estrategia de Retrocompatibilidad: '
          'Mantener soporte desde Android 12+, usar Feature Detection '
          '(if Platform.isAndroid) y degradación elegante de funciones IA.';
      print('  BAJO UMBRAL → Estrategia asignada.');
    } else {
      print('  SOBRE UMBRAL → Sin restricciones de lanzamiento.');
    }
  }

  // Mostramos las estrategias de retrocompatibilidad
  if (estrategias.isNotEmpty) {
    print(' ESTRATEGIAS DE RETROCOMPATIBILIDAD ');
    estrategias.forEach((plataforma, estrategia) {
      print('$plataforma:\n  $estrategia\n');
    });
  }
}
