import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_posts_response.g.dart';

@JsonSerializable()
class MyPostsResponseEntity
    implements BaseLayerDataTransformer<MyPostsResponseEntity, MyPosts> {
  MyPostsResponseEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingEntity,
  });
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "rating")
  final RatingEntity ratingEntity;

  factory MyPostsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MyPostsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyPostsResponseEntityToJson(this);

  @override
  MyPostsResponseEntity restore(MyPosts data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  MyPosts transform() {
    return MyPosts(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: ratingEntity.transform());
  }
}

@JsonSerializable()
class RatingEntity implements BaseLayerDataTransformer<RatingEntity, Rating> {
  RatingEntity({
    required this.rate,
    required this.count,
  });
  @JsonKey(name: "rate")
  final double rate;
  @JsonKey(name: "count")
  final int count;

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RatingEntityToJson(this);

  @override
  RatingEntity restore(Rating data) {
    throw UnimplementedError();
  }

  @override
  Rating transform() {
    return Rating(rate: rate, count: count);
  }
}
