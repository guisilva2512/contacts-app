import 'package:contacts_app/android/views/details.view.dart';
import 'package:contacts_app/android/views/editor-contact.view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Meus Contatos"),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () {},
          child: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            // leading: Image.network("https://picsum.photos/200/300"),
            leading: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/48/48"),
                ),
              ),
            ),
            title: Text("Guilherme Silva"),
            subtitle: Text("(17) 98183-4173"),
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsView(),
                  ),
                );
              },
              child: Icon(
                Icons.chat,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditorContactView()));
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
