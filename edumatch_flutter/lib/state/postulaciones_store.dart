import 'package:flutter/foundation.dart';

import '../models/oportunidad.dart';

enum EstadoPostulacion { enviada, enRevision, aceptada, rechazada }

extension EstadoPostulacionX on EstadoPostulacion {
  String get etiqueta {
    switch (this) {
      case EstadoPostulacion.enviada:
        return 'Enviada';
      case EstadoPostulacion.enRevision:
        return 'En revisión';
      case EstadoPostulacion.aceptada:
        return 'Aceptada';
      case EstadoPostulacion.rechazada:
        return 'Rechazada';
    }
  }
}

class Postulacion {
  final Oportunidad oportunidad;
  final DateTime fecha;
  EstadoPostulacion estado;

  Postulacion({
    required this.oportunidad,
    required this.fecha,
    this.estado = EstadoPostulacion.enviada,
  });
}

/// Guarda en memoria las postulaciones del estudiante.
/// Avisa a las pantallas cuando cambia (ChangeNotifier).
class PostulacionesStore extends ChangeNotifier {
  PostulacionesStore._();

  static final PostulacionesStore instance = PostulacionesStore._();

  final List<Postulacion> _items = [];

  List<Postulacion> get items => List.unmodifiable(_items);

  bool yaPostulado(String idOportunidad) =>
      _items.any((p) => p.oportunidad.id == idOportunidad);

  void postular(Oportunidad oportunidad) {
    if (yaPostulado(oportunidad.id)) return;
    _items.add(Postulacion(oportunidad: oportunidad, fecha: DateTime.now()));
    notifyListeners();
  }

  void cancelar(Postulacion postulacion) {
    _items.remove(postulacion);
    notifyListeners();
  }
}
