class ApiConstants {
  static String urlBase = "192.168.1.80:80";
  static String urlBaseChat = "192.168.1.80:3002";
  static String protocol = "http://";
  static String protocolChat = "http://";

  // static String urlBase = "my.grupogevhe.com";
  // static String urlBase = "office.grupogevhe.com";
  static String url = "/api/";

  /// [Endpoints]
  static const String loginEndpoint = 'login';
  static const String refreshTokenEndpoint = 'refreshToken';
  static const String getUserEndpoint = 'getUser';
  //CHAT
  static const String generarNuevoChat = "generarNuevoChat";
  static const String finalizarChat = "finalizarChat";
  static const String obtenerMensajesChat = "obtenerMensajesChat";
  static const String obtenerChat = "obtenerChat";
  static const String obtenerChats = "obtenerChats";
  static const String apiGetImages = 'mostrarArchivo';
}
