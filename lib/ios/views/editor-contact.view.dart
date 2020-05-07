import 'package:contacts_app/ios/views/home.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:contacts_app/repositories/contact.repository.dart';
import 'package:flutter/cupertino.dart';

class EditorContactView extends StatefulWidget {
  final ContactModel model;

  EditorContactView({@required this.model});

  @override
  _EditorContactViewState createState() => _EditorContactViewState();
}

class _EditorContactViewState extends State<EditorContactView> {
  final _formKey = new GlobalKey<FormState>();
  final _repository = new ContactRepository();

  onSubmit() {
    // if (!_formKey.currentState.validate()) {
    //   return;
    // }

    _formKey.currentState.save();

    if (widget.model.id == 0)
      create();
    else
      update();
  }

  create() {
    widget.model.id = null;
    widget.model.image = null;

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
      CupertinoPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError() {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: Text("Falha na operação"),
          content: Text("Ops, parece que algo deu errado"),
          actions: <Widget>[
            CupertinoButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: widget.model.id == 0
                ? Text("Novo Contato")
                : Text("Editar Contato"),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CupertinoTextField(
                      placeholder: widget.model?.name ?? "Nome",
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (value) {
                        widget.model.name = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      placeholder: widget.model?.phone ?? "Telefone",
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.model.phone = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      placeholder: widget.model?.email ?? "E-mail",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        widget.model.email = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        child: Text("Salvar"),
                        onPressed: onSubmit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
