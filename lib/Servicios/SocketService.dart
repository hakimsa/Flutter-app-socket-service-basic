import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServiceStatus { Online, OffLine, Connecting }

class ServiceSocket with ChangeNotifier {
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
  }
}
