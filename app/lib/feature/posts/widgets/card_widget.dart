import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardWidget extends StatelessWidget {
  final MyPosts myPosts;
  const CardWidget({super.key, required this.myPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                myPosts.image,
                fit: BoxFit.contain,
              )),
          Row(children: [
            const Text("₹ "),
            Text(myPosts.price.toStringAsFixed(2),
                style: Theme.of(context).textTheme.labelLarge)
          ]),
          const SizedBox(height: 5),
          Text(
            myPosts.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(myPosts.category),
          const SizedBox(height: 5),
          RatingBar.builder(
            initialRating: myPosts.rating.rate,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 20,
            ignoreGestures: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(height: 5),
          Text(
            myPosts.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
