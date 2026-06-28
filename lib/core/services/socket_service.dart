import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void connect() {
    if (_isConnected) return;

    final userId = LocalStorageService.getId();

    socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableReconnection()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("Socket Connected");

      _isConnected = true;

      if (userId != null) {
        socket.emit("identify", userId);

        print("Identify emitted for user: $userId");
      }
    });

    socket.onDisconnect((_) {
      print("Socket Disconnected");

      _isConnected = false;
    });

    socket.onReconnect((_) {
      print("Socket Reconnected");

      if (userId != null) {
        socket.emit("identify", userId);
      }
    });

    socket.onConnectError((error) {
      print("Socket Error: $error");
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
    socket.disconnect();

    socket.dispose();

    _isConnected = false;
  }
}
