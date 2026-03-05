import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';

abstract class ChatRepository {
  Future<void> finalizarChat({required String pkChatBarraFija});
  Future<List<Mensaje>> obtenerMensajesChat({required String claveTramite});
  Future<List<Chat>> obtenerChats();
}
