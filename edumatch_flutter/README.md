# EduMatch – App móvil en Flutter

Evidencia: **GA7-220501096-AA3-EV01 – Codificación de módulos del software stand-alone, web y móvil**
Aprendiz: Leidy Lorena Ramos Montano · SENA – Tecnólogo en Análisis y Desarrollo de Software

EduMatch es una app móvil que centraliza **becas, cursos y programas de intercambio** para estudiantes.
Esta entrega desarrolla la interfaz con **Flutter**.

## Pantallas

| Pantalla | Archivo | Descripción |
|---|---|---|
| Bienvenida | `lib/screens/welcome_screen.dart` | Logo, nombre del proyecto y botón "Comenzar" |
| Menú principal | `lib/screens/home_screen.dart` + `lib/widgets/app_drawer.dart` | Banner, opciones principales y menú lateral (Drawer) |
| **Funcionalidad 1:** Explorar oportunidades | `oportunidades_screen.dart`, `detalle_oportunidad_screen.dart` | Lista con filtro por tipo (beca / curso / intercambio), detalle y postulación con ventana modal |
| **Funcionalidad 2:** Mis postulaciones | `mis_postulaciones_screen.dart` | Lista de postulaciones con estado y cancelación (diálogo de confirmación) |
| Instituciones | `instituciones_screen.dart` | Lista de instituciones aliadas con diálogo de detalle |

## Elementos de Flutter usados

`MaterialApp`, `Scaffold`, `AppBar`, `Drawer`, `Column`, `Row`, `Stack`, `ListView`, `ListView.builder`,
`ListView.separated`, `ListTile`, `Card`, `Icon`, `Image.asset`, `ChoiceChip`, `showModalBottomSheet`,
`showDialog` (`AlertDialog`), `SnackBar`, `Navigator.push`.

## Paleta de colores (`lib/theme/app_theme.dart`)

Navy `#1B2A41` · Gold `#E0A526` · Teal `#1F8A8A` · Cream `#FAF3E3`

## Estructura

```
lib/
  main.dart
  theme/app_theme.dart
  models/oportunidad.dart
  data/datos.dart
  state/postulaciones_store.dart
  screens/...
  widgets/app_drawer.dart
assets/images/ (logo.png, banner.png)
```

## Cómo ejecutarlo

```bash
flutter pub get
flutter run
```

## Versionamiento

Proyecto versionado con Git y alojado en GitHub (ver `ENLACE_REPOSITORIO.txt`).
