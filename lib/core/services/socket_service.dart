import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  bool _isConnected = false;

  void connect() {
    if (_isConnected) return;

    final id = LocalStorageService.getId();
    final userType = LocalStorageService.getUserType();

    socket = IO.io(
      'http://your-server-url',

      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({"id": id, "userType": userType})
          .enableReconnection()
          .enableForceNew()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      _isConnected = true;
    });

    socket.onDisconnect((_) {
      _isConnected = false;
    });

    socket.onConnectError((e) {
      print(e);
    });
  }

  void listen(String event, Function(dynamic) callback) {
    socket.off(event);

    socket.on(event, callback);
  }

  void emit(String event, dynamic data) {
    socket.emit(event, data);
  }

  void disconnect() {
    socket.dispose();

    _isConnected = false;
  }
}
