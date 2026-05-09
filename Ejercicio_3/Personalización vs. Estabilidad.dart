// Función que recibe el perfil del usuario y la lista de atributos
// Retorna la recomendación como String
String evaluarPerfil(
  Map<String, dynamic> perfilUsuario,
  List<String> atributosBuscados,
) {
  String nombreUsuario = perfilUsuario['nombre'];
  String tipoPerfil    = perfilUsuario['tipo'];     // 'Hardcore' o 'Ejecutivo'
  String prioridad     = perfilUsuario['prioridad']; // qué le importa más

  // Mapa de plataformas con sus atributos fuertes
  // libertad de personalización (root, launchers, sideloading)
  // iOS = estabilidad, sin lags ni crashes (ecosistema cerrado y controlado)
  Map<String, List<String>> atributosPorPlataforma = {
    'Android': ['Customización', 'Root', 'Sideloading', 'Launchers', 'Control total'],
    'iOS':     ['Estabilidad',   'Sin crashes', 'Optimización', 'Seguridad', 'Ecosistema integrado'],
  };

  String plataformaRecomendada = '';
  List<String> matchesEncontrados = [];

  // Ciclo externo: revisamos cada plataforma
  for (String plataforma in atributosPorPlataforma.keys) {
    List<String> atributosDisponibles = atributosPorPlataforma[plataforma]!;

    // Ciclo interno: comparamos cada atributo buscado
    for (String atributo in atributosBuscados) {
      // Condicional: ¿este atributo está en la plataforma actual?
      if (atributosDisponibles.contains(atributo)) {
        matchesEncontrados.add('$atributo → $plataforma ');

        // Asignamos la plataforma al primer match significativo
        if (plataformaRecomendada.isEmpty) {
          plataformaRecomendada = plataforma;
        }
      }
    }
  }

  // Construimos el reporte
  String reporte = '''
RECOMENDACIÓN PARA: $nombreUsuario ($tipoPerfil) ===
Prioridades buscadas : $prioridad
Atributos evaluados : ${atributosBuscados.join(', ')}
Plataforma ideal    : $plataformaRecomendada

Matches encontrados:
${matchesEncontrados.join('\n')}
  ''';

  return reporte;
}

void main() {
  // Mapa de perfiles de usuario
  Map<String, dynamic> usuarioHardcore = {
    'nombre':    'Carlos (Hardcore)',
    'tipo':      'Hardcore',
    'prioridad': 'Control total del sistema operativo',
  };

  Map<String, dynamic> usuarioEjecutivo = {
    'nombre':    'Laura (Ejecutivo)',
    'tipo':      'Ejecutivo',
    'prioridad': 'Cero fallos en reuniones y presentaciones',
  };

  // Lista de atributos que busca cada perfil
  List<String> atributosHardcore   = ['Root', 'Sideloading', 'Customización'];
  List<String> atributosEjecutivo  = ['Estabilidad', 'Sin crashes', 'Seguridad'];

  // Llamamos a la función para cada perfil
  print(evaluarPerfil(usuarioHardcore,  atributosHardcore));
  print(evaluarPerfil(usuarioEjecutivo, atributosEjecutivo));
}

