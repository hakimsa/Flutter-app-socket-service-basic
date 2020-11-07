import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Servicios/NewsServices.dart';
import 'Servicios/SocketService.dart';
import 'Views/HomePage.dart';
import 'Views/SessionUser.dart';
import 'Views/Setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceSocket()),
        ChangeNotifierProvider(create: (_) => NewsServices())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IAXAPP',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'session': (BuildContext context) => SessionUser(),
          "setting": (context) => Setting()
        },
      ),
    );
  }
}
