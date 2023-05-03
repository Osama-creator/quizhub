import 'dart:developer';

void catchLog(Object e, StackTrace st) {
  log('[error] => $e');
  log('[error stack trace] => $st');
}
