class Category {
  String name;
  String avatar;
  num id;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'avatar': this.avatar,
      "id":this.id
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      id:map['id'] as num

    );
  }

  Category({required this.name, required this.avatar,required this.id});
}