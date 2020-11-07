import 'package:flutter/material.dart';
import 'package:iaxpp/Models/NewModel.dart';
import 'package:iaxpp/Servicios/NewsServices.dart';
import 'package:iaxpp/Servicios/SocketService.dart';
import 'package:provider/provider.dart';

class SessionUser extends StatefulWidget {
  SessionUser({Key key}) : super(key: key);

  @override
  _SessionUserState createState() => _SessionUserState();
}

class _SessionUserState extends State<SessionUser> {
  List<Article> noticias = new List();

  @override
  Widget build(BuildContext context) {
    final sokectservice = Provider.of<ServiceSocket>(context);
    final newsServices = Provider.of<NewsServices>(context);

    return Scaffold(
        drawer: _menu(context), appBar: AppBar(), body: projectWidget());
  }

  _menu(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
          DrawerHeader(
            child: CircleAvatar(),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              title: Text('Ajustes'),
              onTap: () {
                // Update the state of the app.
                // ...
              })
        ]));
  }

  _list(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Table(
        children: [
          TableRow(children: [
            Column(children: [
              Icon(
                Icons.account_box,
                size: 50,
              ),
              Text('My Account')
            ]),
            Column(children: [
              Icon(
                Icons.settings,
                size: 50,
              ),
              Text('Settings')
            ]),
            Column(children: [
              Icon(
                Icons.lightbulb_outline,
                size: 50,
              ),
              Text('Ideas')
            ]),
          ]),
          TableRow(children: [
            (Container(
                child: Column(
              children: [
                FlatButton.icon(
                  icon: Icon(
                    Icons.access_alarms,
                  ),
                  label: Text(""),
                  onPressed: () {
                    Navigator.pushNamed(context, "setting");
                  },
                ),
              ],
            ))),
            Icon(
              Icons.voice_chat,
              size: 50,
            ),
            Icon(
              Icons.add_location,
              size: 50,
            ),
          ]),
        ],
      ),
    );
  }

  Widget projectWidget() {
    final newsServices = Provider.of<NewsServices>(context);
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: newsServices.handleans.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              // Widget to display the list of project
              Card(
                elevation: 10,
                child: ListTile(
                  leading: Image.network(newsServices
                              .handleans[index].urlToImage ==
                          null
                      ? "https://icons.iconarchive.com/icons/icons8/windows-8/128/City-No-Camera-icon.png"
                      : newsServices.handleans[index].urlToImage),
                  title: Text(newsServices.handleans[index].title),
                  subtitle: Text(
                      newsServices.handleans[index].publishedAt.toString()),
                ),
              )
            ]);
          },
        );
      },
      future: newsServices.getTopHeadlines(),
    );
  }
}
