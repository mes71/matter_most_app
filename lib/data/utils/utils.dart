import 'package:flutter/foundation.dart';

extension Loger on String {
  void toSuccessPrint() => _printSuccess(this);

  void toWarningPrint() => _printWarning(this);

  void toErrorPrint() => _printError(this);
}

void _printWarning(String text) {
  debugPrintThrottled('\x1B[33m$text\x1B[0m');
}

void _printError(String text) {
  debugPrintThrottled('\x1B[31m$text\x1B[0m');
}

void _printSuccess(String text) {
  debugPrintThrottled('\x1B[32m$text\x1B[0m');
}
