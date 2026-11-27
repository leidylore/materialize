import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/app_theme.dart';

/// Lista de instituciones aliadas (se obtienen de las oportunidades).
class InstitucionesScreen extends StatelessWidget {
  const InstitucionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = oportunidades.map((o) => o.institucion).toSet().toList()
      ..sort();

    return Scaffold(
      appBar: AppBar(title: const Text('Instituciones')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: nombres.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final nombre = nombres[i];
          final ofertas =
              oportunidades.where((o) => o.institucion == nombre).toList();
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.navy,
              child: Icon(Icons.account_balance, color: AppColors.gold),
            ),
            title: Text(
              nombre,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
            ),
            subtitle: Text(
              '${ofertas.length} oportunidad(es) disponible(s)',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(nombre),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final o in ofertas)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Icon(o.tipo.icono,
                                  size: 18, color: AppColors.teal),
                              const SizedBox(width: 8),
                              Expanded(child: Text(o.titulo)),
                            ],
                          ),
                        ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
