import 'dart:html' as html;

typedef TabVisibilityCallback = void Function(bool isVisible);

class TabVisibilityMonitor {
  static final TabVisibilityMonitor _instance = TabVisibilityMonitor._internal();

  factory TabVisibilityMonitor() => _instance;

  final List<TabVisibilityCallback> _listeners = [];

  bool _isListening = false;

  TabVisibilityMonitor._internal();

  bool get isVisible => !html.document.hidden!;

  void addListener(TabVisibilityCallback callback) {
    _listeners.add(callback);
    _startListening();
  }

  void removeListener(TabVisibilityCallback callback) {
    _listeners.remove(callback);
  }

  void _startListening() {
    if (_isListening) return;
    _isListening = true;

    html.document.onVisibilityChange.listen((event) {
      final isVisibleNow = !html.document.hidden!;
      for (final callback in _listeners) {
        callback(isVisibleNow);
      }
    });
  }
}
