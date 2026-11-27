import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Tipos de oportunidad (especialización de OPORTUNIDAD en el modelo de datos).
enum TipoOportunidad { beca, curso, intercambio }

extension TipoOportunidadX on TipoOportunidad {
  String get etiqueta {
    switch (this) {
      case TipoOportunidad.beca:
        return 'Beca';
      case TipoOportunidad.curso:
        return 'Curso';
      case TipoOportunidad.intercambio:
        return 'Intercambio';
    }
  }

  IconData get icono {
    switch (this) {
      case TipoOportunidad.beca:
        return Icons.school;
      case TipoOportunidad.curso:
        return Icons.menu_book;
      case TipoOportunidad.intercambio:
        return Icons.flight_takeoff;
    }
  }

  Color get color {
    switch (this) {
      case TipoOportunidad.beca:
        return AppColors.gold;
      case TipoOportunidad.curso:
        return AppColors.teal;
      case TipoOportunidad.intercambio:
        return AppColors.navy;
    }
  }
}

class Oportunidad {
  final String id;
  final TipoOportunidad tipo;
  final String titulo;
  final String institucion;
  final String descripcion;
  final String requisitos;
  final String fechaLimite;

  const Oportunidad({
    required this.id,
    required this.tipo,
    required this.titulo,
    required this.institucion,
    required this.descripcion,
    required this.requisitos,
    required this.fechaLimite,
  });
}
