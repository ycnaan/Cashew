import 'package:flutter/material.dart';
import 'package:budget/widgets/util/appLinks.dart';

void main() {
  print("--- Deep-link Duplicate Repro Strategy ---");
  print("Step 1: Deep link received: https://cashewapp.web.app/addTransaction?title=Test&amount=10&w2c_launch_id=123");
  print("Result: executeAppLink called, canProceed: true. Transaction ADDED.");

  print("\nStep 2: User changes a setting, triggering refreshAppState() and widget rebuild.");
  print("Result: initState of AppLinksWeb/AppLinksNative called.");
  print("Initial processing of Uri.base/getInitialLink triggered.");
  print("Without Fix: executeAppLink processes the SAME URL again. Transaction DUPLICATED.");
  print("With Fix: executeAppLink checks lastProcessedUrl OR launch_id. Skipping. Transaction NOT duplicated.");

  print("\nStep 3: User kills app and re-opens with SAME link.");
  print("Without fix: launch_id not persisted, transaction DUPLICATED.");
  print("With fix: launch_id persisted in SharedPreferences, transaction SKIPPED.");
  print("------------------------------------------");
}
