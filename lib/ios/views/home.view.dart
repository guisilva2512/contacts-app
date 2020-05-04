import 'package:contacts_app/ios/styles.dart';
import 'package:contacts_app/ios/views/details.view.dart';
import 'package:contacts_app/ios/views/editor-contact.view.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   return CupertinoPageScaffold(
    //     // appbar
    //     navigationBar: CupertinoNavigationBar(
    //       middle: Text("Aqui titulo"),
    //     ),
    //     child: Container(
    //       child: Center(
    //         child: Text("Home"),
    //       ),
    //     ),
    //   );

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Meus Contatos"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorContactView(),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoTextField(
                    placeholder: "Pesquisar ...",
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: ListView( // Fica com dois scrolls
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://picsum.photos/48/48"),
                                ),
                                borderRadius: BorderRadius.circular(48),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Guilherme Silva",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "(17) 99999-9999",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CupertinoButton(
                              child: Icon(
                                CupertinoIcons.person,
                                color: primaryColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => DetailsView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
