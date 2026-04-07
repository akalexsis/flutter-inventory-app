import '../model/itemModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service{
    // perform CRUD operations on products document
    final CollectionReference _products = FirebaseFirestore.instance.collection('proucts');

    Future<void> addItem(Item item) async {
        await _products.add(item.toMap());
    }

    Stream<QuerySnapshot> getItems() {
    //   return _products.snapshots().map(
    //     (snap) => snap.docs.map((d) => Item.fromMap(d.id, d.data())).toList(),
    //   );

        return _products.snapshots();
    }

    Future<void> deleteItem(String itemId) async {
        await _products.doc(itemId).delete();
    }
}
