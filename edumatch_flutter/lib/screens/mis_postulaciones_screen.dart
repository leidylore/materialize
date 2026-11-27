import 'package:flutter/material.dart';

import '../state/postulaciones_store.dart';
import '../theme/app_theme.dart';

/// Funcionalidad 2: ver y cancelar las postulaciones del estudiante.
class MisPostulacionesScreen extends StatelessWidget {
  const MisPostulacionesScreen({super.key});

  String _fecha(DateTime d) => '${d.day}/${d.month}/${d.year}';

  Future<void> _confirmarCancelar(
    BuildContext context,
    Postulacion p,
  ) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancelar postulación'),
        content: Text(
          '¿Seguro que quieres cancelar tu postulación a '
          '"${p.oportunidad.titulo}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Sí, cancelar'),
          ),
        ],
      ),
    );

    if (ok == true) {
      PostulacionesStore.instance.cancelar(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis postulaciones')),
      body: ListenableBuilder(
        listenable: PostulacionesStore.instance,
        builder: (context, _) {
          final items = PostulacionesStore.instance.items;

          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inbox, size: 72, color: AppColors.textMuted),
                    SizedBox(height: 12),
                    Text(
                      'Aún no tienes postulaciones',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navy,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Explora las oportunidades y postúlate a la que más '
                      'te guste.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, i) {
              final p = items[i];
              return Card(
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: p.oportunidad.tipo.color,
                    child: Icon(
                      p.oportunidad.tipo.icono,
                      color: p.oportunidad.tipo.color == AppColors.gold
                          ? AppColors.navy
                          : AppColors.white,
                    ),
                  ),
                  title: Text(
                    p.oportunidad.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.navy,
                    ),
                  ),
                  subtitle: Text(
                    '${p.oportunidad.institucion}\n'
                    'Estado: ${p.estado.etiqueta} · ${_fecha(p.fecha)}',
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: 'Cancelar postulación',
                    onPressed: () => _confirmarCancelar(context, p),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
