import 'package:contacts_app/models/contact.model.dart';
import 'package:contacts_app/repositories/contact.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

// flutter packages pub run build_runner clean
// flutter packages pub run build_runner build
class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool showSearch = false;

  @observable
  ObservableList<ContactModel> contacts = new ObservableList<ContactModel>();

  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    final repository = new ContactRepository();
    contacts = new ObservableList<ContactModel>();
    var data = await repository.search(term);
    contacts.addAll(data);
  }
}
