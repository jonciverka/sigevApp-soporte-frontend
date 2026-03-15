mixin AppLocale {
  static const String cargando = 'Cargando';

  //Mensajes
  static const String avisoSinInternet = 'avisoSinInternet';
  static const String error = 'error';
  static const String errorRecursoNoEncontrado = 'errorRecursoNoEncontrado';
  static const String errorInicioSesion = 'errorInicioSesion';
  static const String campoObligatorio = 'campoObligatorio';
  static const String camposObligatorios = 'camposObligatorios';
  static const String errorCorreoMalFormado = 'errorCorreoMalFormado';
  static const String errorNoCumpleConElMontoMinimoAnticipo =
      'errorNoCumpleConElMontoMinimoAnticipo';
  static const String buscar = 'buscar';
  static const String inputChat = 'inputChat';
  static const String infoCliente = 'infoCliente';
  static const String habilitarRecibirArchivos = 'habilitarRecibirArchivos';
  static const String finalizarSoporte = 'finalizarSoporte';
  static const String tituloFinalizarSoporte = 'tituloFinalizarSoporte';
  static const String descripcionFinalizarSoporte =
      'descripcionFinalizarSoporte';
  static const String botonFinalizarSoporte = 'botonFinalizarSoporte';
  static const String botonCancelarFinalizarSoporte =
      'botonCancelarFinalizarSoporte';
  static const String recibirArchivo = 'recibirArchivo';
  static const String tituloRecibirArchivo = 'tituloRecibirArchivo';
  static const String descripcionRecibirArchivo = 'descripcionRecibirArchivo';
  static const String botonRecibirArchivo = 'botonRecibirArchivo';
  static const String botonCancelarRecibirArchivo =
      'botonCancelarRecibirArchivo';
  static const String textoImagenSolicitud = 'textoImagenSolicitud';

  static const Map<String, dynamic> ES = {
    avisoSinInternet: 'No hay conexión a Internet.',
    errorRecursoNoEncontrado: "Recurso no encontrado",
    errorInicioSesion: "Usuario o contraseña incorrectos. Inténtalo de nuevo.",
    campoObligatorio: "Este campo es obligatorio.",
    camposObligatorios: "Parece que faltan algunos datos obligatorios.",
    errorCorreoMalFormado:
        "Ups, parece que tu correo no tiene el formato correcto. Revísalo por favor.",
    errorNoCumpleConElMontoMinimoAnticipo:
        "No cumple con el monto mínimo a cuenta",
    cargando: 'Cargando...',
    buscar: 'Buscar',
    inputChat: "Mensaje",
    infoCliente: "Info. cliente",
    habilitarRecibirArchivos: "Solicitud de imagenes",
    finalizarSoporte: "Finalizar soporte",
    tituloFinalizarSoporte: "¿Estas seguro de finalizar el soporte?",
    descripcionFinalizarSoporte:
        "Una vez que finalices no podrás deshacer esta acción",
    botonFinalizarSoporte: "Finalizar soporte",
    botonCancelarFinalizarSoporte: "Cancelar",
    recibirArchivo: "Recibir archivos",
    tituloRecibirArchivo: "¿Estas seguro de recibir archivos?",
    descripcionRecibirArchivo:
        "Una vez que lo pidas no podrás deshacer esta acción",
    botonRecibirArchivo: "Recibir archivos",
    botonCancelarRecibirArchivo: "Cancelar",
    textoImagenSolicitud: "Se ha solicitado envío de imagenes",
  };
}
