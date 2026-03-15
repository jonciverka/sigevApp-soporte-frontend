import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/messages_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/widgets/app_input_chat.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/widgets/app_mensaje_soporte.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/widgets/app_mensaje_cliente.dart';

class AppChatsBody extends StatelessWidget {
  const AppChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MessageCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                ...cubit.state.chats.map((mensaje) {
                  if (mensaje.pkUsuario == globals.user?.id) {
                    return AppMensajeSoporte(mensaje: mensaje);
                  }
                  return AppMensajeCliente(mensaje: mensaje);
                }),
              ],
            ),
          ),
        ),
        SizedBox(height: context.spacing16),
        AppInputChat(
          onSubmit: () => cubit.mandarMensaje(),
          textController: cubit.chatText,
        ),
      ],
    );
  }
}
