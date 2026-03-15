import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/core/utilities/utilities.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';

class AppMensajeSoporte extends StatelessWidget {
  const AppMensajeSoporte({super.key, required this.mensaje, this.fecha});
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
    return Container(
      margin: const EdgeInsets.only(top: 3, right: 0, left: 0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColorDisabledAndChat,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.spacing12),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(context.spacing12),
                topRight: Radius.circular(context.spacing12),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing12,
              vertical: context.spacing8,
            ),
            margin: EdgeInsets.only(
              right: context.spacing12,
              left: context.spacing40,
              top: context.spacing8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      switch (mensaje.tipoMensaje) {
                        TipoMensaje.texto => Text(
                          mensaje.mensaje!,
                          style: context.bodyRegularInputStyle,
                        ),
                        TipoMensaje.imagen => Text(
                          AppLocale.textoImagenSolicitud.getString(context),
                          style: context.bodyRegularInputStyle,
                        ),
                        _ => Text(
                          mensaje.mensaje!,
                          style: context.bodyRegularInputStyle,
                        ),
                      },
                      SizedBox(height: context.spacing4),
                      Text(
                        Utilities().obtenerHora(
                          mensaje.fechaRegistro ?? DateTime.now(),
                        ),
                        style: context.captionRegularTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppMensajeSoporteImagen extends StatelessWidget {
  const AppMensajeSoporteImagen({super.key, required this.mensaje, this.fecha});
  final Mensaje mensaje;
  final String? fecha;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: context.spacing12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Utilities().obtenerHora(mensaje.fechaRegistro ?? DateTime.now()),
            style: context.captionRegularTextStyle,
          ),
          SizedBox(height: context.spacing4),
          Text(
            AppLocale.textoImagenSolicitud.getString(context),
            style: context.captionRegularTextStyle,
          ),
        ],
      ),
    );
  }
}
