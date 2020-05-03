import 'package:contacts_app/android/views/address.view.dart';
import 'package:contacts_app/android/views/editor-contact.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(200),
            ),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200/200"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Guilherme Silva",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "(17) 98183-4173",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "guisilva2512@gmail.com",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
                onPressed: () {},
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
                onPressed: () {},
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
                  "Rua Olava Guimarães Correa, 492",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "São José do Rio Preto - SP",
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: ContactModel(
                    id: "1",
                    name: "Guilherme Silva",
                    phone: "(17) 98183-4173",
                    email: "guisilva2512@gmail.com"),
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
