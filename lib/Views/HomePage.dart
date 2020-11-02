import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final TextEditingController _emailController =
      new TextEditingController();
  static final TextEditingController _passwrdController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Redex'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[Icon(Icons.person)],
      ),
      body: Center(
          child: ListView(
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.all(45),
            child: _formLogin(context),
          )
        ],
      )),
    );
  }

  _formLogin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 10,
          child: Column(
            children: [
              SizedBox(
                height: 34,
                child: Image.network(
                    "https://icons.iconarchive.com/icons/webiconset/application/64/Register-icon.png"),
              ),
              Container(
                margin: EdgeInsets.all(25),
                width: 300,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Enter your Email'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                width: 300,
                child: TextFormField(
                  controller: _passwrdController,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), labelText: 'Enter your Password'),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              _btnLogi(context)
            ],
          ),
        )
      ],
    );
  }

  _btnLogi(BuildContext context) {
    return FlatButton.icon(
      label: Text("Login"),
      icon: Icon(Icons.login_rounded),
      color: Colors.blueAccent,
      onPressed: () {
        _showdialg(context);
      },
    );
  }

  _showdialg(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => new CupertinoAlertDialog(
        title: new Text(
            _emailController.text == null ? "???" : _emailController.text),
        content: new Text(
          "Email o contraseña no es correcto",
          style: TextStyle(color: Colors.redAccent),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Verificalo por favor!'),
            onPressed: () {
              Navigator.pushNamed(context, "session");
            },
          )
        ],
      ),
    );
  }
}
