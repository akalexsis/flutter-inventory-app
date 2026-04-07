import 'package:flutter/material.dart';
import '../firestoneService.dart';
import '../model/itemModel.dart';

class AddItem extends StatefulWidget {
    const AddItem({super.key});

    @override
    State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
    final Service _service = Service();

    final _formKey = GlobalKey<FormState>();
    
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final TextEditingController _imageController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();

    // clear all fields after successful submission
    void _resetForm() {
        setState(() {
            _nameController.text = '';
            _descController.text = '';
            _imageController.text = '';
            _priceController.text = '';
        });
    }
    
    void _addItem(Item item) async {
        await _service.addItem(item);
        print('new Item created');
    }


    @override
    void dispose() {
        _nameController.dispose();
        _descController.dispose();
        _imageController.dispose();
        _priceController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Form(
            key: _formKey,
            child: Column(
                children: [
                const Text(
                    'Add Item',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // ITEM NAME
                TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'Item Name',
                        border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                        return 'Please enter a name for the item'; 
                    }
                        return null;
                    },
                ),
                const SizedBox(height: 16),
                
                // Desc Field
                TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(
                        labelText: 'Item description ...',
                        border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                        return 'Please add a description for your item';
                    }
                        return null;
                    },
                ),
                const SizedBox(height: 16),
                
                // Image
                TextFormField(
                    controller: _imageController,
                    decoration: InputDecoration(
                        labelText: 'Add image URL here',
                        border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                        return 'Please upload a valid image URL'; 
                    }
                        return null;
                    },
                ),
                const SizedBox(height: 16),

                TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        labelText: 'Enter item price',
                        border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                        }
                        return null;
                    }
                ),
                const SizedBox(height: 24),
                
                //  Sign Up Button
                ElevatedButton(
                    onPressed: () {
                    if (_formKey.currentState!.validate()) { 
                        double parsePrice = double.parse(_priceController.text);

                        // create new Item model to send to firebase
                        final newItem = Item(
                            name: _nameController.text,
                            desc: _descController.text,
                            imageUrl: _imageController.text,
                            price: parsePrice,
                        );

                        _resetForm();
                        _addItem(newItem);
                        }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                        'Add Item',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}