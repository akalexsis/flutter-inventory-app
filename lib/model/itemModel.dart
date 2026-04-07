class Item {
  final int? id;
  final String name;
  final String desc;
  final String imageUrl;
  final double price;                 

  Item({ 
    this.id,
    required this.name,
    required this.imageUrl, 
    required this.desc, 
    required this.price,                   
  });

  // map to match database columns with model
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': imageUrl,
      'desc': desc,
      'price': price,                                  
    };
  }

  // convert records to objects
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'], 
      imageUrl: map['image'],  
      desc: map['desc'], 
      price: map['price'], 
    ); 
  }
  
  // update object when record has been updated
  Item copyWith({ 
    int? id,
    String? name,
    String? imageUrl, 
    String? desc,
    double? price,                  
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl, 
      desc: desc ?? this.desc, 
      price: price ?? this.price, 
    );
  }
}