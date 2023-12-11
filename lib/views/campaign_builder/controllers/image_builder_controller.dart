part of '../index.dart';

class ImageBuilderController {
  static final client = UnsplashClient(
    settings: const ClientSettings(
        credentials: AppCredentials(
      accessKey: AppConfig.unsplashAccessKey,
      secretKey: AppConfig.unsplashSecretKey,
    )),
  );
}
