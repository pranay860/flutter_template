import 'package:app/feature/posts/my_post_page_model.dart';
import 'package:app/feature/posts/widgets/card_widget.dart';
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
          initialData: Resource.none(),
          stream: model.getMyPostsListStream,
          dataBuilder: (context, data) {
            return DataStatusWidget(
              status: data?.status ?? Status.none,
              loadingWidget: () =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: () =>
                  const Center(child: Text("Something went wrong")),
              successWidget: () => GridView.extent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 1.5,
                childAspectRatio: 0.42,
                children: data!.data!.map((e) {
                  return CardWidget(myPosts: e);
                }).toList(),
              ),
            );
          }),
    );
  }
}
