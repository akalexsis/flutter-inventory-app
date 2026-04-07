import '../model/itemModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service{
    // perform CRUD operations on products document
    final CollectionReference _products = FirebaseFirestore.instance.collection('proucts');

    Future<void> addItem(Item item) async {
        await _products.add(item.toMap());
    }

    // Stream<List<Item>> streamItems() {
    //   return itemsRef.snapshots().map(
    //     (snap) => snap.docs.map((d) => Item.fromMap(d.id, d.data())).toList(),
    //   );
    // }
}
