import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';

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
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(context.spacing20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing16,
              vertical: context.spacing8,
            ),
            margin: EdgeInsets.only(
              right: context.spacing12,
              left: context.spacing40,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    mensaje.mensaje!,
                    style: context.bodyRegularInputStyle.copyWith(
                      color: AppTheme.neutralColorWhite,
                    ),
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
