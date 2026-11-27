import 'package:flutter/material.dart';

import '../screens/instituciones_screen.dart';
import '../screens/mis_postulaciones_screen.dart';
import '../screens/oportunidades_screen.dart';
import '../theme/app_theme.dart';

/// Muestra la ventana modal "Acerca de EduMatch".
void mostrarAcercaDe(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.info_outline, color: AppColors.teal, size: 36),
      title: const Text('Acerca de EduMatch'),
      content: const Text(
        'EduMatch es una app móvil que centraliza becas, cursos, programas '
        'de intercambio e instituciones para estudiantes.\n\n'
        'Versión 1.0.0\nSENA - Tecnólogo en Análisis y Desarrollo de Software',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Cerrar'),
        ),
      ],
    ),
  );
}

/// Menú lateral con las opciones principales de la aplicación.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _ir(BuildContext context, Widget pantalla) {
    Navigator.of(context).pop(); // cierra el drawer
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColors.navy),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.school, color: AppColors.gold, size: 40),
                SizedBox(height: 8),
                Text(
                  'EduMatch',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Menú principal',
                  style: TextStyle(color: AppColors.cream),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: AppColors.teal),
            title: const Text('Explorar oportunidades'),
            onTap: () => _ir(context, const OportunidadesScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.assignment_turned_in,
                color: AppColors.teal),
            title: const Text('Mis postulaciones'),
            onTap: () => _ir(context, const MisPostulacionesScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance, color: AppColors.teal),
            title: const Text('Instituciones'),
            onTap: () => _ir(context, const InstitucionesScreen()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.teal),
            title: const Text('Acerca de'),
            onTap: () {
              Navigator.of(context).pop();
              mostrarAcercaDe(context);
            },
          ),
        ],
      ),
    );
  }
}
