import 'package:app/feature/tabs/home/widgets/timer_widget/count_down_timer_widget.dart';
import 'package:app/feature/tabs/home/widgets/timer_widget/count_down_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../../utils/asset_icons.dart';

class WhetherItemWidget extends StatelessWidget {
  bool? isLastItem;
  String? city;
  String? temperature;

  WhetherItemWidget({Key? key, this.isLastItem, this.city, this.temperature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 25, right: (isLastItem ?? false) ? 25 : 0),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(231, 237, 247, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    city ?? '',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "${temperature ?? ''}\u00B0",
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 20, 126, 1),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const Image(
                image: AssetIcons.sunCloudAngledRain,
                height: 130,
                width: 140,
              ),
            ],
          ),
          Expanded(
            child: BaseWidget<CountDownViewModel>(
                providerBase:
                ChangeNotifierProvider<CountDownViewModel>(
                      (ref) =>
                      CountDownViewModel(Duration(hours: DateTime
                          .now()
                          .hour, minutes: DateTime
                          .now()
                          .minute, seconds: DateTime
                          .now().
                          second)),
                ),
                onModelReady: (model) {
                  model.startTimer();
                },
                builder: (context, model, child) {
                  return CountDownTimerWidget(
                    timerController: model?.timerController,);
                }),
          )
        ],
      ),
    );
  }
}
