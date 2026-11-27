import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../models/oportunidad.dart';
import '../state/postulaciones_store.dart';
import '../theme/app_theme.dart';
import 'detalle_oportunidad_screen.dart';

/// Funcionalidad 1: explorar oportunidades (lista con filtro por tipo).
class OportunidadesScreen extends StatefulWidget {
  const OportunidadesScreen({super.key});

  @override
  State<OportunidadesScreen> createState() => _OportunidadesScreenState();
}

class _OportunidadesScreenState extends State<OportunidadesScreen> {
  TipoOportunidad? _filtro; // null = todas

  @override
  Widget build(BuildContext context) {
    final lista = _filtro == null
        ? oportunidades
        : oportunidades.where((o) => o.tipo == _filtro).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Oportunidades')),
      body: Column(
        children: [
          // Filtros
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Todas'),
                  selected: _filtro == null,
                  onSelected: (_) => setState(() => _filtro = null),
                ),
                for (final tipo in TipoOportunidad.values) ...[
                  const SizedBox(width: 8),
                  ChoiceChip(
                    avatar: Icon(tipo.icono, size: 18),
                    label: Text(tipo.etiqueta),
                    selected: _filtro == tipo,
                    onSelected: (_) => setState(() => _filtro = tipo),
                  ),
                ],
              ],
            ),
          ),
          // Lista
          Expanded(
            child: ListenableBuilder(
              listenable: PostulacionesStore.instance,
              builder: (context, _) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    final o = lista[i];
                    final postulado =
                        PostulacionesStore.instance.yaPostulado(o.id);
                    return Card(
                      color: AppColors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          backgroundColor: o.tipo.color,
                          child: Icon(
                            o.tipo.icono,
                            color: o.tipo.color == AppColors.gold
                                ? AppColors.navy
                                : AppColors.white,
                          ),
                        ),
                        title: Text(
                          o.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.navy,
                          ),
                        ),
                        subtitle: Text(
                          '${o.tipo.etiqueta} · ${o.institucion}\n'
                          'Cierra: ${o.fechaLimite}',
                        ),
                        isThreeLine: true,
                        trailing: postulado
                            ? const Icon(Icons.check_circle,
                                color: AppColors.teal)
                            : const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetalleOportunidadScreen(oportunidad: o),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
