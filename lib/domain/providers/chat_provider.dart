import 'dart:convert';

import 'package:sigevappsoportefrontend/config/dependency_injection.dart';
import 'package:sigevappsoportefrontend/config/errors/exceptions.dart';
import 'package:sigevappsoportefrontend/core/constant/api_constants.dart';
import 'package:sigevappsoportefrontend/core/services/api_service.dart';
import 'package:sigevappsoportefrontend/core/utilities/utilities_headers.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';
import 'package:sigevappsoportefrontend/domain/repositories/chat_repository.dart';

class ChatProvider implements ChatRepository {
  final ApiService _apiService = getIt<ApiService>();

  @override
  Future<void> finalizarChat({required String pkChatBarraFija}) async {
    try {
      // final dynamic response = await _apiService.postRequest(
      // ApiConstants.finalizarChat,
      //   {'pkChatBarraFija': pkChatBarraFija},
      //   UtilitiesHeaders.getHeaderSinToken(),
      //   isChat: true,
      // );
    } on ApiClientException catch (exc) {
      throw exc.message.toString();
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<List<Mensaje>> obtenerMensajesChat({
    required String claveTramite,
  }) async {
    try {
      final dynamic response = await _apiService.getRequest(
        "${ApiConstants.obtenerMensajesChat}?claveTramite=$claveTramite",
        UtilitiesHeaders.getHeaderSinToken(),
        isChat: true,
      );
      var responseJSON = json.decode(response)["data"];
      if (responseJSON.isEmpty) return [];
      return mensajessFromJsonList(response["catCilindros"]);
    } on ApiClientException catch (exc) {
      throw exc.message.toString();
    } catch (exc) {
      rethrow;
    }
  }

  @override
  Future<List<Chat>> obtenerChats() async {
    try {
      final dynamic response = await _apiService.getRequest(
        ApiConstants.obtenerChats,
        UtilitiesHeaders.getHeaderSinToken(),
        isChat: true,
      );
      var responseJSON = json.decode(response)["data"];
      if (responseJSON.isEmpty) return [];
      return chatssFromJsonList(responseJSON);
    } on ApiClientException catch (exc) {
      throw exc.message.toString();
    } catch (exc) {
      rethrow;
    }
  }
}
