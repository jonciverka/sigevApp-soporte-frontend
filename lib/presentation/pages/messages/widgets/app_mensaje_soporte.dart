import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_buttons.dart';

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
            TipoMensaje.opcion => AppMensajeSoporteOpcion(
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
            color: AppTheme.neutralColorWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing16,
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
                    child: Text(
                      mensaje.mensaje ?? '',
                      style: context.bodyRegularTextStyle,
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

class AppMensajeSoporteOpcion extends StatelessWidget {
  const AppMensajeSoporteOpcion({super.key, required this.mensaje, this.fecha});
  final Mensaje mensaje;
  final String? fecha;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.neutralColorWhite,
            borderRadius: BorderRadius.circular(15),
          ),

          margin: const EdgeInsets.only(right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPrimaryButton(
                label: mensaje.mensaje ?? '',
                onPressed: () => mensaje.onTap?.call(),
              ),
            ],
          ),
        );
      },
    );
  }
}
