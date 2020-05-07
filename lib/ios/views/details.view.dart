import 'package:contacts_app/ios/styles.dart';
import 'package:contacts_app/ios/views/address.view.dart';
import 'package:contacts_app/ios/views/editor-contact.view.dart';
import 'package:contacts_app/ios/views/home.view.dart';
import 'package:contacts_app/ios/views/loading.view.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:contacts_app/repositories/contact.repository.dart';
import 'package:contacts_app/shared/widgets/contact-details-description.widget.dart';
import 'package:contacts_app/shared/widgets/contact-details-image.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatefulWidget {
  final int id;

  DetailsView({@required this.id});

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final _repository = ContactRepository();

  onDelete() {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: Text("Exclusão de Contato"),
          content: Text("Deseja excluir este contato?"),
          actions: <Widget>[
            CupertinoButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: Text("Excluir"),
              onPressed: delete,
            ),
          ],
        );
      },
    );
  }

  delete() {
    _repository.delete(widget.id).then((_) {
      onSuccess();
    }).catchError((err) {
      onError(err);
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError(err) {
    print(err);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getContact(widget.id),
      builder: (ctx, snp) {
        if (snp.hasData) {
          return page(context, snp.data);
        } else {
          return LoadingView();
        }
      },
    );
  }

  Widget page(BuildContext context, ContactModel model) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Contato"),
            trailing: GestureDetector(
              child: Icon(
                CupertinoIcons.pen,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorContactView(
                      model: model,
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
                  height: 10,
                  width: double.infinity,
                ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: primaryColor.withOpacity(0.1),
                //     borderRadius: BorderRadius.circular(200),
                //   ),
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100),
                //       image: DecorationImage(
                //         image: NetworkImage("https://picsum.photos/200/200"),
                //       ),
                //     ),
                //   ),
                // ),
                ContactDetailsImage(image: model.image),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Guilherme Silva",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   "(17) 99999-9999",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // Text(
                //   "guisilva2512@gmail.com",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
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
                    CupertinoButton(
                      color: primaryColor,
                      onPressed: () {
                        launch("tel:${model.phone}");
                      },
                      child: Icon(
                        CupertinoIcons.phone,
                      ),
                    ),
                    CupertinoButton(
                      color: primaryColor,
                      onPressed: () {
                        launch("mailto:${model.email}");
                      },
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
                              model.addressLine1 ??
                                  "Nenhum endereço cadastrado",
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
                        child: Icon(
                          CupertinoIcons.location,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton.filled(
                  child: Text("Excluir Contato"),
                  onPressed: onDelete,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
