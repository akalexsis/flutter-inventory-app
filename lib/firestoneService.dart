import '../model/itemModel.dart';

class Service{
    // perform CRUD operations on products document
    final itemsRef = FirebaseFirestore.instance.collection('proucts');

    Future<void> addItem(Item item) async {
    await itemsRef.add(item.toMap());
    }

    // Stream<List<Item>> streamItems() {
    //   return itemsRef.snapshots().map(
    //     (snap) => snap.docs.map((d) => Item.fromMap(d.id, d.data())).toList(),
    //   );
    // }
}
