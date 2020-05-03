import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/material.dart';

class EditorContactView extends StatelessWidget {
  final ContactModel model;

  EditorContactView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: model == null ? Text("Novo Contato") : Text("Editar Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: model?.name,
                onSaved: (value) {
                  model.name = value;
                },
              ),
              TextFormField(
                initialValue: model?.phone,
                onSaved: (value) {
                  model.phone = value;
                },
              ),
              TextFormField(
                initialValue: model?.email,
                onSaved: (value) {
                  model.email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
