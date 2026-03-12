// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/errors/exceptions.dart';
import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:sigevappsoportefrontend/core/constant/api_constants.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';
import 'package:sigevappsoportefrontend/domain/providers/chat_provider.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/messages_state.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_modal_pregunta.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_toast_notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class MessageCubit extends Cubit<MessageState> {
  final provider = ChatProvider();
  final TextEditingController _textController = TextEditingController();
  TextEditingController get chatText => _textController;
  final BuildContext _context;
  late io.Socket socket;
  HomeCubit homeCubit;
  TextEditingController controller = TextEditingController();
  MessageCubit({required BuildContext context, required this.homeCubit})
    : _context = context,
      super(MessageInitial()) {
    _handleInitialState();
  }
  void _handleInitialState() {
    homeCubit.stream.listen((onData) {
      if (onData.chat.claveTramite == null) {
        emit(MessageInitial());
      } else {
        _obtenerMensajes();
      }
    });
  }

  Future<void> contactarSocket() async {
    socket = io.io(
      '${ApiConstants.protocol}${ApiConstants.urlBaseChat}',
      io.OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.connect();
  }

  Future<void> unirseASocket() async {
    socket.on('chat message gpt', recibirMensajeSocket);
    socket.emit('join', {
      "claveTramite": homeCubit.state.chat.claveTramite ?? '',
      "pkUsuario": globals.user?.id ?? '',
    });
  }

  Future<void> mandarMensaje() async {
    String mensaje = _textController.text;
    _textController.text = '';
    _textController.clear();
    var mensajeEnviado = Mensaje.mensajeLocal({
      "MENSAJE": mensaje,
      "FECHA_REGISTRO": DateTime.now(),
      "TIPO_MENSAJE": TipoMensaje.texto,
      "PK_USUARIO": globals.user?.id ?? '',
    });
    emit(MessageData(chats: [...state.chats, mensajeEnviado]));

    //CHAT GPT
    //claveTramite, mensaje, pkUsuario, tipoMensaje
    socket.emit('chat message gpt', [
      homeCubit.state.chat.claveTramite ?? '',
      mensaje,
      "${globals.user?.id ?? ''}",
      TipoMensaje.texto.value,
      homeCubit.state.chat.idContribuyente ?? '',
    ]);
  }

  Future<void> _mandarMensajeImagen() async {
    String mensaje = _textController.text;
    _textController.text = '';
    _textController.clear();
    var mensajeEnviado = Mensaje.mensajeLocal({
      "MENSAJE": '',
      "FECHA_REGISTRO": DateTime.now(),
      "TIPO_MENSAJE": TipoMensaje.imagen,
      "PK_USUARIO": globals.user?.id ?? '',
    });
    emit(MessageData(chats: [...state.chats, mensajeEnviado]));

    //CHAT GPT
    //claveTramite, mensaje, pkUsuario, tipoMensaje
    socket.emit('chat message gpt', [
      homeCubit.state.chat.claveTramite ?? '',
      mensaje,
      "${globals.user?.id ?? ''}",
      TipoMensaje.imagen.value,
      homeCubit.state.chat.idContribuyente ?? '',
    ]);
  }

  void _obtenerMensajes() async {
    try {
      List<Mensaje> mensajes = await provider.obtenerMensajesChat(
        claveTramite: homeCubit.state.chat.claveTramite ?? '',
      );
      emit(MessageData(chats: mensajes));
      await cerrarSocket();
      await contactarSocket();
      await unirseASocket();
    } on ServerErrorException {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } on NetworkException {
      showToastNotification(
        context: _context,
        message: AppLocale.avisoSinInternet.getString(_context),
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } on ApiClientException catch (e) {
      showToastNotification(
        context: _context,
        message: e.message,
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } catch (e) {
      showToastNotification(
        context: _context,
        message: e.toString(),
        type: ToastType.error,
      );

      emit(MessageError());
      return;
    }
  }

  Future<void> openModalFinalizarChat() async {
    await showAppModalPregunta(
      context: _context,
      title: AppLocale.finalizarSoporte.getString(_context),
      question: AppLocale.tituloFinalizarSoporte.getString(_context),
      yes: AppLocale.botonFinalizarSoporte.getString(_context),
      no: AppLocale.botonCancelarFinalizarSoporte.getString(_context),
      onYes: () => _finalizarChat(),
    );
  }

  Future<void> openModalMandarMensajeImagen() async {
    await showAppModalPregunta(
      context: _context,
      title: AppLocale.recibirArchivo.getString(_context),
      question: AppLocale.tituloRecibirArchivo.getString(_context),
      yes: AppLocale.botonRecibirArchivo.getString(_context),
      no: AppLocale.botonCancelarRecibirArchivo.getString(_context),
      onYes: () => _mandarMensajeImagen(),
    );
  }

  void _finalizarChat() async {
    try {
      await provider.finalizarChat(
        pkChatBarraFija: homeCubit.state.chat.idChat.toString(),
      );
      await cerrarSocket();
      homeCubit.cleanChat();
    } on ServerErrorException {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } on NetworkException {
      showToastNotification(
        context: _context,
        message: AppLocale.avisoSinInternet.getString(_context),
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } on ApiClientException catch (e) {
      showToastNotification(
        context: _context,
        message: e.message,
        type: ToastType.error,
      );
      emit(MessageError());
      return;
    } catch (e) {
      showToastNotification(
        context: _context,
        message: e.toString(),
        type: ToastType.error,
      );

      emit(MessageError());
      return;
    }
  }

  //SOCKET
  void recibirMensajeSocket(mensajeString) {
    var mensaje = Mensaje.fromJson(mensajeString["data"]);
    emit(MessageData(chats: [...state.chats, mensaje]));
  }

  Future<void> cerrarSocket() async {
    try {
      socket.emit('leave', {
        "claveTramite": homeCubit.state.chat.claveTramite ?? '',
        "pkUsuario": globals.user?.id ?? '',
      });
      socket.off(
        'chat message gpt',
        recibirMensajeSocket,
      ); // 🔑 liberar el listener
    } catch (e) {}
  }
}
