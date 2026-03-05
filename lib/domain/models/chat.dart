import 'package:intl/intl.dart';

Chat chatsFromJsonMap(Map<String, dynamic> json) => Chat.fromJson(json);
List<Chat> chatssFromJsonList(List<dynamic> jsonList) =>
    jsonList.map((json) => Chat.fromJson(json)).toList();

class Chat {
  String? idChat;
  String? claveTramite;
  String? nombreCliente;
  String? apellidoCliente;
  String? idTramite;
  DateTime? fechachat;
  Chat({
    this.idChat,
    this.claveTramite,
    this.nombreCliente,
    this.apellidoCliente,
    this.idTramite,
    this.fechachat,
  });
  Chat.fromJson(Map json) {
    DateTime dateTime = DateTime.now();
    idChat = json['PK_CHAT'];
    claveTramite = json['CLAVE_TRAMITE'];
    nombreCliente = json['NOMBRE_CLIENTE'];
    apellidoCliente = json['APELLIDO_CLIENTE'];
    idTramite = json['ID_TRAMITE'];
    fechachat = DateFormat(
      "yyyy-MM-ddTHH:mm:ss",
    ).parse(json['FECHA_REGISTRO']).add(dateTime.timeZoneOffset);
  }
}
