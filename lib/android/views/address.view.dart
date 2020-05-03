import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Endereço do Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            child: ListTile(
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
            ),
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Pesquisar ..."),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.my_location),
      ),
    );
  }
}
