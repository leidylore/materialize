import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EduMatchApp());
}

/// Widget raíz de la aplicación: configura MaterialApp con el tema
/// (paleta de colores de EduMatch) y la pantalla inicial de bienvenida.
class EduMatchApp extends StatelessWidget {
  const EduMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduMatch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const WelcomeScreen(),
    );
  }
}
