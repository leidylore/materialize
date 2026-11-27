import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_drawer.dart';
import 'instituciones_screen.dart';
import 'mis_postulaciones_screen.dart';
import 'oportunidades_screen.dart';

/// Menú principal: acceso a las funcionalidades de la aplicación.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _abrir(BuildContext context, Widget pantalla) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduMatch'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Acerca de',
            onPressed: () => mostrarAcercaDe(context),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Banner con imagen
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/banner.png', fit: BoxFit.cover),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      '¡Hola! ¿Qué quieres hacer hoy?',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Opciones del menú
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _OpcionMenu(
                  icono: Icons.search,
                  color: AppColors.gold,
                  titulo: 'Explorar oportunidades',
                  subtitulo: 'Becas, cursos e intercambios disponibles',
                  onTap: () => _abrir(context, const OportunidadesScreen()),
                ),
                _OpcionMenu(
                  icono: Icons.assignment_turned_in,
                  color: AppColors.teal,
                  titulo: 'Mis postulaciones',
                  subtitulo: 'Consulta el estado de tus postulaciones',
                  onTap: () => _abrir(context, const MisPostulacionesScreen()),
                ),
                _OpcionMenu(
                  icono: Icons.account_balance,
                  color: AppColors.navy,
                  titulo: 'Instituciones',
                  subtitulo: 'Universidades y entidades aliadas',
                  onTap: () => _abrir(context, const InstitucionesScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OpcionMenu extends StatelessWidget {
  final IconData icono;
  final Color color;
  final String titulo;
  final String subtitulo;
  final VoidCallback onTap;

  const _OpcionMenu({
    required this.icono,
    required this.color,
    required this.titulo,
    required this.subtitulo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 26,
          child: Icon(
            icono,
            color: color == AppColors.gold ? AppColors.navy : AppColors.white,
          ),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.navy,
          ),
        ),
        subtitle: Text(subtitulo),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
