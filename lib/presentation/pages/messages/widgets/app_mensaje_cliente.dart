import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/utilities/utilities.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/messages_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/screens/preview_images_page.dart';

class AppMensajeCliente extends StatelessWidget {
  const AppMensajeCliente({super.key, required this.mensaje, this.fecha});
  final Mensaje mensaje;
  final String? fecha;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3, right: 0, left: 0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          switch (mensaje.tipoMensaje) {
            TipoMensaje.texto => AppMensajeSoporteTexto(
              mensaje: mensaje,
              fecha: fecha,
            ),

            TipoMensaje.imagen => AppMensajeSoporteImagen(
              mensaje: mensaje,
              fecha: fecha,
            ),
            _ => AppMensajeSoporteTexto(mensaje: mensaje, fecha: fecha),
          },
        ],
      ),
    );
  }
}

class AppMensajeSoporteTexto extends StatelessWidget {
  const AppMensajeSoporteTexto({super.key, required this.mensaje, this.fecha});
  final Mensaje mensaje;
  final String? fecha;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryColorChat,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(context.spacing12),
              topLeft: Radius.circular(context.spacing12),
              topRight: Radius.circular(context.spacing12),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing12,
            vertical: context.spacing8,
          ),
          margin: EdgeInsets.only(right: 40, top: context.spacing8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.start,
                mensaje.mensaje ?? '',
                style: context.bodyRegularTextStyle,
              ),
              SizedBox(height: context.spacing4),
              Text(
                Utilities().obtenerHora(
                  mensaje.fechaRegistro ?? DateTime.now(),
                ),
                style: context.captionRegularTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppMensajeSoporteImagen extends StatelessWidget {
  const AppMensajeSoporteImagen({super.key, required this.mensaje, this.fecha});
  final Mensaje mensaje;
  final String? fecha;
  @override
  Widget build(BuildContext context) {
    MessageCubit cubit = context.read<MessageCubit>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.neutralColorWhite,
            borderRadius: BorderRadius.circular(context.spacing20),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing8,
            vertical: context.spacing8,
          ),
          margin: const EdgeInsets.only(top: 3, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FotoViewer(
                              initialIndex: 0,
                              fotos: cubit.state.chats
                                  .where(
                                    (e) => e.tipoMensaje == TipoMensaje.imagen,
                                  )
                                  .map((e) => e.urlImage!)
                                  .toList(),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(context.spacing24),
                        child: Image.network(
                          mensaje.urlImage ?? '',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
