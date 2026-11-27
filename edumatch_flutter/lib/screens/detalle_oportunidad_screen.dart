import 'package:flutter/material.dart';

import '../models/oportunidad.dart';
import '../state/postulaciones_store.dart';
import '../theme/app_theme.dart';

/// Detalle de una oportunidad con el botón para postularse (ventana modal).
class DetalleOportunidadScreen extends StatelessWidget {
  final Oportunidad oportunidad;

  const DetalleOportunidadScreen({super.key, required this.oportunidad});

  Future<void> _confirmarPostulacion(BuildContext context) async {
    final confirmado = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: AppColors.cream,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirmar postulación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '¿Quieres postularte a "${oportunidad.titulo}" de '
              '${oportunidad.institucion}?',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    child: const Text('Postularme'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    if (confirmado == true && context.mounted) {
      PostulacionesStore.instance.postular(oportunidad);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.teal,
          content: Text('¡Postulación enviada con éxito!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final o = oportunidad;

    return Scaffold(
      appBar: AppBar(title: Text(o.tipo.etiqueta)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: o.tipo.color,
              child: Icon(
                o.tipo.icono,
                size: 40,
                color: o.tipo.color == AppColors.gold
                    ? AppColors.navy
                    : AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            o.titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            o.institucion,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 16),
          ),
          const SizedBox(height: 20),
          _Seccion(
            icono: Icons.description,
            titulo: 'Descripción',
            texto: o.descripcion,
          ),
          _Seccion(
            icono: Icons.checklist,
            titulo: 'Requisitos',
            texto: o.requisitos,
          ),
          _Seccion(
            icono: Icons.event,
            titulo: 'Fecha límite',
            texto: o.fechaLimite,
          ),
          const SizedBox(height: 12),
          ListenableBuilder(
            listenable: PostulacionesStore.instance,
            builder: (context, _) {
              final yaPostulado = PostulacionesStore.instance.yaPostulado(o.id);
              return ElevatedButton.icon(
                onPressed:
                    yaPostulado ? null : () => _confirmarPostulacion(context),
                icon: Icon(yaPostulado ? Icons.check : Icons.send),
                label: Text(yaPostulado ? 'Ya te postulaste' : 'Postularme'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Seccion extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String texto;

  const _Seccion({
    required this.icono,
    required this.titulo,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icono, color: AppColors.teal),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.navy,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(texto),
        ),
      ),
    );
  }
}
