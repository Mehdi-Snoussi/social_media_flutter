class Post {
  String? title;
  String? description;
  String? image;
  bool? isLiked;
  String? avatarImage;
  String? name;

  Post(
      {this.title,
      this.image,
      this.description,
      this.isLiked = false,
      this.avatarImage,
      this.name});

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? '',
      image: json['image'],
      description: json['description'],
      isLiked: json['isLiked'],
      avatarImage: json['avatarImage'],
      name: json['name'],
    );
  }
}
