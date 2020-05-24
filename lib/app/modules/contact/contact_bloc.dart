import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';
import 'package:fluttersampleapp/app/modules/shared/repository/contact_repository.dart';
import 'package:fluttersampleapp/app/utils/answer.dart';
import 'package:fluttersampleapp/app/utils/story.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc extends Disposable {
  final ContactRepository contactRepository=
      ContactModule.to.get<ContactRepository>();

  List<Contact> contacts;
  Contact contact;
  bool searchButton= false;
  bool showSearch= false;

  BehaviorSubject<List<Contact>> _listContactController;
  BehaviorSubject<Contact> _contactController;
  BehaviorSubject<bool> _searchButtonController;
  BehaviorSubject<bool> _searchController;

  ContactBloc() {
    Story.storyline(story: "ContactBloc()");
    _listContactController= BehaviorSubject.seeded(contacts);
    _contactController= BehaviorSubject.seeded(contact);
    _searchButtonController= BehaviorSubject.seeded(searchButton);
    _searchController= BehaviorSubject.seeded(showSearch);
  }

  Stream<List<Contact>> get listContactOut => _listContactController.stream;
  Stream<Contact> get contactOut => _contactController.stream;
  Stream<bool> get searchOut => _searchController.stream;
  Stream<bool> get buttonSearchOut => _searchButtonController.stream;

  setVisibleButtonSearch(bool visible) {
    //_searchButtonController.sink.add(visible);
    _searchButtonController.add(visible);
  }

  setContact(Contact contact) {
    _contactController.sink.add(contact);
  }

  Future<Answer> fetchContactList({
      bool distinct, List<String> columns,
      String where, List whereArgs,
      String groupBy, String having,
      String orderBy,
      int limit, int offset
    }) async {
    //Story.storyline(story: "ContactBloc.fetchContactList[+]");
    Answer A= await contactRepository.fetch(
        distinct: distinct, columns: columns, where: where,
        whereArgs: whereArgs, groupBy: groupBy, having: having,
        orderBy: orderBy, limit: limit, offset: offset
    );
    _listContactController.sink.add(A.data);
    //Story.storyline(story: "ContactBloc.fetchContactList[-]");
    return A;
  }

  Future<Answer> fetchContactListBySearch(String keywords) async {
    //Story.storyline(story: "ContactBloc.fetchContactListBySearch[+]");
    //Story.storyline(story: "ContactBloc.fetchContactListBySearch keywords", args: [keywords]);
    keywords= "%$keywords%";
    Answer A= await fetchContactList(
      where: "name LIKE ? OR phone LIKE ? OR email LIKE ?",
      whereArgs: [keywords, keywords, keywords]
    );
    //Story.storyline(story: "ContactBloc.fetchContactListBySearch[-]");
    return A;
  }

  Future<Answer> insertContact(Contact contact) async {
    Answer A= await contactRepository.insert(contact);
    fetchContactList();
    return A;
  }

  Future<Answer> updateContact(Contact contact) async {
    Answer A= await contactRepository.update(contact);
    fetchContactList();
    return A;
  }

  Future<Answer> deleteContact(Contact contact) async {
    Answer A= await contactRepository.delete(contact);
    fetchContactList();
    return A;
  }

  @override
  void dispose() {
    _listContactController.close(); _listContactController= null;
    _contactController.close(); _contactController= null;
    _searchButtonController.close(); _searchButtonController= null;
    _searchController.close(); _searchController= null;
    contacts= contact= searchButton= showSearch= null;
    Story.storyline(story: "ContactBloc.dispose()");
  }
}
