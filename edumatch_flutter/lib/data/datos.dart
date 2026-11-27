import '../models/oportunidad.dart';

/// Datos de ejemplo de EduMatch (en la versión final vendrían de la base de datos).
const List<Oportunidad> oportunidades = [
  Oportunidad(
    id: 'b1',
    tipo: TipoOportunidad.beca,
    titulo: 'Beca Generación E',
    institucion: 'Ministerio de Educación',
    descripcion:
        'Apoyo económico para estudiantes de bajos recursos que quieren estudiar '
        'una carrera técnica, tecnológica o profesional.',
    requisitos: 'Ser colombiano, tener buen puntaje en pruebas Saber 11 y '
        'pertenecer a los niveles de Sisbén establecidos.',
    fechaLimite: '30/12/2026',
  ),
  Oportunidad(
    id: 'b2',
    tipo: TipoOportunidad.beca,
    titulo: 'Beca Mujeres en Tecnología',
    institucion: 'Fundación TechFuturo',
    descripcion:
        'Beca del 100% para mujeres que quieran formarse en programación, '
        'datos o ciberseguridad.',
    requisitos: 'Ser mujer mayor de 17 años, enviar carta de motivación y '
        'presentar una prueba lógica.',
    fechaLimite: '15/01/2027',
  ),
  Oportunidad(
    id: 'c1',
    tipo: TipoOportunidad.curso,
    titulo: 'Curso de Inglés Intensivo',
    institucion: 'SENA',
    descripcion:
        'Curso virtual para mejorar tu nivel de inglés con clases en vivo '
        'y práctica de conversación.',
    requisitos: 'Tener computador o celular con internet y disponibilidad '
        'de 6 horas semanales.',
    fechaLimite: '10/12/2026',
  ),
  Oportunidad(
    id: 'c2',
    tipo: TipoOportunidad.curso,
    titulo: 'Introducción a Flutter',
    institucion: 'Universidad del Valle',
    descripcion:
        'Aprende a construir aplicaciones móviles multiplataforma con Flutter '
        'y Dart desde cero.',
    requisitos: 'Conocimientos básicos de programación.',
    fechaLimite: '20/12/2026',
  ),
  Oportunidad(
    id: 'i1',
    tipo: TipoOportunidad.intercambio,
    titulo: 'Intercambio en España',
    institucion: 'Universidad de Salamanca',
    descripcion:
        'Un semestre de estudio en España con convenio para estudiantes '
        'universitarios y tecnólogos.',
    requisitos: 'Promedio mínimo de 4.0, nivel B1 de idioma y carta de '
        'recomendación de la institución.',
    fechaLimite: '28/02/2027',
  ),
  Oportunidad(
    id: 'i2',
    tipo: TipoOportunidad.intercambio,
    titulo: 'Intercambio en México',
    institucion: 'Tecnológico de Monterrey',
    descripcion:
        'Programa de movilidad académica de seis meses con apoyo para '
        'alojamiento.',
    requisitos: 'Estar matriculado, tener pasaporte vigente y '
        'aval académico.',
    fechaLimite: '31/03/2027',
  ),
];
