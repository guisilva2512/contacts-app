import 'package:contacts_app/android/views/editor-contact.view.dart';
import 'package:contacts_app/android/widgets/contact-list-item.widget.dart';
import 'package:contacts_app/android/widgets/serach-appbar.widget.dart';
import 'package:contacts_app/controllers/home.controller.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = new HomeController();

  @override
  void initState() {
    super.initState();
    // controller.search("");
    controller.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text("Meus Contatos"),
      //   centerTitle: true,
      //   leading: FlatButton(
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.search,
      //       color: Theme.of(context).primaryColor,
      //     ),
      //   ),
      // ),
      appBar: PreferredSize(
        child: SearchAppBar(
          controller: controller,
        ),
        preferredSize: Size.fromHeight(
          kToolbarHeight,
        ),
      ),
      // body: ListView(
      //   children: <Widget>[
      //     ListTile(
      //       // leading: Image.network("https://picsum.photos/200/300"),
      //       leading: Container(
      //         height: 48,
      //         width: 48,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(48),
      //           image: DecorationImage(
      //             image: NetworkImage("https://picsum.photos/48/48"),
      //           ),
      //         ),
      //       ),
      //       title: Text("Guilherme Silva"),
      //       subtitle: Text("(17) 99999-9999"),
      //       trailing: FlatButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => DetailsView(),
      //             ),
      //           );
      //         },
      //         child: Icon(
      //           Icons.chat,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.contacts.length,
          itemBuilder: (context, index) {
            return ContactListItem(
              model: controller.contacts[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: new ContactModel(id: 0),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
