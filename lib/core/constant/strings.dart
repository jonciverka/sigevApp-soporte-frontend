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
  };
}
