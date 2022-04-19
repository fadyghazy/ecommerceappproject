class Product{

  String name;
  int id;
  String title;
  num price;
  num discount;
  String currency;
  num in_stock;
  String avatar;
  num price_final;
  String price_final_text;

    Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'id': this.id,
      'title': this.title,
      'price': this.price,
      'discount': this.discount,
      'currency': this.currency,
      'in_stock': this.in_stock,
      'avatar': this.avatar,
      'price_final': this.price_final,
      'price_final_text': this.price_final_text,
      };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      discount: map['discount'] as num,
      currency: map['currency'] as String,
      in_stock: map['in_stock'] as num,
      avatar: map['avatar'] as String,
      price_final: map['price_final'] as num,
      price_final_text: map['price_final_text'] as String,


    );
  }

  Product({
    required this.name,
    required  this.id,
    required this.title,
    required this.price,
    required this.discount,
    required  this.currency,
    required this.in_stock,
    required this.avatar,
    required this.price_final,
    required this.price_final_text,
    

  });
}