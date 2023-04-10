class MyPosts {
  MyPosts({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;
}
