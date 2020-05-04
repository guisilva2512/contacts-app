import 'package:contacts_app/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchAppBar extends StatelessWidget {
  final HomeController controller;

  SearchAppBar({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Observer(
        builder: (_) =>
            controller.showSearch ? TextFormField() : Text("Meus Contatos"),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
