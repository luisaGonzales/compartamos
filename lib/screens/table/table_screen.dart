import 'package:compartamos/data.dart';
import 'package:flutter/material.dart';


class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final key = new GlobalKey<ScaffoldState>();
  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();
    myController.addListener(_getUsers);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  _getUsers() {
    print(myController.text);
  }

  List<UserTitle> _buildList() {
    var _users = data;
    return _users.map((user) => new UserTitle(user)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Resumen Socio Económico"),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            height: 50.0,
            decoration: new BoxDecoration(
                color: themeData.splashColor,
                border: new Border.all(color: Colors.white70, width: 1.0),
                borderRadius: new BorderRadius.circular(12.0)),
            child: TextField(
              autofocus: true,
              controller: myController,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  border: InputBorder.none,
                  suffixIcon: new Icon(Icons.search),
                  hintText: "Buscar",
                  labelStyle: new TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: new ListView(children: _buildList())
          )
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.person_add),
            title: new Text('Registrar'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), title: Text('Salir'))
        ],
      ),
    );
  }
}

class UserTitle extends StatelessWidget {
  final Map _user;
  const UserTitle(this._user);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: new BorderSide(color: themeData.dividerColor))),
      child: new ListTile(
          trailing: Text("${_user["amount"]}"),
          title: Text("${_user["name"]}"),
          leading: Text("${_user["date"]}"),
      )
    );
  }
}