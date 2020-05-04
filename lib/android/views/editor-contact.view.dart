import 'package:contacts_app/android/views/home.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:contacts_app/repositories/contact.repository.dart';
import 'package:flutter/material.dart';

class EditorContactView extends StatefulWidget {
  final ContactModel model;

  EditorContactView({@required this.model});

  @override
  _EditorContactViewState createState() => _EditorContactViewState();
}

class _EditorContactViewState extends State<EditorContactView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repository = new ContactRepository();

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    if (widget.model.id == 0)
      create();
    else
      update();
  }

  create() {
    _repository.create(widget.model).then((_) {
      onSucess();
    }).catchError((_) {
      onError();
    });
  }

  update() {
    _repository.update(widget.model).then((_) {
      onSucess();
    }).catchError((_) {
      onError();
    });
  }

  onSucess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError() {
    final snackBar = SnackBar(content: Text("Ops, algo deu erroado"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: widget.model.id == 0
            ? Text("Novo Contato")
            : Text("Editar Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.model?.name,
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                onChanged: (value) {
                  widget.model.name = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Nome inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: widget.model?.phone,
                decoration: InputDecoration(
                  labelText: "Telefone",
                ),
                onChanged: (value) {
                  widget.model.phone = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Telefone inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: widget.model?.email,
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                onChanged: (value) {
                  widget.model.email = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "E-mail inválido";
                  }
                  return null;
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
                  onPressed: onSubmit,
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
