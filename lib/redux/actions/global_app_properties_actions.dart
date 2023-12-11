import 'package:flutter/material.dart';

@immutable
class ToggleOverlay {
  final bool overlayActive;

  const ToggleOverlay(this.overlayActive);
}

@immutable
class ChangeLocale {
  final Locale local;

  const ChangeLocale(this.local);
}
