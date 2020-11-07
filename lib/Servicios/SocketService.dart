import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServiceStatus { Online, OffLine, Connecting }

class ServiceSocket with ChangeNotifier {
  var now = new DateTime.now();
  var mesaj = "";
  ServiceStatus _skocektstatus = ServiceStatus.Connecting;

  get status => this._skocektstatus;

  ServiceSocket() {
    this.initConfig();
  }

  void initConfig() {
    IO.Socket socket = IO.io('http://localhost:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.emit('mensaje', {
      " Flutter app conectada " +
          now.toString() +
          " :" +
          _skocektstatus.toString()
    });
    // opt
    socket.on('connect', (_) {
      print('connectado ');
      this._skocektstatus = ServiceStatus.Online;
      ChangeNotifier();
    });
    // socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) {
      print('desconnectado  ');
      this._skocektstatus = ServiceStatus.OffLine;

      ChangeNotifier();
    });

    // socket.on('fromServer', (_) => print(_));
    socket.on(
        'mensaje', (payload) => {mesaj = payload.toString(), print(payload)});

    socket.emit('desc', {
      " Flutter app desconectada " +
          now.toString() +
          this._skocektstatus.toString()
    });
  }
}
