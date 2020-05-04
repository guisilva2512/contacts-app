import 'package:contacts_app/ios/styles.dart';
import 'package:contacts_app/ios/views/address.view.dart';
import 'package:contacts_app/ios/views/editor-contact.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Contato"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.pen),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorContactView(
                      model: ContactModel(
                        id: "1",
                        name: "Guilherme Silva",
                        phone: "(17) 99999-9999",
                        email: "guisilva2512@gmail.com",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Container(
                  height: 200,
                  width: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
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
                  "(17) 99999-9999",
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
                    CupertinoButton(
                      color: primaryColor,
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.phone,
                      ),
                    ),
                    CupertinoButton(
                      color: primaryColor,
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.mail,
                      ),
                    ),
                    CupertinoButton(
                      color: primaryColor,
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.photo_camera,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                            ),
                            Text(
                              "Endereço",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddressView(),
                            ),
                          );
                        },
                        child: Icon(CupertinoIcons.location),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
