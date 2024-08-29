import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:test_project/core/config/constants/api_urls.dart';
import 'package:test_project/core/controllers/network_controller.dart';
=======

import 'package:started_app/core/config/constants/api_urls.dart';
<<<<<<< HEAD
import 'package:started_app/core/controllers/network_controller.dart';
>>>>>>> Updated
=======
import 'package:started_app/core/services/network/network_service.dart';
>>>>>>> Updated
import 'package:vexana/vexana.dart';

abstract class BaseNetwork<T extends INetworkModel<T>> {
  BaseNetwork({
    required this.baseUrl,
    bool isEnableLogger = false,
  }) {
    networkManager = NetworkManager<T>(
      isEnableLogger: isEnableLogger,
      isEnableTest: true,
      interceptor: InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == null &&
              await networkController.isConnected() == false) {
            // Get.snackbar('Hata', 'İnternet yok');
          }
          handler.next(error);
        },
      ),
      options: BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Durations.extralong1,
      ),
    );
  }
  final networkController = NetworkController();

  final String baseUrl;
  late final INetworkManager<T> networkManager;
}

class NetworkService<T extends INetworkModel<T>> extends BaseNetwork<T> {
  NetworkService({
    super.baseUrl = ApiUrls.baseUrl,
    super.isEnableLogger,
  });

  Future<T?> fetchData(String endpoint, T parseModel) async {
    final response = await networkManager.send<T, T>(
      endpoint,
      parseModel: parseModel,
      method: RequestType.GET,
    );

    if (response.data != null) {
      return response.data!;
    }
    return null;
  }

  Future<T?> postData(String endpoint, T model) async {
    final response = await networkManager.send<T, T>(
      endpoint,
      parseModel: model,
      method: RequestType.POST,
      data: model.toJson(),
    );
    if (response.data != null) {
      return response.data!;
    }
    return null;
  }
}
