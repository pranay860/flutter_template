import 'package:app/feature/posts/my_post_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/widget/data_status_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class MyPostPageView extends BasePageViewWidget<MyPostsViewModel> {
  MyPostPageView(ProviderBase<MyPostsViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, MyPostsViewModel model) {
    return Scaffold(
      body: AppStreamBuilder<Resource<List<MyPosts>>>(
          initialData: Resource.loading(),
          stream: model.getMyPostsListStream,
          dataBuilder: (context, data) {
            return DataStatusWidget(
                status: data?.status ?? Status.none,
                loadingWidget: () =>
                    const Center(child: CircularProgressIndicator()),
                successWidget: () => GridView.extent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 1.5,
                    childAspectRatio: 0.42,
                    children: data!.data!.map((e) {
                      return Container(
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 300,
                                  width: double.infinity,
                                  child: Image.network(
                                    e.image,
                                    fit: BoxFit.contain,
                                  )),
                              Row(children: [
                                const Text("₹ "),
                                Text(e.price.toStringAsFixed(2),
                                    style:
                                        Theme.of(context).textTheme.labelLarge)
                              ]),
                              const SizedBox(height: 5),
                              Text(
                                e.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(e.category),
                              const SizedBox(height: 5),
                              RatingBar.builder(
                                initialRating: e.rating.rate,
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
                                e.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()));
          }),
    );
  }
}
