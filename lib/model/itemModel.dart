class Item {
  final String name;
  final String desc;
  final String imageUrl;
  final double price;                 

  Item({ 
    required this.name,
    required this.imageUrl, 
    required this.desc, 
    required this.price,                   
  });

  // map to match database columns with model
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': imageUrl,
      'desc': desc,
      'price': price,                                  
    };
  }

  // convert records to objects
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'], 
      imageUrl: map['image'],  
      desc: map['desc'], 
      price: map['price'], 
    ); 
  }
  
  // update object when record has been updated
  Item copyWith({ 
    String? name,
    String? imageUrl, 
    String? desc,
    double? price,                  
  }) {
    return Item(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl, 
      desc: desc ?? this.desc, 
      price: price ?? this.price, 
    );
  }
}