import 'package:contacts_app/controllers/home.controller.dart';
import 'package:contacts_app/ios/views/editor-contact.view.dart';
import 'package:contacts_app/ios/widgets/contact-list-item.widget.dart';
import 'package:contacts_app/models/contact.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: searchAppBar(
        controller,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (ctx, i) {
              return ContactListItem(
                model: controller.contacts[i],
              );
            },
          ),
        ),
      ),
    );

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

    // return CupertinoPageScaffold(
    //   child: CustomScrollView(
    //     slivers: <Widget>[
    //       CupertinoSliverNavigationBar(
    //         largeTitle: Text("Meus Contatos"),
    //         trailing: CupertinoButton(
    //           child: Icon(CupertinoIcons.add),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               CupertinoPageRoute(
    //                 builder: (context) => EditorContactView(
    //                   model: ContactModel(
    //                     id: 0,
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //       SliverFillRemaining(
    //         child: Column(
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: CupertinoTextField(
    //                 placeholder: "Pesquisar ...",
    //               ),
    //             ),
    //             Expanded(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 // child: ListView( // Fica com dois scrolls
    //                 child: Column(
    //                   children: <Widget>[
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: <Widget>[
    //                         Container(
    //                           height: 48,
    //                           width: 48,
    //                           decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                               image: NetworkImage(
    //                                   "https://picsum.photos/48/48"),
    //                             ),
    //                             borderRadius: BorderRadius.circular(48),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           child: Container(
    //                             padding: EdgeInsets.symmetric(horizontal: 8),
    //                             child: Column(
    //                               children: <Widget>[
    //                                 Text(
    //                                   "Guilherme Silva",
    //                                   style: TextStyle(
    //                                     fontSize: 20,
    //                                   ),
    //                                 ),
    //                                 Text(
    //                                   "(17) 99999-9999",
    //                                   style: TextStyle(
    //                                     fontSize: 14,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         CupertinoButton(
    //                           child: Icon(
    //                             CupertinoIcons.person,
    //                             color: primaryColor,
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                               context,
    //                               CupertinoPageRoute(
    //                                 builder: (context) => DetailsView(
    //                                   id: 0,
    //                                 ),
    //                               ),
    //                             );
    //                           },
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }

  Widget searchAppBar(HomeController controller) {
    // CupertinoNavigationBar: appBar do cupertino
    return CupertinoNavigationBar(
      middle: Observer(
        builder: (_) => controller.showSearch
            ? CupertinoTextField(
                autofocus: true,
                placeholder: "Pesquisar ...",
                onSubmitted: (val) => controller.search(val),
              )
            : Text("Meus Contatos"),
      ),
      leading: GestureDetector(
        onTap: () {
          if (controller.showSearch) controller.getContacts();
          controller.toggleSearch();
        },
        child: Observer(
          builder: (_) => Icon(
            controller.showSearch
                ? CupertinoIcons.clear
                : CupertinoIcons.search,
          ),
        ),
      ),
      trailing: GestureDetector(
        child: Icon(
          CupertinoIcons.add,
        ),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => EditorContactView(
                model: ContactModel(id: 0),
              ),
            ),
          );
        },
      ),
    );
  }
}
