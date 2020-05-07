import 'package:contacts_app/android/views/address.view.dart';
import 'package:contacts_app/android/views/editor-contact.view.dart';
import 'package:contacts_app/android/views/home.view.dart';
import 'package:contacts_app/android/views/loading.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:contacts_app/repositories/contact.repository.dart';
import 'package:contacts_app/shared/widgets/contact-details-description.widget.dart';
import 'package:contacts_app/shared/widgets/contact-details-image.widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  final int id;
  final _repository = ContactRepository();

  DetailsView({@required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getContact(id),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          ContactModel contact = snapshot.data;
          return page(context, contact);
        } else {
          return LoadingView();
        }
      },
    );
  }

  Widget page(BuildContext context, ContactModel model) {
    onSuccess() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    }

    delete() {
      _repository.delete(id).then((onValue) {
        onSuccess();
      }).catchError((onError) {
        onError(onError);
      });
    }

    onError(err) {
      print(err);
    }

    onDelete() {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Exclusão Contato"),
            content: Text("Deseja excluir este contato?"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: delete,
                child: Text("Excluir"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          ContactDetailsImage(image: model.image),
          SizedBox(
            height: 10,
          ),
          ContactDetailsDescription(
            name: model.name,
            phone: model.phone,
            email: model.email,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  launch("tel:${model.phone}");
                },
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  launch("mailto:${model.email}");
                },
                child: Icon(
                  Icons.email,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                onPressed: () {},
                child: Icon(
                  Icons.camera_enhance,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Endereço",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.addressLine1 ?? "Nenhum endereço cadastrado",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  model.addressLine2 ?? "",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressView(),
                  ),
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          // SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              // height: 50,
              color: Color(0xFFFF0000),
              child: FlatButton(
                onPressed: onDelete,
                child: Text(
                  "Excluir Contato",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: model,
              ),
            ),
          );
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
