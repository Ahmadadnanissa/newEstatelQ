import 'package:estatelqapp/core/services/constants.dart';
import 'package:estatelqapp/core/services/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketService {
  IO.Socket? _socket;

  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void connect() {
    if (_isConnected) {
      return;
    }

    final token = LocalStorageService.getToken();

    print('CHAT SOCKET: token exists = ${token != null && token.isNotEmpty}');
    if (token == null || token.isEmpty) {
      print('Chat Socket: JWT token not found');
      return;
    }

    _socket?.dispose();

    _socket = IO.io(
      '$baseUrl/chat',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .enableReconnection()
          .build(),
    );
    print('CHAT SOCKET: socket instance created');

    print('CHAT SOCKET: calling socket.connect()');
    _socket!.onConnect((_) {
      _isConnected = true;

      print('Chat Socket Connected');
    });

    _socket!.onDisconnect((reason) {
      _isConnected = false;

      print('Chat Socket Disconnected: $reason');
    });

    _socket!.onReconnect((attempt) {
      _isConnected = true;

      print('Chat Socket Reconnected - attempt: $attempt');
    });

    _socket!.onConnectError((error) {
      _isConnected = false;

      print('Chat Socket Connect Error: $error');
      print('ERROR: $error');
      print('TYPE: ${error.runtimeType}');
      print('================================================');
    });
    _socket!.onError((error) {
      print('========== CHAT SOCKET ERROR ==========');
      print(error);
      print('=======================================');
    });

    _socket!.connect();
  }

  void onMessageCreated(void Function(Map<String, dynamic> data) callback) {
    _socket?.off('messageCreated');

    _socket?.on('messageCreated', (data) {
      if (data is Map) {
        callback(Map<String, dynamic>.from(data));
      }
    });
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();

    _socket = null;
    _isConnected = false;

    print('Chat Socket Disconnected');
  }
}
