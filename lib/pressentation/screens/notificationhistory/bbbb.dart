

abstract class Observable {
  void invoke(String method, [Map<String, dynamic>? args]);
  Stream<Map<String, dynamic>?> on(String method);
}

abstract class ServiceInstance implements Observable {
  /// Stop the service
  Future<void> stopSelf();
}