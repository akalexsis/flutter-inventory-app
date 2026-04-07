import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestoneService.dart';
import '../model/itemModel.dart';
import '../screens/addItem.dart';

class ViewItem extends StatefulWidget {
    const ViewItem({super.key});

    @override
    State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
    final Service _service = Service();

    void _editItem() {
        print('edit item');
    }

    void _deleteItem(String id) async {
        await _service.deleteItem(id);
        
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have successfully deleted a product')),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Products', textAlign: TextAlign.center),
            ),
            body: StreamBuilder(
                stream: _service.getItems(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                    return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                            title: Text(documentSnapshot['name']),
                            subtitle: Text('\$${documentSnapshot['price'].toString()}'),
                            trailing: SizedBox(
                            width: 100,
                            child: Row(
                                children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () { _editItem(); },
                                ),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () { _deleteItem(documentSnapshot.id); },
                                ),
                                ],
                            ),
                            ),
                        ),
                        );
                    },
                    );
                }
                return const Center(child: CircularProgressIndicator());
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddItem()),
                    );
                },
                child: const Icon(Icons.add),
            ),
    );
  }
}